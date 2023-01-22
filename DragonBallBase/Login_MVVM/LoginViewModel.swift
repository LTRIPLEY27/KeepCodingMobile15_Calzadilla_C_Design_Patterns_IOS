//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation

class LoginViewModel : NSObject {
    
    // VARIABLE ENLACE DE DATOS
    
    var updateLogin: ((_ login: String) -> Void)?
    
    
    override init() {
        
    }
    
    // REFACTOR 'MVVM' DE LA CLASE 'CONTROLLER'
    /*func loginCheck(login : String, password : String ){
        let email: String? = login
        let password: String? = password
        
        let apiConnect = ApiClient(token: HeroListViewModel.myToken)
        
        apiConnect.login(user: email!, password: password!) { token, error in
            self.updateLogin?(login ?? "Not data found")
            
            print(token ?? error)
        }

    }*/
    
    func logincheck(email : String, password : String) {
        
        let email: String? = email
        let password: String? = password
        
        let token : String = ""
        
        let apiConnect = ApiClient(token: HeroListViewModel.myToken)
        
        apiConnect.login(user: email!, password: password!) {token, error in
        
            self.updateLogin?(token ?? "not data")
            
            print(token)
        }
    }
}
