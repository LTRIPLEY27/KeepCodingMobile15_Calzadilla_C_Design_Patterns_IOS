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
    
    // CREACIÓN DE LABEL PRUEBA
    let headerLabel = {
        let label = UILabel()
        
        label.text = "MVC"
        label.textColor = .cyan
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textAlignment = .center
        
        // PROPIEDAD que asegura las dimensiones de la vista a printar, SIEMPRE EN FALSE
        // ÉSTA PROPIEDAD SE DEBE DE DEFINIR EN TODA SUBVISTA Y ELEMENTO
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // CREACIÓN E INICIALIZACIÓN DE VARIABLE MEDIANTE VARIABLE COMPUTADA
    let heroesTableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // registro de la tabla con el datasource
        //tableView.register(nil, forCellReuseIdentifier: "HeroeListCell")
        
        // REGISTRO DE LA CELDA A PRINTAR, CON EL IDENTIFICADOR DEL DATASOURCE
        tableView.register(HeroCustomCell.self, forCellReuseIdentifier: "HeroeListCell")
        
        return tableView
    }()
    
    
    // sobreescritura de constructor PADRE DE UIView
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // DEFINICIÓN DE LOS COMPONENTES VISTA (SUB-VISTAS) Y CONSTRAINS PARA UBICACIÓN EL SCREEN
    func setUpViews(){
        backgroundColor = .black
        
        // ES NECESARIO EL ORDEN DE LA DEFINICIÓN YA QUE DEPENDIENDO DE ELLO POSICIONARÁ LAS CONSTRAINTS
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
    
        
        // DEFINICIÓN DE LOS CONSTRAINS
        // INDICACIÓN CON LAS 'CONSTANT' DE LAS DIMENSIONES A UBICAR
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 100),
            
            // UBICACIÓN DE LOS CONSTRAINS DE LA TABLA
            // el topAnchor serán concatenados a los constrains que tomaremos como referencia
            //heroesTableView.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 100),
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            ])
    }
}
