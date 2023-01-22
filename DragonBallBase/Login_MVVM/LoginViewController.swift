//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    
    var viewModel : LoginViewModel?
   /* var email : UITextField?
    var pass : UITextField?
    var button : UIButton?
    var response : UILabel?*/
     var email : String?
     var pass : String?
     var button : UIButton?
     var response : UILabel?
    
    var mainView : LoginView {self.view as!
        LoginView
    }
    
    // EN EL LOADVIEW ES DONDE EJECUTAMOS LAS VISTAS
    override func loadView() {
        //view = LoginView()
        let vie = LoginView()

        button = vie.checkButton()
        
        view = vie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        
        button?.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)

    }
    
    @objc
    func buttonPress(){
        print("evento botton")

        guard let email = mainView.getUser().user, !email.isEmpty else {
            print("not email on request")
            return
        }
        
        guard let password = mainView.getUser().password, !password.isEmpty else {
            print("password is empty")
            return
        }
        
        print(email, password)
        getData(email: email, password: password)
    }
    
    func getData(email: String, password: String){
        viewModel?.loginCheck(login: email, password: password)
    }
}
