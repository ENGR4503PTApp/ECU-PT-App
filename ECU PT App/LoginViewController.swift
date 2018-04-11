//
//  LoginViewController.swift
//  ECU PT App
//
//  Created by Dylan Moore on 4/11/18.
//  Copyright © 2018 Dylan Moore. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import Firebase

class LoginViewController: UIViewController, FUIAuthDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        checkLoggedIn()
        // Do any additional setup after loading the view.
    }
    
    func checkLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // User is signed in.
                print("user is signed in")
            } else {
                // No user is signed in.
                print("user was not signed in")
                self.login()
            }
        }
    }
    
    func login() {
        let authUI = FUIAuth.defaultAuthUI()
        
        authUI?.delegate = self
        
        let authViewController = authUI?.authViewController()
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    func logout() {
        try! Auth.auth().signOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
