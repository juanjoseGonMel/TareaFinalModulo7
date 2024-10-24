//
//  DrinkViewModel.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import Foundation
import CoreData
import UIKit


class DrinkViewModel {
    
    static let shared = DrinkViewModel()
    private init() {
    }
    
    
    var drinks: [Drinks] = []
    private let context = DataManager.shared.persistentContainer.viewContext
    
    func cargaBebidas() -> [Drinks] {
        var bebidas = [Drinks]()
        let elQuery: NSFetchRequest<Drinks> = Drinks.fetchRequest()
        do {
            bebidas = try context.fetch(elQuery)
        } catch { print ("error en el query!") }
        return bebidas
    }
    
    func descargaDB () {
        let ud = UserDefaults.standard
        if ud.integer(forKey: "BD-OK") != 1 {  // La base de datos no se ha descargado
            if InternetMonitor.shared.hayConexion {
                if let laURL = URL(string: "http://janzelaznog.com/DDAM/iOS/drinks.json") {
                    let sesion = URLSession(configuration: .default)
                    let tarea = sesion.dataTask(with:URLRequest(url:laURL)) { data, response, error in
                        print("Entrando al bloque de URLSession Task")
                        if error != nil {  // let _ = error (MUY swifty)
                            // algo salió mal
                            print ("no se pudo descargar el feed de mascotas \(error?.localizedDescription ?? "")")
                            return
                        }
                        // llenar la base de datos
                        do {
                            let tmp = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
                            print("Datos JSON: \(tmp)")
                            self.guardaBebidas(tmp)
                            ud.set(1, forKey:"BD-OK")
                        }
                        catch { print ("no se obtuvo un JSON en la respuesta") }
                        
                    }
                    tarea.resume()
                }
            }
        }
    }
    
    func guardaBebidas(_ arregloJSON:[[String:Any]]) {
        guard let entidadDesc = NSEntityDescription.entity(forEntityName:"Drinks", in:context)
        else { return }
        for dict in arregloJSON {
            // 1. crear un objeto Mascota
            let b = NSManagedObject(entity: entidadDesc, insertInto: context) as! Drinks
            // 2. setear las properties del objeto, con los datos del dict
            b.inicializaCon(dict)
        }
        // 3. salvar el objeto
        saveContext()
    }
    
    func guardaBebida(name: String, ingredients: String, instructions: String){
        guard let entidadDesc = NSEntityDescription.entity(forEntityName:"Drinks", in:context)
        else { return }
        // 1. crear un objeto Mascota
        let b = NSManagedObject(entity: entidadDesc, insertInto: context) as! Drinks
        // 2. setear las properties del objeto, con los datos del dict
        b.name = name
        b.ingredients = ingredients
        b.directions = instructions
        b.img = ""
        // 3. salvar el objeto
        saveContext()
        
    }
        
    
    /*
    
    private func downloadDefaultDrinks(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://janzelaznog.com/DDAM/iOS/drinks.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let defaultDrinks = try JSONDecoder().decode([Drinks].self, from: data)
                self.drinks = defaultDrinks
                for drink in defaultDrinks {
                    let newDrink = Drinks(context: self.context)
                    newDrink.name = drink.name
                    newDrink.ingredients = drink.ingredients
                    newDrink.instructions = drink.instructions
                    newDrink.image = drink.image
                }
                self.saveContext()
                completion()
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    
    func loadDrinks(completion: @escaping () -> Void) {
        let request: NSFetchRequest<Drinks> = Drinks.fetchRequest()
        do {
            drinks = try context.fetch(request)
            if drinks.isEmpty {
                downloadDefaultDrinks(completion: completion)
            } else {
                completion()
            }
        } catch {
            print("Error fetching data from Core Data: \(error)")
        }
    }
    
    private func downloadDefaultDrinks(completion: @escaping () -> Void) {
        guard let url = URL(string: "http://janzelaznog.com/DDAM/iOS/drinks.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let defaultDrinks = try JSONDecoder().decode([Drinks].self, from: data)
                self.drinks = defaultDrinks
                for drink in defaultDrinks {
                    let newDrink = Drinks(context: self.context)
                    newDrink.name = drink.name
                    newDrink.ingredients = drink.ingredients
                    newDrink.instructions = drink.instructions
                    newDrink.image = drink.image
                }
                self.saveContext()
                completion()
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func addDrink(name: String, ingredients: String, instructions: String, image: String, completion: @escaping () -> Void) {
        let newDrink = Drinks(context: context)
        newDrink.name = name
        newDrink.ingredients = ingredients
        newDrink.directions = instructions
        newDrink.img = image
        saveContext()
        loadDrinks(completion: completion)
    }*/
    
