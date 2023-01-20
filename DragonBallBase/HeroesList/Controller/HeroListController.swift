//
//  HeroListController.swift
//  DragonBallBase
//
//  Created by IsaDevs on 19/1/23.
//

import Foundation
import UIKit

class HeroListController: UIViewController {
    
    // DEFINICIÓN PARA ENLAZAR EL CONTROLADOR CON LA VISTA DESEADA
    // DEFINICIÓN DE LA VISTA CONTROLLER Y CAST A LA CLASE ESPECÍFICA A CONTROLAR
    var mainView : HeroeListView {self.view as! HeroeListView}
    
    // DEFINICIÓN E INSTANCIACIÓN DE LA VISTA
    override func loadView() {
        view = HeroeListView()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // definicion de los managers
        fetchData()
    }
    
    func fetchData(){
        
        let myToken = "eyJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiZW1haWwiOiJpc2FiZWwuY2FsemFkaWxsYS4xOEBnbWFpbC5jb20iLCJpZGVudGlmeSI6IjYyOEVBRTlBLTBGMzQtNEU3NS04NEQ1LTY2MDk2Qzg1Q0I4NyJ9.jm6PCEmXC8LTV1-D8-gf9JlPv5WD2h2kGV_nLa22_zg"
        
        let apiClient = ApiClient(token: myToken)
        
        apiClient.getHeroes{ heroes, error in
            debugPrint("PMG : \(heroes)")
            debugPrint("PMG : ", error ?? "No error found")
        }
    }
}
