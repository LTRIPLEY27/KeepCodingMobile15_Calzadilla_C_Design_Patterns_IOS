//
//  HeroListViewModel.swift
//  DragonBallBase
//
//  Created by IsaDevs on 21/1/23.
// NO SE DEBE DE IMPLEMENTAR LA UIKIT EN ÉSTA CLASE

import Foundation

class HeroListViewModel : NSObject {
    
    // VARIABLE ENLACE DE DATOS
    var updateUI : ((_ heroList : [HeroModel]) -> Void)?
    
    static let login = HeroListViewModel()
    
    static let myToken = "eyJhbGciOiJIUzI1NiIsImtpZCI6InByaXZhdGUiLCJ0eXAiOiJKV1QifQ.eyJpZGVudGlmeSI6IjYyOEVBRTlBLTBGMzQtNEU3NS04NEQ1LTY2MDk2Qzg1Q0I4NyIsImVtYWlsIjoiaXNhYmVsLmNhbHphZGlsbGEuMThAZ21haWwuY29tIiwiZXhwaXJhdGlvbiI6NjQwOTIyMTEyMDB9.kqw_IzqS1k9j58RbwobNaJlZtY4nmg_2tHAbD697Smc"
    
    override init() {
        
    }
    
    // REFACTOR 'MVVM' DE LA CLASE 'CONTROLLER'
    func fetchData(){
    
        
        let apiClient = ApiClient(token: HeroListViewModel.myToken)
        
        // ES IMPERATIVO COLOCAR UN 'weak self' EN CUALQUIER CLOUSURE PARA ASEGURAR QUE SE CIERRE CUALQUIER DIRECCIÓN DE MEMORIA DEL 'SELF'
        apiClient.getHeroes{ [weak self] heroes, error in
            
            // ASIGNACIÓN DE LA RESPUESTA A LA VARIABLE ENLACE
            self?.updateUI?(heroes)
        }
    }
}
