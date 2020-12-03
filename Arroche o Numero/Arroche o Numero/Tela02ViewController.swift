//
//  Tela02ViewController.swift
//  Arroche o Numero
//
//  Created by IFPB on 02/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class Tela02ViewController: UIViewController {
    
    
    @IBOutlet weak var resultado: UILabel!
    var mensagem: String?
    
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let mensagem = self.mensagem {
            self.resultado.text = mensagem
        }
    }

}
