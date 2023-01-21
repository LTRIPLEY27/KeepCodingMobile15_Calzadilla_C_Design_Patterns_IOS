//
//  HeroListController.swift
//  DragonBallBase
//
//  Created by IsaDevs on 19/1/23.
//

import Foundation
import UIKit

class HeroListController: UIViewController {
    
    var heroes : [HeroModel] = []
    // DEFINICIÓN PARA ENLAZAR EL CONTROLADOR CON LA VISTA DESEADA
    // DEFINICIÓN DE LA VISTA CONTROLLER Y CAST A LA CLASE ESPECÍFICA A CONTROLAR
    var mainView : HeroeListView {self.view as! HeroeListView}
    
    // DEFINICIÓN DEL DATASOURCE PARA ENLAZAR
    var tableDataSource : HeroeListDataSource?
    
    //******    REFACTOR  MVVM  --> 'HeroListModel'
    var viewModel : HeroListViewModel?
    
    
    // DEFINICIÓN E INSTANCIACIÓN DE LA VISTA
    override func loadView() {
        view = HeroeListView()
        
        // ASIGNACIÓN DEL DATASOURCE A LA VARIABLE DEFINIDA, SE REFERENCIA A LA CLASE
        // DESDE EL MAINVIEW
        tableDataSource = HeroeListDataSource(tableView: mainView.heroesTableView)
        
        // ASOCIACIÓN DEL TABLEVIEW CON LA DATASOURCE
        mainView.heroesTableView.dataSource = tableDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LLAMADO A LA FUNCIÓN FETCH REFACTORIZADA EN EL 'HEROLISTVIEWMODEL' ---> MVVM
        // INSTANCIACIÓN DEL VIEW MODEL
        viewModel = HeroListViewModel()
        
        // llamado actualizar la interfaz
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableDataSource?.heroes = heroes
        }

        // REQUEST A LA API
        viewModel?.fetchData()
        
        //******************** old
        
        // definicion de los managers
        //fetchData()
    }
    
    /*      ***  REFACTOR 'MVVM' --> 'HEROLISTVIEWMODEL, DELEGA EL MÉTODO PARA CREAR MÁS DINAMISMO Y PROPICIAR LA POTENCIALIDAD, ELIMINANDO DEPENDENCIAS Y EL ACOPLAMIENTO
    func fetchData(){
        
        let myToken = "eyJraWQiOiJwcml2YXRlIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiZW1haWwiOiJpc2FiZWwuY2FsemFkaWxsYS4xOEBnbWFpbC5jb20iLCJpZGVudGlmeSI6IjYyOEVBRTlBLTBGMzQtNEU3NS04NEQ1LTY2MDk2Qzg1Q0I4NyJ9.jm6PCEmXC8LTV1-D8-gf9JlPv5WD2h2kGV_nLa22_zg"
        
        let apiClient = ApiClient(token: myToken)
        
        // ES IMPERATIVO COLOCAR UN 'weak self' EN CUALQUIER CLOUSURE PARA ASEGURAR QUE SE CIERRE CUALQUIER DIRECCIÓN DE MEMORIA DEL 'SELF'
        apiClient.getHeroes{ [weak self] heroes, error in
            debugPrint("PMG : \(heroes)")
            debugPrint("PMG : ", error ?? "No error found")
            
            self?.heroes = heroes
            
            // LLAMA AL OBSERVER DEL DATASOURCE 'DIDSET'
            self?.tableDataSource?.heroes = heroes
        }
    }*/
}
