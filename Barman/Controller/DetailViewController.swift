//
//  DetailViewController.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    
    
    var laBebida : Drinks?
    var newBebida : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        if let newBebida{
            if newBebida {
                addTextViews()
            } else {
                addTextFields()
            }
        }
    }
    
    func addTextViews() {
        let BDV = BebidasDetailView()
        BDV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(BDV)
            
        NSLayoutConstraint.activate([
            BDV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            BDV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            BDV.widthAnchor.constraint(equalToConstant: 200),
            BDV.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func addTextFields() {
        let BDV = NewBebidaDetailView()
        BDV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(BDV)
            
        NSLayoutConstraint.activate([
            BDV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            BDV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            BDV.widthAnchor.constraint(equalToConstant: 200),
            BDV.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

        func setupConstraints(for view: UIView, at index: Int) {
            let topAnchor = index == 0 ? self.view.safeAreaLayoutGuide.topAnchor : self.view.viewWithTag(index - 1)!.bottomAnchor
            
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
                view.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                view.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let laBebida = laBebida {
            // Mostrar detalles de la bebida
            nameTV.text = laBebida.name
            ingredientsTV.text = laBebida.ingredients
            instructionsTV.text = laBebida.directions
        } else {
            // Campos vacíos para una nueva receta
            nameTF.text = ""
            ingredientsTF.text = ""
            instructionsTF.text = ""
        }
        
    }
    

       
       @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
           // Guardar la nueva bebida o actualizar la existente
       }


}




