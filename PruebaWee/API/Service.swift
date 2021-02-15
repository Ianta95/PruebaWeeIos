//
//  Service.swift
//  PruebaWee
//
//  Created by Ian De Jesus on 15/02/21.
//

import UIKit
import Alamofire

struct Service {
    
    private let RUTA_GEN = "https://weepatient.com/API"
    private let RUTA_COUNTRIES = "/api/Utilidades/Pais_GetPais"
    
    static func fetchFromAPI(completion: @escaping([NSDictionary]) -> Void){
        let parameters: [String: Any] = [
            "cadena": ""
        ]
        let request = AF.request("https://weepatient.com/API/api/Utilidades/Pais_GetPais",
                                 method: .post,
                                 parameters: parameters,
                                 encoding: URLEncoding.httpBody).responseJSON { response in
                                    switch (response.result) {
                                    case .success(let JSON):
                                        if let data = JSON as? NSDictionary {
                                            guard let dsRespuesta = data.object(forKey: "dsRespuesta") as? NSDictionary else { return }
                                            guard let listaPaises = dsRespuesta.object(forKey: "Paises") as? [NSDictionary] else { return }
                                            completion(listaPaises)
                                        }
                                        
                                        break
                                    case .failure(let error):
                                        break
                                    }
        }
    }
}
