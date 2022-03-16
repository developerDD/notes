//
//  LoginViewController.swift
//  Lesson2
//
//  Created by Дима Деревянко on 16.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginFacebook(_ sender: Any) {
        let facebook = FacebookLoger()
        facebook.login{(identifier, error) in
            if let error = error {
                print("can't login \(error.localizedDescription)")
            }else{
                print("facebook ID \(identifier)")
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
