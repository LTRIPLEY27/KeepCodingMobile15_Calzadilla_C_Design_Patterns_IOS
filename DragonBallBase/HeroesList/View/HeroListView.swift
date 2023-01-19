//
//  HeroListView.swift
//  DragonBallBase
//
//  Created by IsaDevs on 19/1/23.
// CREACIÓN DE VISTA DESDE CLASE, SIN COCOA TOUCH
//

import Foundation
import UIKit

class HeroeListView : UIView {
    
    // CREACIÓN E INICIALIZACIÓN DE VARIABLE MEDIANTE VARIABLE COMPUTADA
    let heroesTableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    // CREACIÓN DE LABEL PRUEBA
    let label = {
        let label = UILabel()
        
        label.text = "This is a label..."
        label.textColor = .black
        
        // PROPIEDAD que asegura las dimensiones de la vista a printar, SIEMPRE EN FALSE
        // ÉSTA PROPIEDAD SE DEBE DE DEFINIR EN TODA SUBVISTA Y ELEMENTO
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // sobreescritura de constructor PADRE DE UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // DEFINICIÓN DE LOS COMPONENTES VISTA (SUB-VISTAS)
    func setUpViews(){
        backgroundColor = .white
        //addSubview(heroesTableView)
        
    
        addSubview(label)
        
        // DEFINICIÓN DE LOS CONSTRAINS
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            ])
    }
}
