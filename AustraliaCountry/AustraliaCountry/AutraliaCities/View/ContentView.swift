//
//  ContentView.swift
//  AustraliaCountry
//
//  Created by krishnarajs.pawar on 03/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CitiesViewModel()
     @State private var expandStates: Set<String> = []
     var body: some View {
         NavigationView {
             VStack {
                 List {
                     ForEach(viewModel.citiesByState.keys.sorted(), id: \ .self) { state in
                         
                         Section(header: HStack {
                             Text(state)
                                 .foregroundColor(.white)
                                 .font(.custom("AppleSDGothicNeo-Heavy", size: 19))
                         }
                            .frame(width: 360, height: 55, alignment: .leading)
                            .background(.yellow)
                            .cornerRadius(10)
                            .onTapGesture {
                                if expandStates.contains(state){
                                    expandStates.remove(state)
                                } else {
                                    expandStates.insert(state)
                                }
                            }) {
                                     if expandStates.contains(state) {
                                         ForEach(viewModel.citiesByState[state] ?? []) {
                                             city in
                                             Text(city.city)
                                                 .font(.custom("AppleSDGothicNeo-Heavy", size: 18)) .foregroundColor(.gray)
                                         }
                                     }
                                 }
                     }
                 }
                 .listStyle(.plain)
                 
                 .refreshable {
                     viewModel.refreshData()
                 }
                 Button("Reverse"){
                     viewModel.toggleReverseOrder()
                 }
                 .frame(width: 300, height: 36, alignment: .center)
                 .background(.green)
                 .cornerRadius(20)
                 .foregroundColor(.white)
                 .fontWeight(.semibold)
                 .padding()
             }
             .navigationTitle("Australia Country")
         }
     }
 }

 #Preview {
     ContentView()
 }

