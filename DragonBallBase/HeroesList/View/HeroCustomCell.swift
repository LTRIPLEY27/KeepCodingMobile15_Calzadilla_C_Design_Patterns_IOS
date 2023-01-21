//
//  HeroCustomCell.swift
//  DragonBallBase
//
//  Created by IsaDevs on 21/1/23.
//

import Foundation
import UIKit

class HeroCustomCell : UITableViewCell {
    
    // CREACIÓN DE LABEL PRUEBA
    let cellLabel = {
        let label = UILabel()

        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // CONSTRUCTOR DE LA CELDA
    override init(style : UITableViewCell.CellStyle, reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // DEFINICIÓN DE LAS SUBVISTAS Y CONSTRAINS
    func setUpViews(){
        
        addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: topAnchor),
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 30),
            cellLabel.heightAnchor.constraint(equalToConstant: 40),
        
        ])
    }
    
    func configure(_ model : HeroModel){
        self.cellLabel.text = model.name
    }
}
