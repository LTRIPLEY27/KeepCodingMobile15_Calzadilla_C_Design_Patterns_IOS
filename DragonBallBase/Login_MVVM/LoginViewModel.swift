//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation

class LoginViewModel : NSObject {
    
    // VARIABLE ENLACE DE DATOS
    
    var updateLogin : ((_ login : String) -> Void)?
    
    
    override init() {
        
    }
    
    // REFACTOR 'MVVM' DE LA CLASE 'CONTROLLER'
    func loginCheck(login : String , password : String ){
        let user : String = login
        let pass : String = password
        
        let apiConnect = ApiClient.init(token: HeroListViewModel.myToken)
        
        apiConnect.login(user: user, password: pass){ token, error in
            self.updateLogin?(token ?? "Not data found")
        }
        
    }
}
