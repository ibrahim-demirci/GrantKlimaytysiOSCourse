//
//  DataStore.swift
//  WhereWasI
//
//  Created by İbrahim Demirci on 20.12.2021.
//

import Foundation

struct StorageKeys {
    
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"

}

class DataStore {
    
    func GetDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func StoreDataPoint(latitude: String, longitude: String) {
        let def = GetDefaults()
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        def.synchronize()
        
        print(latitude + " : "+longitude)
        
    }
    
    func GetLastLocation() -> VisitedPoint? {
        let def = GetDefaults()
        
        if let lat = def.string(forKey: StorageKeys.storedLat) {
            if let long = def.string(forKey: StorageKeys.storedLong) {
                return VisitedPoint(latitude: lat, longitude: long)
            }
        }
        return nil
    }
}
