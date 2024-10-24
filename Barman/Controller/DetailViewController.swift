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
    }
    
    
    @IBOutlet var BNombre: UITextView!
    
    @IBOutlet var BIngredientes: UITextView!
    
    @IBOutlet var BInstrucciones: UITextView!
    
    @IBOutlet var BImg: UIImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    



}




