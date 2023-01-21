//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by IsaDevs on 21/1/23.
// NO SE DEBE DE IMPLEMENTAR LA UIKIT EN ÉSTA CLASE

import Foundation

class HeroListViewModel :NSObject {
    
    // VARIABLE ENLACE DE DATOS
    var updateUI : ((_ heroList : [HeroModel]) -> Void)?
    
    
    override init() {
        
    }
    
    // REFACTOR 'MVVM' DE LA CLASE 'CONTROLLER'
    func fetchData(){
        
        let myToken = "eyJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiZW1haWwiOiJpc2FiZWwuY2FsemFkaWxsYS4xOEBnbWFpbC5jb20iLCJpZGVudGlmeSI6IjYyOEVBRTlBLTBGMzQtNEU3NS04NEQ1LTY2MDk2Qzg1Q0I4NyJ9.jm6PCEmXC8LTV1-D8-gf9JlPv5WD2h2kGV_nLa22_zg"
        
        let apiClient = ApiClient(token: myToken)
        
        // ES IMPERATIVO COLOCAR UN 'weak self' EN CUALQUIER CLOUSURE PARA ASEGURAR QUE SE CIERRE CUALQUIER DIRECCIÓN DE MEMORIA DEL 'SELF'
        apiClient.getHeroes{ [weak self] heroes, error in
            
            // ASIGNACIÓN DE LA RESPUESTA A LA VARIABLE ENLACE
            self?.updateUI?(heroes)
        }
    }
}
