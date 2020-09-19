//
//  ViewController.swift
//  TodoList
//
//  Created by Mac on 05/09/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MainPage: UIViewController {
    
    @IBOutlet weak var loginBtn : Button!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onLogin (sender : Button) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: self, completion: { loginResult in
            switch loginResult {
            case .failed(let error):
                print("\(error)")
            case .cancelled:
                print("cancelled")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("\(grantedPermissions) \(declinedPermissions)")
                print(accessToken.userID)
                self.goNextPage()
            }
        })
    }
    
    func goNextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exo = storyboard.instantiateViewController(withIdentifier: "list") as! List
        navigationController?.show(exo, sender: self)
    }

}

