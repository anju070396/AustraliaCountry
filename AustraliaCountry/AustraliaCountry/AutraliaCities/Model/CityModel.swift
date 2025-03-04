//
//  CityModel.swift
//  AustraliaCountry
//
//  Created by krishnarajs.pawar on 03/03/25.
//

import Foundation

struct CityModel: Identifiable , Codable {
    let id : UUID
    let city : String
    let lat : String
    let lng : String
    let country : String
    let iso2 : String
    let admin_name : String
    let capital : String
    let population : String
    let population_proper : String
    
    init(id: UUID, city: String, lat: String, lng: String, country: String, iso2: String, admin_name: String, capital: String, population: String, population_proper: String) {
        self.id = id
        self.city = city
        self.lat = lat
        self.lng = lng
        self.country = country
        self.iso2 = iso2
        self.admin_name = admin_name
        self.capital = capital
        self.population = population
        self.population_proper = population_proper
    }
   
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decode(String.self, forKey: .city)
        lat = try values.decode(String.self, forKey: .lat)
        lng = try values.decode(String.self, forKey: .lng)
        country = try values.decode(String.self, forKey: .country)
        iso2 = try values.decode(String.self, forKey: .iso2)
        admin_name = try values.decode(String.self, forKey: .admin_name)
        capital = try values.decode(String.self, forKey: .capital)
        population = try values.decode(String.self, forKey: .population)
        population_proper = try values.decode(String.self, forKey: .population_proper)
        id = UUID()
    }
}
