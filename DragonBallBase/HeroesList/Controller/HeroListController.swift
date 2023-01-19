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
    }
}
