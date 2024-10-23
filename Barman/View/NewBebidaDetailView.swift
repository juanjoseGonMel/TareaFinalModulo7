//
//  NewBebidaDetailView.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import UIKit

class NewBebidaDetailView: UIView {
    let nameTF = UITextField()
    let ingredientsTF = UITextField()
    let instructionsTF = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Configuración del TextField para el nombre
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.borderStyle = .roundedRect
        nameTF.backgroundColor = .lightGray
        nameTF.font = UIFont.systemFont(ofSize: 22)
        nameTF.placeholder = "Introduce tu nombre"
        self.addSubview(nameTF)

        // Configuración del TextField para los ingredientes
        ingredientsTF.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTF.borderStyle = .roundedRect
        ingredientsTF.backgroundColor = .lightGray
        ingredientsTF.font = UIFont.systemFont(ofSize: 22)
        ingredientsTF.placeholder = "Introduce tu la lista de ingredientes"
        self.addSubview(ingredientsTF)

        // Configuración del TextField para las instrucciones
        instructionsTF.translatesAutoresizingMaskIntoConstraints = false
        instructionsTF.borderStyle = .roundedRect
        instructionsTF.backgroundColor = .lightGray
        instructionsTF.font = UIFont.systemFont(ofSize: 22)
        instructionsTF.placeholder = "Introduce las instrucciones"
        self.addSubview(instructionsTF)

        setupConstraints()
    }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Constraints para nameTF
                nameTF.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                nameTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                nameTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                nameTF.heightAnchor.constraint(equalToConstant: 40),

                // Constraints para ingredientsTF
                ingredientsTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20),
                ingredientsTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                ingredientsTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                ingredientsTF.heightAnchor.constraint(equalToConstant: 40),

                // Constraints para instructionsTF
                instructionsTF.topAnchor.constraint(equalTo: ingredientsTF.bottomAnchor, constant: 20),
                instructionsTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                instructionsTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                instructionsTF.heightAnchor.constraint(equalToConstant: 40),
            ])
        }
    
    override func draw(_ rect: CGRect) {
        nameTF.frame = rect
        nameTF.backgroundColor = .lightGray
        nameTF.font = UIFont.systemFont(ofSize: 22)
        nameTF.placeholder = "Introduce tu nombre"
        self.addSubview(nameTF)
        
        ingredientsTF.frame = rect
        ingredientsTF.backgroundColor = .lightGray
        ingredientsTF.font = UIFont.systemFont(ofSize: 22)
        ingredientsTF.placeholder = "Introduce tu la lista de ingredientes"
        self.addSubview(ingredientsTF)
        
        instructionsTF.frame = rect
        instructionsTF.backgroundColor = .lightGray
        instructionsTF.font = UIFont.systemFont(ofSize: 22)
        instructionsTF.placeholder = "Introduce las instrucciones"
        self.addSubview(instructionsTF)
    }

}
