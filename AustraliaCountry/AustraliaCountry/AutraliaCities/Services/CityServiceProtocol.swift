//
//  CityServiceProtocol.swift
//  AustraliaCountry
//
//  Created by krishnarajs.pawar on 03/03/25.
//

import Foundation

protocol CityServiceProtocol {
    func fetchCities() -> [CityModel]?
}

class CityService: CityServiceProtocol {
    func fetchCities() -> [CityModel]? { 
        if let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") ,
            let data = try? Data(contentsOf: url),
           let cities = try? JSONDecoder().decode([CityModel].self, from: data) {
            return cities
        }
            return nil
    }
}
