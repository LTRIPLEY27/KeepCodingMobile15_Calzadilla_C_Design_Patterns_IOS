//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    // enlace con los elementos d ela vista para capturar los valores
     var viewModel : LoginViewModel?
     var email : String?
     var pass : String?
     var button : UIButton?
     var response : UILabel?
    
    // casting de la view a loginview
    var mainView : LoginView {self.view as!
        LoginView
    }
    
    // EN EL LOADVIEW ES DONDE EJECUTAMOS LAS VISTAS
    // INICIALIZACIÓN DE LOS COMPONENTES
    override func loadView() {
        let vie = LoginView()

        button = vie.checkButton()
        response = vie.getLabel()
        view = vie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        //LLAMADO DE LA FUNCIÓN DEL BUTTON
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
        
        getData(email: email.lowercased(), password: password.lowercased())
        //update()
    }
    
    // FUNCIÓN DATA, DIAPARADA POR EL EVENTO ON CLICK, LLAMA AL LOGINCHECK PARA CAPTURAR EL TOKEN
    func getData(email: String, password: String){
        
        viewModel?.loginCheck(email: email, password: password)

        response?.text = HeroListViewModel.myToken
        print(email,password)
    
    }
    
    // FUNCIÓN PARA PRINTAR EL TOKEN EN LA VISTA
    // RETORNA NIL, PERO EN TEORÍA IBA AL HILO PRINCIPAL PARA PRINTAR LA RESPUESTA
    /*func update() {

        response?.text = HeroListViewModel.myToken
        
        viewModel?.updateLogin = { [weak self] token in
            
            DispatchQueue.main.async {
                self?.response?.text = token
            }
            
        }
    }*/
}
