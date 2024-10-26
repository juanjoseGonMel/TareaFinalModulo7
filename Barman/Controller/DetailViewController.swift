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
    
    
    @IBOutlet var BNombre: UILabel!
    
    @IBOutlet var BIngredientes: UILabel!
    
    @IBOutlet var BInstrucciones: UILabel!
    
    
    @IBOutlet var ImgBebida: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("string de img labebida")
        print(laBebida?.img)
        var imgname = ""
        if let bebida = laBebida {
            BNombre.text = bebida.name
            BIngredientes.text = bebida.ingredients
            BInstrucciones.text = bebida.directions
            imgname = bebida.img ?? ""
        } else {
            BNombre.text = "Nombre no disponible"
            BIngredientes.text = "Ingredientes no disponibles"
            BInstrucciones.text = "Instrucciones no disponibles"
            imgname = ""
        }
        configureLabel(BNombre)
        configureLabel(BIngredientes)
        configureLabel(BInstrucciones)
        
        
        if !imgname.isEmpty, let image = DrinkViewModel.shared.cargaImagen(fileName: imgname) {
            ImgBebida.image = image
        } else {
            print("Imagen no encontrada en el directorio Documents o imgname está vacío")
            
            
            let imageURLString = "http://janzelaznog.com/DDAM/iOS/drinksimages/\(imgname)"
            print(imageURLString)
            if let url = URL(string: imageURLString) {
                DrinkViewModel.shared.guardaImagen(from: url, imgname: imgname)
                ImgBebida.image = DrinkViewModel.shared.cargaImagen(fileName: imgname)
            }
        }
            
        
        /*
        var mensaje = "no hay conexion"
        if InternetMonitor.shared.hayConexion {
            mensaje = "La conexion a internet esta disponible"
            if InternetMonitor.shared.tipoConexionWiFi {
                mensaje += " por wifi"
                DrinkViewModel.shared.cargaImagen(:"")
            }else {
                mensaje += " pero solo por datos celulares"
                    
                let ac = UIAlertController(title: "hola", message: mensaje, preferredStyle: .alert)
                let action = UIAlertAction(title: "ok", style: .default){
                    aleraction in
                    DrinkViewModel.shared.cargaImagen()
                }
                ac.addAction(action)
                let action2 = UIAlertAction(title: "cancelar", style: .destructive)
                ac.addAction(action2)
                self.present(ac, animated: true)
            }
        }else{
            let ac = UIAlertController(title: "hola", message: mensaje, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
        
        */
        
    }
    
    func configureLabel(_ label: UILabel) {
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 4
        
    }
    
    



}




