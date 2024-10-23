//
//  InternetMonitor.swift
//  Barman
//
//  Created by DISMOV on 23/10/24.
//

import Foundation
import Network

class InternetMonitor:NSObject {
    static let shared = InternetMonitor()
    
    var hayConexion = false
    var tipoConexionWiFi = false
    private var monitor = NWPathMonitor()
    
    private override init() {
        super.init()
        // que debe de hacer cuando cambie el estado de la conexion...
        self.monitor.pathUpdateHandler = { ruta in
            self.hayConexion = ruta.status == .satisfied
            self.tipoConexionWiFi = ruta.usesInterfaceType(.wifi)
        }
        // para que comienze a revisar si hay cambios...
        // los procesos que pueden tomar mucho tiempo o muchos recursos se DEBEN mandar a background
        monitor.start(queue:DispatchQueue.global(qos: .background))
    }
}
