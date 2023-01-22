//
//  HeroListDelegate.swift
//  DragonBallBase
//
//  Created by IsaDevs on 21/1/23.
//

import Foundation
import UIKit

class HeroListDelegate : NSObject, UITableViewDelegate {
    
    var didTapOnCell : ((Int) -> Void)?
    
    // MÉTODO PARA INDICAR LAS DIMENSIONES DE LA CELDA
    // SE DEBE DE DEFINIR TAMBIÉN EN EL CONTROLLER
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    // MÉTODO PARA ENLAZAR CON LA DETAILVIEW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    
}
