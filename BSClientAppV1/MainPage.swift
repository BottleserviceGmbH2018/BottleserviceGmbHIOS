//
//  MainPage.swift
//  BSClientAppV1
//
//  Created by David Olarte on 03.05.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import MaterialShowcase
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import SDWebImage
import GoogleSignIn
var justOnce:Bool = false

class MainPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.cvLounge {
              return loungeImage.count
        } else if collectionView == self.cvBar {
            return barImage.count
        } else {
            return eventImage.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.cvLounge {
        let LoungeCell = cvLounge.dequeueReusableCell(withReuseIdentifier: "cellLounge", for: indexPath) as! cImageCollectionViewCell
        let image = loungeImage[indexPath.row]
        LoungeCell.LoungeImageView.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "bottle service dave"))
            
            LoungeCell.lblLounges.text = loungeImage[indexPath.row].locTitle
            LoungeCell.lblAddress.text = loungeImage[indexPath.row].locAdd1
            LoungeCell.lbluid.text = loungeImage[indexPath.row].locuid
           
          img = loungeImage[indexPath.row].url
           return LoungeCell
            
        } else if collectionView == self.cvBar {
            let BarCell = cvBar.dequeueReusableCell(withReuseIdentifier: "cellBar", for: indexPath) as! BarCollectionViewCell
            let barImg = barImage[indexPath.row]
            BarCell.barImage.sd_setImage(with: URL(string: barImg.url), placeholderImage: UIImage(named: "bottle service dave"))
            
            BarCell.lblLocName.text = barImage[indexPath.row].locTitle
            BarCell.lblAddress.text = barImage[indexPath.row].locAdd1
           
            img = barImage[indexPath.row].url
          return BarCell
        } else {
            let EventCell = cvEvent.dequeueReusableCell(withReuseIdentifier: "cellEvent", for: indexPath) as! EventCollectionViewCell
            let eventimg = eventImage[indexPath.row]
            EventCell.EventImageView.sd_setImage(with: URL(string: eventimg.url), placeholderImage: UIImage(named: "bottle service dave"))
            EventCell.lblLocName.text = eventImage[indexPath.row].locTitle
            EventCell.lblAddress.text = eventImage[indexPath.row].locAdd1
         EventCell.lblEventName.text = eventImage[indexPath.row].locTitle
           img = eventImage[indexPath.row].url
           return EventCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
       let vs = storyboard?.instantiateViewController(withIdentifier: "ViewBarLoungeEvent") as? ViewBarLoungeEvent
        
        
        if collectionView == cvLounge {
        vs?.locTitle = loungeImage[indexPath.row].locTitle
            vs?.locType = loungeImage[indexPath.row].locType
            vs?.locuid = loungeImage[indexPath.row].locuid
        self.cvLounge.reloadData()
        self.cvLounge.allowsMultipleSelection = true
       self.present(vs!, animated: true)
   
        } else if collectionView == cvBar {
            
            vs?.locTitle = barImage[indexPath.row].locTitle
           vs?.locType = locTypeBar[indexPath.row]
            self.cvBar.reloadData()
            self.cvBar.allowsMultipleSelection = true
            
            
            self.present(vs!, animated: true)
        } else if collectionView == cvEvent {
            
            vs?.locTitle = eventImage[indexPath.row].locTitle
           
            self.cvEvent.reloadData()
            self.cvLounge.allowsMultipleSelection = true
            self.present(vs!, animated: true)
            
        }
        
    
    }
    
    var locTypeBar = [ "Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar","Bar" ]
    
    
    var barImage = [LoadDataOnBar]()
    var eventImage = [LoadDataOnEvent]()
    var loungeImage = [LoadDataOnLounge]()
    var ref = DatabaseReference()
    var dbRef: DatabaseReference!
    var barRef: DatabaseReference!
    var databaseRef: DatabaseReference!
    var queryLounge: DatabaseQuery!
    var loungeRef: DatabaseReference!
 
    var defaults: UserDefaults = UserDefaults.standard
   
    var isSlideMenuHidden = true
    
    @IBOutlet weak var sideMenuConstant: NSLayoutConstraint!
    @IBOutlet weak var MenuView: UIView!
    @IBAction func btnMenu(_ sender: Any) {
        
        if isSlideMenuHidden {
            sideMenuConstant.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
               self.view.layoutIfNeeded()
                
            })
            
        } else {
            sideMenuConstant.constant = -263
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
                
        })
            
    }
          isSlideMenuHidden = !isSlideMenuHidden
    }
   
    @IBAction func btnHide(_ sender: Any) {
        
        sideMenuConstant.constant = -263
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            
        })
        
          isSlideMenuHidden = !isSlideMenuHidden
    }
    
    
    @IBOutlet weak var btnHome: UIButton!
    @IBAction func btnHome(_ sender: Any) {
        
        
        sideMenuConstant.constant = -263
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            
        })
        
        isSlideMenuHidden = !isSlideMenuHidden
    }
    
    @IBOutlet weak var btnSignOut: UIButton!
    @IBAction func btnSignOut(_ sender: Any) {
        
    //    let firebaseAuth = Auth.auth()
      
        //    try firebaseAuth.signOut()
        try! GIDSignIn.sharedInstance().signOut()
     print("sign out")
        if let storyboard = self.storyboard {
            let vc = storyboard.instantiateViewController(withIdentifier: "Login")
            self.present(vc, animated: false, completion: nil)
        }
  
    }
    @IBAction func btnLounges(_ sender: Any) {
  }
    @IBOutlet weak var btnMenu: UIButton!
    @IBAction func btnEvents(_ sender: Any) {
    }
    @IBAction func btnBars(_ sender: Any) {
    }
    
    var locName = ""
    var img = ""
    
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var yourCity: UILabel!
    @IBOutlet weak var cvLounge: UICollectionView!
    @IBOutlet weak var cvEvent: UICollectionView!
    @IBOutlet weak var cvBar: UICollectionView!
    @IBOutlet weak var btnBars: UIButton!
    @IBOutlet weak var btnLounges: UIButton!
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    
    @IBAction func btnSearchh(_ sender: Any) {
        

    }
    
    

    
    
    func checkifuserLoggedIn(){
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
    
            if let dictionary = snapshot.value as? [String: AnyObject]{
                self.lblUser.text = dictionary["email"] as? String
                self.lblName.text = dictionary["name"] as? String
                
             //x self.profilepic()
            }
        }, withCancel:nil)
    }
    
    
    func profilepic(){
               let uid = Auth.auth().currentUser?.uid
       // let userEmail = lblName.text
        let ref = Database.database().reference()
        let usersRef = ref.child("users").child(uid!)
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                return
            }
            
            let userInfo = snapshot.value as! NSDictionary
            print(userInfo)
            print(userInfo["email"]!)
            let imgSld = userInfo["profileImageUrl"] as! String
            print(imgSld)
            let storageRef = Storage.storage().reference(forURL: imgSld)
            storageRef.downloadURL(completion: {(url, error) in
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data! as Data)
                self.ProfImage.image = image
            })
        })
        
    }
    
    
    
    
    
    
    
    func loadDataOnEvent()
    {
        dbRef.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadDataOnEvent]()
            for loungeDataImages in snapshot.children {
                let loungeObject = LoadDataOnEvent(snapshot: loungeDataImages as! DataSnapshot)
                newImages.append(loungeObject)
            }
            
            var eventTitle = [LoadDataOnEvent]()
            for eventTitleName in snapshot.children {
                let eventTitleObject = LoadDataOnEvent(snapshot: eventTitleName as! DataSnapshot)
                eventTitle.append(eventTitleObject)
            }
            self.eventImage = newImages
            self.eventImage = eventTitle
            self.cvEvent.reloadData()
        })
    }
    
    func loadDataOnBar()
    {
        barRef.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadDataOnBar]()
            for barDataImages in snapshot.children {
                let barObject = LoadDataOnBar(snapshot: barDataImages as! DataSnapshot)
                newImages.append(barObject)
            }
            self.barImage  = newImages
            self.cvBar.reloadData()
        })
    }
    
    
    
    func loadDataonLounge()
    {
        let queryLounge = loungeRef.queryOrdered(byChild: "locationStatus").queryEqual(toValue: "Approved")
        
        queryLounge.observe(DataEventType.value, with: {(snapshot) in
            var newImages = [LoadDataOnLounge]()
            for loungeDataImages in snapshot.children {
                let loungeObject = LoadDataOnLounge(snapshot: loungeDataImages as! DataSnapshot)
                newImages.append(loungeObject)
            }
            self.loungeImage  = newImages
            
            self.cvLounge.reloadData()
            self.cvLounge.delegate = self
            self.cvLounge.dataSource = self
        })
    }
    
    
    @IBOutlet weak var ProfImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
    //  showalert()

      
    }
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if justOnce == false {
            
            justOnce = true
            
            let alert = UIAlertController(title: "Need help?", message: "We will show you on how does it works.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes, Show me.", style: .default, handler: { (action) in
                
                self.tutorial()
                
                self.buttonNext()
                self.label.text = "Welcome to Bottleservice user guide!"
                self.label.textColor = .white
                self.label.frame = self.customView.frame
                self.label.textAlignment = NSTextAlignment.center
                self.label.font = UIFont(name: self.label.font.fontName, size: 25)
                self.label.numberOfLines = 0;
                self.customView.addSubview(self.label)
                
                
                let imageName = "scMenu.png"
                let image = UIImage(named: imageName)
                
  
                self.imageView = UIImageView(image: image!)
                self.imageView.frame = CGRect(x: 0, y: 20, width: 250, height: 650)
                self.view.addSubview(self.imageView)
                self.self.imageView.isHidden = true
                   self.setupConstraint()
                
            } ))
            
            
            
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
  
        }
    }
    
    
    func setupConstraint(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // 2
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10).isActive = true
        
        // 3
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.95).isActive = true
        
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -110).isActive = true
    }
        

  
    
  var imageView = UIImageView()
  var customView = UIView()
  var label = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.cvLounge.allowsMultipleSelection = true
       ref = Database.database().reference()
       sideMenuConstant.constant = -263
        print(locName)
        dbRef = Database.database().reference().child("OwnerToApp").child("Lounge")
        barRef = Database.database().reference().child("OwnerToApp").child("Bar")
        loungeRef = Database.database().reference().child("OwnerToApp").child("Lounge")
       checkifuserLoggedIn()
      //  loadDataOnEvent()
        loadDataOnBar()
        loadDataonLounge()
        
        
        
        
        
        btnBars.layer.borderWidth = 0.5
        btnBars.layer.cornerRadius = btnBars.frame.height/5
        btnBars.layer.borderColor = UIColor.blue.cgColor
        btnEvents.layer.borderWidth = 0.5
        btnEvents.layer.cornerRadius = btnEvents.frame.height/5
        btnEvents.layer.borderColor = UIColor.blue.cgColor
        btnLounges.layer.borderWidth = 0.5
        btnLounges.layer.cornerRadius = btnLounges.frame.height/5
        btnLounges.layer.borderColor = UIColor.blue.cgColor
        ProfImage.layer.borderWidth = 1
        ProfImage.layer.masksToBounds = false
        ProfImage.layer.borderColor = UIColor.black.cgColor
        ProfImage.layer.cornerRadius = ProfImage.frame.height/2
        ProfImage.clipsToBounds = true
       // tutorial()
 
    }
 
    var userguide = UILabel()
    
    var button = UIButton()
    
    
    
    
    
    func buttonNext(){
        
        let button = UIButton(frame: CGRect(x: 260, y: 550, width: 100, height: 50))
        button.backgroundColor = .gray
        button.setTitle("Next", for: UIControlState.normal)
        button.layer.borderWidth = 1
         button.layer.cornerRadius = button.frame.height/5
        
            button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(buttonMenu), for: .touchUpInside)

         customView.addSubview(button)
    
    }
    
    var button1 = UIButton()
    let showcaseMenuToggle = MaterialShowcase()
    let showcaseSearchButton = MaterialShowcase()
    let showcaseBar = MaterialShowcase()
    let showcasesideMenu = MaterialShowcase()
    let showcaseEvents = MaterialShowcase()
    
    @objc func buttonMenu(sender: UIButton!) {
        customView.isHidden = true
        showcaseMenuToggle.setTargetView(view: btnMenu)
        showcaseMenuToggle.targetTintColor = UIColor.red
        showcaseMenuToggle.targetHolderRadius = 30
        showcaseMenuToggle.targetHolderColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.50)
        showcaseMenuToggle.backgroundPromptColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
        showcaseMenuToggle.backgroundPromptColorAlpha = 0.90
        showcaseMenuToggle.aniComeInDuration = 0.3
        showcaseMenuToggle.aniRippleColor = UIColor.white
        showcaseMenuToggle.aniRippleAlpha = 0.2
        showcaseMenuToggle.primaryText = "Menu"
        showcaseMenuToggle.secondaryText = "       Check email confirmation and payment receipts through Messages, review previous and current bookings through your Booking calendar, feeling lost? get back to those saved pages through Bookmarks, you can customize your account profile plus more on Settings. Click on the Home Drawer and manage your account now. Touch the button to view what is in."
        showcaseMenuToggle.secondaryTextSize = 14
        showcaseMenuToggle.isTapRecognizerForTagretView = true
        showcaseMenuToggle.delegate = self as? MaterialShowcaseDelegate
        showcaseMenuToggle.show(animated: true, completion: {
            let buttonMenu = UIButton(frame: CGRect(x: 0, y: 20, width: 500, height: 1000))
            buttonMenu.backgroundColor = .gray
            buttonMenu.setTitle("", for: UIControlState.normal)
            buttonMenu.alpha = 0.10
            buttonMenu.layer.borderWidth = 1
            buttonMenu.layer.cornerRadius = self.button1.frame.height/5
            buttonMenu.layer.borderColor = UIColor.white.cgColor
            buttonMenu.addTarget(self, action: #selector(self.buttonSideMenu), for: .touchUpInside)
            self.showcaseMenuToggle.addSubview(buttonMenu)
   })
  }
    
    @objc func buttonSideMenu(sender: UIButton!){
 
        imageView.isHidden = false
      showcaseMenuToggle.isHidden = true
        showcasesideMenu.setTargetView(view: imageView)
        showcasesideMenu.backgroundViewType = .full
        showcasesideMenu.targetTintColor = UIColor.red
        showcasesideMenu.targetHolderRadius = 120
        showcasesideMenu.targetHolderColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.50)
        showcasesideMenu.backgroundPromptColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
        showcasesideMenu.backgroundPromptColorAlpha = 0.90
        showcasesideMenu.aniComeInDuration = 0.3
        showcasesideMenu.aniRippleColor = UIColor.white
        showcasesideMenu.aniRippleAlpha = 0.2
        showcasesideMenu.primaryText = ""
        showcasesideMenu.secondaryText = ""
        showcasesideMenu.secondaryTextSize = 14
        showcasesideMenu.isTapRecognizerForTagretView = true
        showcasesideMenu.delegate = self as? MaterialShowcaseDelegate
        showcasesideMenu.show(animated: true, completion: {
            let buttonSideMenu = UIButton(frame: CGRect(x: 0, y: 20, width: 500, height: 1000))
            buttonSideMenu.backgroundColor = .gray
            buttonSideMenu.setTitle("", for: UIControlState.normal)
            buttonSideMenu.alpha = 0.10
            buttonSideMenu.layer.borderWidth = 1
            buttonSideMenu.layer.cornerRadius = self.button1.frame.height/5
            buttonSideMenu.layer.borderColor = UIColor.white.cgColor
            buttonSideMenu.addTarget(self, action: #selector(self.buttonSearch), for: .touchUpInside)
            self.showcasesideMenu.addSubview(buttonSideMenu)
        })
         imageView.isHidden = true
    }

 @objc func buttonSearch(sender: UIButton!) {
    showcasesideMenu.isHidden = true
        showcaseSearchButton.setTargetView(view: btnSearch)
        showcaseSearchButton.targetTintColor = UIColor.red
        showcaseSearchButton.targetHolderRadius = 30
        showcaseSearchButton.targetHolderColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.50)
        showcaseSearchButton.backgroundPromptColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
        showcaseSearchButton.backgroundPromptColorAlpha = 0.90
        showcaseSearchButton.aniComeInDuration = 0.3
        showcaseSearchButton.aniRippleColor = UIColor.white
        showcaseSearchButton.aniRippleAlpha = 0.2
        showcaseSearchButton.primaryText = "Search"
        showcaseSearchButton.secondaryText = "     To search within the Bottleservice app you can simply select the Search button at the top right corner. This will search all of bars, lounges and events in your city and within your proximity providing statistics on shop openings and closings, last minute reservations, guess ratings and many more. You can also see your recent searches within the search screen: (insert screenshot for recent search"
        showcaseSearchButton.secondaryTextSize = 14
        showcaseSearchButton.isTapRecognizerForTagretView = true
        showcaseSearchButton.delegate = self as? MaterialShowcaseDelegate
        showcaseSearchButton.show(animated: true, completion: {
            let button1 = UIButton(frame: CGRect(x: 0, y: 20, width: 500, height: 1000))
            button1.backgroundColor = .gray
            button1.setTitle("", for: UIControlState.normal)
            button1.alpha = 0.10
            button1.layer.borderWidth = 1
            button1.layer.cornerRadius = self.button1.frame.height/5
            button1.layer.borderColor = UIColor.white.cgColor
            button1.addTarget(self, action: #selector(self.buttonAction1), for: .touchUpInside)
         self.showcaseSearchButton.addSubview(button1)
       })
  }
    @objc func buttonAction1(sender: UIButton) {
      showcaseMenuToggle.isHidden = true
      showcaseSearchButton.isHidden = true
        uiBLE.isHidden = false
        showcaseBar.setTargetView(view: uiBLE )
             // showcaseBar.setTargetView(view: btnLounges )
        showcaseBar.backgroundViewType = .circle
        showcaseBar.targetTintColor = UIColor.red
        showcaseBar.targetHolderRadius = 15
        showcaseBar.targetHolderColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.50)
        showcaseBar.backgroundPromptColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
        showcaseBar.backgroundPromptColorAlpha = 0.90
        showcaseBar.aniComeInDuration = 0.3
        showcaseBar.aniRippleColor = UIColor.white
        showcaseBar.aniRippleAlpha = 0.2
        showcaseBar.primaryText = ""
        showcaseBar.secondaryText = "Start by browsing through categories. Choose from bars, lounges and special events. Know its availability, pricing and distance from where you are and book your way in."
        showcaseBar.secondaryTextSize = 14
        showcaseBar.isTapRecognizerForTagretView = true
        // Delegate to handle other action after showcase is dismissed.
        //   showcase.delegate = self
        showcaseBar.show(animated: true, completion: {
            let buttonRes = UIButton(frame: CGRect(x: 0, y: 20, width: 500, height: 1000))
            buttonRes.backgroundColor = .gray
            buttonRes.setTitle("", for: UIControlState.normal)
            buttonRes.alpha = 0.10
            buttonRes.layer.borderWidth = 1
            buttonRes.layer.cornerRadius = self.button1.frame.height/5
            buttonRes.layer.borderColor = UIColor.white.cgColor
            buttonRes.addTarget(self, action: #selector(self.buttonRes), for: .touchUpInside)
            self.showcaseBar.addSubview(buttonRes)
        })
        
        uiBLE.isHidden = true
   }
    
    
   @objc func buttonRes(sender: UIButton){
    showcaseBar.isHidden = true
    
    
  //  uiBLE.isHidden = false
    showcaseEvents.setTargetView(view: cvEvent )
    // showcaseBar.setTargetView(view: btnLounges )
    showcaseEvents.backgroundViewType = .circle
    showcaseEvents.targetTintColor = UIColor.red
    showcaseEvents.targetHolderRadius = 15
    showcaseEvents.targetHolderColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 0.50)
    showcaseEvents.backgroundPromptColor = UIColor(red: 0.06, green: 0.08, blue: 0.15, alpha: 1)
    showcaseEvents.backgroundPromptColorAlpha = 0.90
    showcaseEvents.aniComeInDuration = 0.3
    showcaseEvents.aniRippleColor = UIColor.white
    showcaseEvents.aniRippleAlpha = 0.2
    showcaseEvents.primaryText = ""
    showcaseEvents.secondaryText = "    You are few clicks away in reserving seats and menus for lounge and bar services and special events."
    showcaseEvents.secondaryTextSize = 20
    showcaseEvents.isTapRecognizerForTagretView = true
    // Delegate to handle other action after showcase is dismissed.
    //   showcase.delegate = self
    showcaseEvents.show(animated: true, completion: {
        let buttonTut = UIButton(frame: CGRect(x: 0, y: 20, width: 500, height: 1000))
        buttonTut.backgroundColor = .gray
        buttonTut.setTitle("", for: UIControlState.normal)
        buttonTut.alpha = 0.10
        buttonTut.layer.borderWidth = 1
        buttonTut.layer.cornerRadius = self.button1.frame.height/5
        buttonTut.layer.borderColor = UIColor.white.cgColor
        buttonTut.addTarget(self, action: #selector(self.buttonTut), for: .touchUpInside)
        self.showcaseEvents.addSubview(buttonTut)

    })
  }
    
    @objc func buttonTut(sender: UIButton){
        showcaseEvents.isHidden = true
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageView")
        self.present(vc!, animated: true, completion: nil)
   }
        @IBOutlet weak var uiBLE: UIImageView!

    
        func tutorial() {
        self.view.addSubview(customView)
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            customView.backgroundColor = .clear
            customView.frame = CGRect.init(x: 0, y: 0, width: 375, height: 725)
            customView.alpha = 1.8
            
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(customView)
            customView.center = self.view.center
            customView.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        }
    }
    
    

}

