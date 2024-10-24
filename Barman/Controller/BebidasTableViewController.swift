//
//  BebidasTableViewController.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import UIKit

class BebidasTableViewController: UITableViewController {
    var bebidas = [Drinks]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default
            .addObserver(self, selector: #selector(mostrarTabla), name: NSNotification.Name(rawValue: "BD_LISTA"), object: nil)
    }
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bebidas = DrinkViewModel.shared.cargaBebidas()
        NotificationCenter.default.addObserver(self, selector:#selector(mostrarTabla), name:NSNotification.Name(rawValue:"BD_LISTA"), object:nil)
    }*/
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mostrarTabla()}
        
    
    
    @objc func mostrarTabla() {
        bebidas = DrinkViewModel.shared.cargaBebidas()
        print ("mostrando la tabla")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func AgregarBebidabtn(_ sender: Any) {
        performSegue(withIdentifier: "agregarBebida", sender: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bebidas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bebidasCell", for: indexPath)
        let b = bebidas[indexPath.row]
        cell.textLabel?.text = b.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let b = bebidas[indexPath.row]
        performSegue(withIdentifier:"detail", sender:b)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            if let send = sender as? Drinks {
                let detailVC = segue.destination as! DetailViewController
                detailVC.laBebida = send
            }
        } else if segue.identifier == "agregarBebida" {
            let detailVC = segue.destination as! NewBebidasViewController
            detailVC.laBebida = nil
        }
        
        
        
    }


}
