//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Néstor I. Martínez Ostoa on 31/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.cupcakeorder.type){
                        ForEach(0..<Cupcakeorder.types.count, id: \.self) {
                            Text(Cupcakeorder.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.cupcakeorder.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.cupcakeorder.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.cupcakeorder.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if order.cupcakeorder.specialRequestEnabled {
                        Toggle(isOn: $order.cupcakeorder.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.cupcakeorder.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    } 
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
        .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
