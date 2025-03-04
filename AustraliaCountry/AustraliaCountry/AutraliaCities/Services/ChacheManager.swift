//
//  ChacheManager.swift
//  AustraliaCountry
//
//  Created by krishnarajs.pawar on 03/03/25.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    private let chacheStorage = "chacheStorage"
    
    func saveToCache(cities: [CityModel]) {
        if let encoded = try? JSONEncoder().encode(cities){
            UserDefaults.standard.set(encoded , forKey: chacheStorage)
        }
    }
    
    func loadFromCache() -> [CityModel]? {
        if let savedData = UserDefaults.standard.data(forKey: chacheStorage) ,
           let decodedCities = try? JSONDecoder().decode([CityModel].self, from: savedData) {
            return decodedCities
        }
        return nil
    }
}
