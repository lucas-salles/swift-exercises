//
//  ViewController.swift
//  Banco de Dados
//
//  Created by IFPB on 17/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    var delegate: AppDelegate!
    var contexto: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = UIApplication.shared.delegate as? AppDelegate
        self.contexto = self.delegate.persistentContainer.viewContext
        
        self.listar()
    }

    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text
        let idade = Int(self.tfIdade.text!)
        
        let pessoa = NSEntityDescription.insertNewObject(forEntityName: "Pessoa", into: self.contexto)
        pessoa.setValue(nome, forKey: "nome")
        pessoa.setValue(idade, forKey: "idade")
        
        self.delegate.saveContext()
        self.listar()
    }
    
    func listar() {
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            
            if(pessoas.count == 0) {
                print(pessoas)
            } else {
                print()
                for pessoa in pessoas {
                    let nome = pessoa.value(forKey: "nome")
                    let idade = pessoa.value(forKey: "idade")
                    print("\(nome!) - \(idade!)")
                }
            }
        } catch {
            print("Erro!")
        }
    }
    
    
    @IBAction func excluir(_ sender: Any) {
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            
            for pessoa in pessoas {
                self.contexto.delete(pessoa)
            }
            
            self.delegate.saveContext()
            
            self.listar()
        } catch {
            print("Erro!")
        }
    }
    
    
    @IBAction func alterar(_ sender: Any) {
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        
        do {
            let pessoas = try self.contexto.fetch(requisicao) as! [NSManagedObject]
            
            for pessoa in pessoas {
                var idade = pessoa.value(forKey: "idade") as! Int
                idade += 1
                pessoa.setValue(idade, forKey: "idade")
            }
            
            self.delegate.saveContext()
            
            self.listar()
        } catch {
            print("Erro!")
        }
    }
    
}

