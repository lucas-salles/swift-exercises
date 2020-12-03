//
//  ViewController.swift
//  NavigationController
//
//  Created by IFPB on 03/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class Tela01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Tela 1 - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("Tela 1 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        print("Tela 1 - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        print("Tela 1 - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        print("Tela 1 - viewDidDisappear")
    }

}

