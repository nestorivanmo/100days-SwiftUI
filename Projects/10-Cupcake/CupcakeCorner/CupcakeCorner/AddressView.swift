//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Néstor I. Martínez Ostoa on 01/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.cupcakeorder.name)
                TextField("Street Address", text: $order.cupcakeorder.streetAdress)
                TextField("City", text: $order.cupcakeorder.city)
                TextField("Zip", text: $order.cupcakeorder.zip)
            }
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.cupcakeorder.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline )
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
