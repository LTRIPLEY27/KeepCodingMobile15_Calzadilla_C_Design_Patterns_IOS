//
//  HeroeListDataSource.swift
//  DragonBallBase
//
//  Created by IsaDevs on 20/1/23.
//

import Foundation
import UIKit

// IMPLEMENTAMOS EL 'NSObject' PARA NO IMPLEMENTAR TODOS LOS MÉTODOS DE LA INTERFACE
class HeroeListDataSource: NSObject, UITableViewDataSource {
    
    // RELOAD DEL HILO PRINCIPAL PARA ACTUALIZAR LA DATA, LLAMADA POR 'FETCHLOAD' DEL CONTROLLER
    var heroes : [HeroModel] = [] {
        
        // EL 'DIDSET' ESTÁ A LA EXPECTATIVA PARA QUE CADA VEZ QUE SE MODIFIQUE LA VARIABLE HEROES, SE ACTUALICE LA DATA
        didSet {
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    let table : UITableView
    
    
    // MÉTODOS INHERENTES DE LA DATASOURCE
    
    init(tableView : UITableView, heroes : [HeroModel] = []){
        self.heroes = heroes
        self.table = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CASTING Y DEFICIÓN DE LA CUSTOMCELL
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeListCell", for: indexPath) as! HeroCustomCell
        
        let hero = heroes[indexPath.row]
        
        cell.configure(hero)
        
        return cell
    }
}
