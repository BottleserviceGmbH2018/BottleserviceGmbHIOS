//
//  PageView.swift
//  BottleServiceApp
//
//  Created by David Olarte on 10/08/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit

class PageView: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var images: [String] = ["res1","res2","res3","res4","res5","res6"]
    var frame = CGRect(x:0,y:0,width:0, height:0)
    
    @IBOutlet weak var btnGetStarted: UIButton!
    @IBAction func btnGetStarted(_ sender: Any) {
        
        
        
        
    }
    
    
       let imgView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        pageControll.numberOfPages = images.count
        
        
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            

            
            self.scrollView.addSubview(imgView)
            
            
            
            
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
       
    }
    
    func setupcons(){
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        // 2
       // imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -10).isActive = true
        
        // 3
        imgView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.95).isActive = true
        
        imgView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -110).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // self.setupcons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupConstraint(){

    }
    
    
    
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControll.currentPage = Int(pageNumber)
    }



}
