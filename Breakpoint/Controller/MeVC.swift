//
//  MeVC.swift
//  Breakpoint
//
//  Created by Tayfur Salih Şen on 1.02.2023.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailLbl.text = Auth.auth().currentUser?.email
    }
    

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            guard let authVC = storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC else { return }
            presentDetail(authVC)
            
        } catch {
            print("error")
        }
    }

}
