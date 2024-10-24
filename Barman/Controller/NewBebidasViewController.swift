//
//  NewBebidasViewController.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import Foundation
import UIKit

class NewBebidasViewController: UIViewController {
    
    var laBebida : Drinks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBOutlet var BNombre: UITextField!
    
    @IBOutlet var BIngredientes: UITextField!
    
    @IBOutlet var BInstrucciones: UITextField!
    
    
    @IBAction func btnAgregarBebida(_ sender: Any) {
        guard let nombre = BNombre.text, !nombre.isEmpty,
              let ingredientes = BIngredientes.text, !ingredientes.isEmpty,
              let instrucciones = BInstrucciones.text, !instrucciones.isEmpty else {
            // Muestra una alerta si faltan datos
            let alert = UIAlertController(title: "Error", message: "Todos los campos son obligatorios", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        DrinkViewModel.shared.guardaBebida(name: nombre, ingredients: ingredientes, instructions: instrucciones)
    }
    
        
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
}
