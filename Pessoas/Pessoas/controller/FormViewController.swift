//
//  ViewController.swift
//  Pessoas
//
//  Created by IFPB on 13/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    
    var cadastro: Cadastro?
    var pessoa: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pessoa = self.pessoa {
            self.tfNome.text = pessoa.nome
            self.tfIdade.text = String(pessoa.idade)
        }
    }
    
    @IBAction func salvar(_ sender: Any) {
        if(self.pessoa != nil) {
            self.pessoa?.nome = String(self.tfNome.text!)
            self.pessoa?.idade = Int(self.tfIdade.text!)!
            self.cadastro?.add(pessoa: self.pessoa!)
        } else {
            let nome = self.tfNome.text
            let idade = Int(self.tfIdade.text!)
            
            let pessoa = Pessoa(nome: nome!, idade: idade!)
            
            self.cadastro?.add(pessoa: pessoa)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}

