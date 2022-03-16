//
//  login.swift
//  Lesson2
//
//  Created by Дима Деревянко on 16.03.2022.
//

import Foundation
import Accounts

protocol loginable{
    func login (complition: @escaping (String?,Error?) -> Void)
}

class FacebookLoger: loginable {
    internal func login(complition: @escaping (String?, Error?) -> Void) {
        let accountStore = ACAccountStore()
        
        let accFacebook = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
        let apiKey = "1385047418609082"
        let options = [ACFacebookAppIdKey: apiKey, ACFacebookPermissionsKey: ["email"]] as [String:Any]
        
        accountStore.requestAccessToAccounts(with: accFacebook, options: options) {(succcess, error) in
            let identifire: String? = nil
            if succcess {
                let acc = accountStore.accounts(with: accFacebook)
                if let accountFAcebook = acc?.last as? ACAccount {
                    let description = accountFAcebook.identifier
                    print (" YOUR ACCOUNT -> \(description)")
                }
            }else{
                print("ERROR -> \(error?.localizedDescription)")
            }
            complition(identifire,error)
    }
    }
}
