//
//  HeroDetailController.swift
//  DragonBallBase
//
//  Created by IsaDevs on 22/1/23.
//

import Foundation
import UIKit

class HeroDetailController : UIViewController {
    
    var mainView : HeroDetailView { self.view as! HeroDetailView}
    
    init(heroDetailModel : HeroModel) {
        super.init(nibName: nil, bundle: nil)
        
        // llamado al configure de la clase heroDetail para actualizar la vista
        mainView.configure(heroDetailModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HeroDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}