    private func saveContext() {
        DataManager.shared.saveContext()
    }
}


/*
func todasLasMascotas() -> [Mascota] {
    var arreglo = [Mascota]()
    let elQuery = Mascota.fetchRequest()
    do {
        arreglo = try persistentContainer.viewContext.fetch(elQuery)
    } catch { print ("error en el query!") }
    return arreglo
}

func llenaBD () {
    let ud = UserDefaults.standard
    if ud.integer(forKey: "BD-OK") != 1 {  // La base de datos no se ha descargado
        if InternetMonitor.shared.hayConexion {
            if let laURL = URL(string: "https://my.api.mockaroo.com/mascotas.json?key=ee082920") {
                let sesion = URLSession(configuration: .default)
                let tarea = sesion.dataTask(with:URLRequest(url:laURL)) { data, response, error in
                    if error != nil {  // let _ = error (MUY swifty)
                        // algo salió mal
                        print ("no se pudo descargar el feed de mascotas \(error?.localizedDescription ?? "")")
                        return
                    }
                    // llenar la base de datos
                    do {
                        let tmp = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
                        self.guardaMascotas (tmp)
                        self.llenaBD_Personas()
                    }
                    catch { print ("no se obtuvo un JSON en la respuesta") }
                    ud.set(1, forKey:"BD-OK")
                }
                tarea.resume()
            }
        }
    }
}

func llenaBD_Personas () {
    if let laURL = URL(string: "https://my.api.mockaroo.com/responsables.json?key=ee082920") {
        let sesion = URLSession(configuration: .default)
        let tarea = sesion.dataTask(with:URLRequest(url:laURL)) { data, response, error in
            if error != nil {
                print ("no se pudo descargar el feed de mascotas \(error?.localizedDescription ?? "")")
                return
            }
            do {
                let tmp = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
                self.guardaResponsables (tmp)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"BD_LISTA"), object:nil)
            }
            catch { print ("no se obtuvo un JSON en la respuesta") }
        }
        tarea.resume()
    }
}

func guardaResponsables(_ arregloJSON:[[String:Any]]) {
    guard let entidadDesc = NSEntityDescription.entity(forEntityName:"Responsable", in:persistentContainer.viewContext)
    else { return }
    for dict in arregloJSON {
        let r = NSManagedObject(entity: entidadDesc, insertInto: persistentContainer.viewContext) as! Responsable
        r.inicializaCon(dict)
        // buscar si existe una mascota relacionada
        if let idMascota = dict["dueño_de"] as? Int16,
           idMascota != 0 {
            if let mascota = buscaMascotaConId(idMascota) {
                // establecemos la relación del responsable con la mascota
                r.mascotas?.adding(mascota)
                saveContext()
                // y también la relación de la mascota con el responsable
                mascota.responsable = r
            }
            else { saveContext() }
        }
        else { saveContext() }
    }
}

func buscaMascotaConId(_ idM: Int16) -> Mascota? {
    let elQuery = NSFetchRequest<NSFetchRequestResult>(entityName:"Mascota")
    let elFiltro = NSPredicate (format:"id == %d", idM)
    elQuery.predicate = elFiltro
    do {
        let tmp = try persistentContainer.viewContext.fetch(elQuery) as! [Mascota]
        return tmp.first
    } catch { print ("error en el query!") }
    return nil
}

func guardaMascotas(_ arregloJSON:[[String:Any]]) {
    guard let entidadDesc = NSEntityDescription.entity(forEntityName:"Mascota", in:persistentContainer.viewContext)
    else { return }
    for dict in arregloJSON {
        // 1. crear un objeto Mascota
        let m = NSManagedObject(entity: entidadDesc, insertInto: persistentContainer.viewContext) as! Mascota
        // 2. setear las properties del objeto, con los datos del dict
        m.inicializaCon(dict)
    }
    // 3. salvar el objeto
    saveContext()
}

 */
