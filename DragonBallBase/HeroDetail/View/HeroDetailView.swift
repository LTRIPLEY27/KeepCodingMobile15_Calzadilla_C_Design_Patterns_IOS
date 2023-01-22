//
//  HeroDetailView.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation
import UIKit

class HeroDetailView : UIView {
    
    let image = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    // CREACIÓN DE LABEL PRUEBA
    let cellLabel = {
        let label = UILabel()

        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 15, weight : .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel = {
       let description = UILabel()
        description.textColor = .systemBlue
        description.font = UIFont.systemFont(ofSize: 12)
        
        // DEFINICIÓN DE MULTILÍNEAS
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        
        return description
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // DEFINICIÓN DE LAS SUBVISTAS Y CONSTRAINS
    func setUpViews(){
        backgroundColor = .darkGray
        addSubview(image)
//        addSubview(cellLabel)
//        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            
            // CONSTRAINS IMAGE
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 120),
            image.widthAnchor.constraint(equalToConstant: 120),
            /*// CONSTRAINS LABEL TITLE
            cellLabel.topAnchor.constraint(equalTo: image.topAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant : 20), // LEFT
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellLabel.heightAnchor.constraint(equalToConstant: 20),
            // CONSTRAINS LABEL DESCRIPTION
            descriptionLabel.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellLabel.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100),*/
        ])
    }

    // RESPONDE A LAS SUBVISTAS EN EL 'setUpViews()' CON LA DATA A IMPRIMIR DEL MODELO
    func configure(_ model : HeroModel){
        self.cellLabel.text = model.name
        self.descriptionLabel.text = model.description
        // DEFINICIÓN DE LA IMAGE CON EL PAQUETE DE KINGFISHER PARA PARSEAR LA IMÁGEN
        self.image.kf.setImage(with: URL(string: model.photo))
    }
}
