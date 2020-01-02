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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
