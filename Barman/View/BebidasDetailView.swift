//
//  BebidasDetailView.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import UIKit

class BebidasDetailView: UIView {
    let nametv = UITextView()
    let ingredientsTV = UITextView()
    let instructionsTV = UITextView()
    let imageView = UIImageView()
    
    
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
        nametv.translatesAutoresizingMaskIntoConstraints = false
        nametv.backgroundColor = .lightGray
        nametv.isEditable = false
        nametv.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(nametv)

        // Configuración del TextField para los ingredientes
        ingredientsTV.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTV.backgroundColor = .lightGray
        ingredientsTV.isEditable = false
        ingredientsTV.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(ingredientsTV)

        // Configuración del TextField para las instrucciones
        instructionsTV.translatesAutoresizingMaskIntoConstraints = false
        instructionsTV.backgroundColor = .lightGray
        instructionsTV.isEditable = false
        instructionsTV.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(instructionsTV)

        // Configuración de la ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)

        setupConstraints()
        }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Constraints para nameTF
                nametv.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                nametv.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                nametv.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                nametv.heightAnchor.constraint(equalToConstant: 40),

                // Constraints para ingredientsTF
                ingredientsTV.topAnchor.constraint(equalTo: nametv.bottomAnchor, constant: 20),
                ingredientsTV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                ingredientsTV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                ingredientsTV.heightAnchor.constraint(equalToConstant: 40),

                // Constraints para instructionsTF
                instructionsTV.topAnchor.constraint(equalTo: ingredientsTV.bottomAnchor, constant: 20),
                instructionsTV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                instructionsTV.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                instructionsTV.heightAnchor.constraint(equalToConstant: 40),

                // Constraints para imageView
                imageView.topAnchor.constraint(equalTo: instructionsTV.bottomAnchor, constant: 20),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                imageView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }
    
    /*override func draw(_ rect: CGRect) {
        nametv.frame = rect
        nametv.backgroundColor = .lightGray
        nametv.isEditable = false
        nametv.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(nametv)
        
        ingredientsTV.frame = rect
        ingredientsTV.backgroundColor = .lightGray
        ingredientsTV.isEditable = false
        ingredientsTV.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(ingredientsTV)
        
        instructionsTV.frame = rect
        instructionsTV.backgroundColor = .lightGray
        instructionsTV.isEditable = false
        instructionsTV.font = UIFont.systemFont(ofSize: 22)
        self.addSubview(instructionsTV)
    }*/

}
