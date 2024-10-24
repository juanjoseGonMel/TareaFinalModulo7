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
    private var monitorQueue = DispatchQueue(label: "InternetMonitorQueue")
    
    private override init() {
        super.init()
        setupMonitor()
        // que debe de hacer cuando cambie el estado de la conexion...
        
    }
    
    private func setupMonitor() {
        monitor.pathUpdateHandler = { [weak self] ruta in
            guard let self = self else { return }
            self.hayConexion = ruta.status == .satisfied
            self.tipoConexionWiFi = ruta.usesInterfaceType(.wifi)
            
            if self.hayConexion {
                print("Conectado a Internet")
                if self.tipoConexionWiFi {
                    print("Conectado a WiFi")
                } else {
                    print("Conectado a otra red")
                }
            } else {
                print("Sin conexión a Internet")
            }
            
            NotificationCenter.default.post(name: .networkStatusChanged, object: nil)
        }
        monitor.start(queue: monitorQueue)
    }
}


// Extensión para la notificación
extension Notification.Name {
    static let networkStatusChanged = Notification.Name("networkStatusChanged")
}
