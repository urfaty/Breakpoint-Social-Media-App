//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Tayfur Salih Şen on 29.01.2023.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    //self.dismiss(animated: true, completion: nil)
                    guard let TabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                    self.presentDetail(TabBarController)
                    
                    
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            //self.dismiss(animated: true, completion: nil)
                            //print("Successfully registered user")
                            guard let TabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else { return }
                            self.presentDetail(TabBarController)
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate { }
