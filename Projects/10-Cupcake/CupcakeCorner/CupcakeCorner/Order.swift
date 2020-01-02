//
//  Order.swift
//  CupcakeCorner
//
//  Created by Néstor I. Martínez Ostoa on 01/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
