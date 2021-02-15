//
//  PaisesViewModel.swift
//  PruebaWee
//
//  Created by Ian De Jesus on 15/02/21.
//

import UIKit

class PaisesViewModel {
    let pais: String
    let idPais: String
    
    init(dict: NSDictionary) {
        self.pais = dict.object(forKey: "Pais") as! String
        self.idPais = dict.object(forKey: "idPais") as! String
    }
}
