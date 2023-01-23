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
    func loginCheck(email: String, password: String ){
        let email: String? = email
        let password: String? = password
        
        let apiConnect = ApiClient(token: HeroListViewModel.myToken)
        
        apiConnect.login(user: email!, password: password!) { token, error in
            self.updateLogin?(token ?? "Not data found")
            
            print(token ?? error)
        }

    }
    
}
