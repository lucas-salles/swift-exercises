//
//  ViewController.swift
//  Arroche o Numero
//
//  Created by IFPB on 02/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class Tela01ViewController: UIViewController {
    
    @IBOutlet weak var intervalo: UILabel!
    @IBOutlet weak var numero: UITextField!
    var min = 1
    var max = 100
    var random = 0
    
    
    @IBAction func enviar(_ sender: Any) {
        var chute: Int
        if let numero = Int(numero.text!) {
            chute = numero
        } else {
            chute = 0
        }
        
        if(chute == random || chute <= min || chute >= max) {
            let t2vc = self.storyboard?.instantiateViewController(identifier: "tela02") as! Tela02ViewController
            t2vc.mensagem = "Perdeu!"
            self.present(t2vc, animated: true, completion: nil)
        } else if(chute < random) {
            min = chute
        } else {
            max = chute
        }
        
        if(min + 1 == max - 1) {
            let t2vc = self.storyboard?.instantiateViewController(identifier: "tela02") as! Tela02ViewController
            t2vc.mensagem = "Ganhou!"
            self.present(t2vc, animated: true, completion: nil)
        }
        
        intervalo.text = "min: \(min), max: \(max)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        random = Int.random(in: 1..<101)
        print(random)
        
        numero.keyboardType = .numberPad
        numero.placeholder = "Digite o número"
        intervalo.text = "min: \(min), max: \(max)"
    }

}
