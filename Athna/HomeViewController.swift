//
//  HomeViewController.swift
//  Athna
//
//  Created by WuGuihua on 11/7/16.
//  Copyright © 2016 Sherlock. All rights reserved.
//

import UIKit
import AWSMobileHubHelper

class HomeViewController: UIViewController {


    @IBOutlet weak var hangout_btn: UIButton!
    @IBOutlet weak var romance_btn: UIButton!
    var signInObserver: Any
    var signOutObserver: Any  //if put a "!" or "?" after the type "Any", we dont need an initializer and can add oberservers in viewDidLoad, even we have a deinit(). But if without "!" or "?", we'll have to add an initializer.
    
    
    
    required init?(coder aDecoder: NSCoder) {
        signInObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignIn, object: AWSIdentityManager.defaultIdentityManager(), queue: OperationQueue.main, using: {(note: Notification) -> Void in
        })
        
        signOutObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.AWSIdentityManagerDidSignOut, object: AWSIdentityManager.defaultIdentityManager(), queue: OperationQueue.main, using: {(note: Notification) -> Void in
        })
        super.init(coder: aDecoder)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(UIApplication.shared.statusBarFrame.size.height)   //to get the height of the status bar: 20.0        
    }
    
    //imagine for the first time users use this app, HomeVC will be the entry VC, so HomeVC will be loaded before it transition to the SignInVC, after logging in, the SignInVC will dismiss and come back to HomeVC, but viewDidLoad won't get called this time while viewWillAppear will get called. Thus we need to put .isLoggedIn which is in the func setupRightBarButtonItem in viewWillAppear() intead of viewDidLoad()
    override func viewWillAppear(_ animated: Bool) {
        self.presentSignInViewController()
        self.setupRightBarButtonItem()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(signInObserver)
        NotificationCenter.default.removeObserver(signOutObserver)
    }
 
    func presentSignInViewController() {
        if !AWSIdentityManager.defaultIdentityManager().isLoggedIn {
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "SignIn")
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    func handleLogout() {
        if (AWSIdentityManager.defaultIdentityManager().isLoggedIn) {
            AWSIdentityManager.defaultIdentityManager().logout(completionHandler: {(result: Any?, error: Error?) -> Void in
                self.navigationController?.popToRootViewController(animated: false)
                self.setupRightBarButtonItem()
                self.presentSignInViewController()
            })
            // print("Logout Successful: \(signInProvider.getDisplayName)");
        } else {
            assert(false)
        }
    }
    
    func setupRightBarButtonItem() {
        /* dispatch_once is unavailable in swift 3
        struct Static {
            static var onceToken: dispatch_once_t = 0
            //static var onceToken: dispatch_time_t = 0
        }

        dispatch_once(&Int(Static.onceToken), {
            let loginButton: UIBarButtonItem = UIBarButtonItem(title: nil, style: .Done, target: self, action: nil)
            self.navigationItem.rightBarButtonItem = loginButton
        })
        */
        
        
        if (AWSIdentityManager.defaultIdentityManager().isLoggedIn) {
            let logoutButton: UIBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: nil)
            self.navigationItem.rightBarButtonItem = logoutButton
            self.navigationItem.rightBarButtonItem!.action = #selector(HomeViewController.handleLogout)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PeopleViewController
        if segue.identifier == "hangout"{
            vc?.navigationItem.title = "Hangout"
        }
        if segue.identifier == "romance"{
            vc?.navigationItem.title = "Romance"
        }
    }
}
