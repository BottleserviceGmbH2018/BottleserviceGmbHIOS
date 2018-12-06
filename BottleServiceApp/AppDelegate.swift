//
//  AppDelegate.swift
//  BottleServiceApp
//
//  Created by David Olarte on 08.03.18.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , GIDSignInDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        

        FirebaseApp.configure()
        //let navColor = UIColor(red: 1, green: 165/225, blue: 0, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.23, green: 0.27, blue: 0.44, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UINavigationBar.appearance().barStyle = .blackOpaque
        
   
        
    
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions )
        
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        
        
        
   
        // Override point for customization after application launch.
        return true
    }
    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options [UIApplicationOpenURLOptionsKey.annotation])
        
     //   return handled
 
        
       // let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation])
        
        
        
        GIDSignIn.sharedInstance().handle(url, sourceApplication: options [UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        
        
        
        
        
        return handled
        
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {

        
        guard let idToken = user.authentication.idToken else {return}
        
        guard let accessToken = user.authentication.accessToken else {return}
        
        
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
    
        Auth.auth().signIn(with: credentials, completion: {(user, error) in
            
            if let err = error {
                
                print("Failed to create user", err)
                return
                
            }
            
            guard let uid = user?.uid else {return}
            print("Success", uid)
            
            
            guard let username = user?.displayName else {return}
            print("Username is:", username)
            
            
            guard let userEmail = user?.email else {return}
            print("Email is:", userEmail)
            
    
            guard let tokenDev = InstanceID.instanceID().token() else { return }
            
            let type = "2"
            print(type)
            
     
            
            let values = ["name": username, "email": userEmail, "type": type, "uid": uid, "device_token": tokenDev]
            
            self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
            
            // Access the storyboard and fetch an instance of the view controller
         
            }
            
            
            
      )  }
    
    
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err!)
                return
            }
            //            self.messagesController?.fetchUserAndSetupNavBarTitle()
            //            self.messagesController?.navigationItem.title = values["name"] as? String
            _ = User(dictionary: values)
            //    self.dismiss(animated: true, completion: nil)
        })
    }
    
    
    
    

    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

