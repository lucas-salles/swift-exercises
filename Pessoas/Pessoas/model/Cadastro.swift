//
//  Cadastro.swift
//  Pessoas
//
//  Created by IFPB on 13/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import Foundation

class Cadastro {
    var lista: Array<Pessoa>
    
    init() {
        self.lista = Array()
    }
    
    func add(pessoa: Pessoa) {
        self.lista.append(pessoa)
    }
    
    func count() -> Int {
        return self.lista.count
    }
    
    func get() -> Array<Pessoa> {
        return self.lista
    }
    
    func get(index: Int) -> Pessoa {
        return self.lista[index]
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func mov(from: Int, to: Int) {
        let valor = self.lista.remove(at: from)
        self.lista.insert(valor, at: to)
    }
}
