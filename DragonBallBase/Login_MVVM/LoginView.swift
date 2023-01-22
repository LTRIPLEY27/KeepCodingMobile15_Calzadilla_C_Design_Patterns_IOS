//
//  LoginView.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation
import UIKit

class LoginView : UIView {
    
    var user : LoginModel = LoginModel()
    
    let loginBox = {
       let login = UITextField()
        login.placeholder = "Login"
        login.textAlignment = .center
        login.backgroundColor = .white
        
        login.translatesAutoresizingMaskIntoConstraints = false
        
       return login
    }()

    let password = {
       let pass = UITextField()
        pass.placeholder = "Password"
        pass.textAlignment = .center
        pass.backgroundColor = .white
        
        pass.translatesAutoresizingMaskIntoConstraints = false
        
        return pass
    }()
    
    
    let botton = {
       let botton = UIButton()
        
        botton.setTitle("Enter", for: .normal)
        botton.tintColor = .white
        botton.backgroundColor = .black
        
        botton.translatesAutoresizingMaskIntoConstraints = false
        
        return botton
    }()
    
    let label = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        //backgroundColor = UIColor(patternImage: UIImage(named: "dragonBall.jpg")!)
        backgroundColor = .darkGray

        addSubview(loginBox)
        addSubview(password)
        addSubview(botton)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            loginBox.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            loginBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loginBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            loginBox.heightAnchor.constraint(equalToConstant: 40),
            loginBox.widthAnchor.constraint(equalToConstant: 80),
            
            password.topAnchor.constraint(equalTo:  loginBox.bottomAnchor, constant: 15),
            password.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            password.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            password.heightAnchor.constraint(equalToConstant: 40),
            password.widthAnchor.constraint(equalToConstant: 80),
            
            botton.topAnchor.constraint(equalTo:  password.bottomAnchor, constant: 40),
            botton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            botton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            botton.heightAnchor.constraint(equalToConstant: 40),
            botton.widthAnchor.constraint(equalToConstant: 80),
            
            label.topAnchor.constraint(equalTo:  botton.bottomAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.widthAnchor.constraint(equalToConstant: 80),
        ])
    }

    func getUser() -> LoginModel {
        
        user.user = loginBox.text ?? ""
        user.password = password.text ?? ""
        user.token = label.text ?? ""
    
        return user
    }
    
    func checkButton() -> UIButton {
        return botton
    }
}
