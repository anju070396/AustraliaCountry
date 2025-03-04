//
//  CitiesViewModel.swift
//  AustraliaCountry
//
//  Created by krishnarajs.pawar on 03/03/25.
//

import Foundation

class CitiesViewModel: ObservableObject {
    @Published var citiesByState: [String: [CityModel]] = [:]
    @Published var reversed = false
    private let cityService: CityServiceProtocol
    
    init(cityService: CityServiceProtocol = CityService()) {
        self.cityService = cityService
        loadCities()
    }
    
    func loadCities() {
        if let cachedCities = CacheManager.shared.loadFromCache() {
            updateCities(cities: cachedCities)
        } else if let cities = cityService.fetchCities() {
            CacheManager.shared.saveToCache(cities: cities)
            updateCities(cities: cities)
        }
    }
    func updateCities(cities: [CityModel]){
        let grouped = Dictionary(grouping: cities, by: { $0.admin_name})
        DispatchQueue.main.async {
            self.citiesByState = grouped
        }
    }
    
    func refreshData() {
        if let cities = cityService.fetchCities() {
            CacheManager.shared.saveToCache(cities: cities)
            updateCities(cities: cities)
        }
    }
    
    func toggleReverseOrder() {
        reversed.toggle()
        citiesByState = citiesByState.mapValues {$0.reversed()}
    }
}
