//
//  Drinks+CoreDataClass.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//
//

import Foundation
import CoreData

@objc(Drinks)
public class Drinks: NSManagedObject {
    func inicializaCon(_ dict:Dictionary<String,Any>){
        let nombre = (dict["name"] as? String) ?? ""
        let ingredientes = (dict["ingredients"] as? String) ?? ""
        let intrucciones = (dict["directions"] as? String) ?? ""
        let img = (dict["img"] as? String) ?? ""
        
        self.name = nombre
        self.ingredients = ingredientes
        self.directions = intrucciones
        self.img = img
    }

}
