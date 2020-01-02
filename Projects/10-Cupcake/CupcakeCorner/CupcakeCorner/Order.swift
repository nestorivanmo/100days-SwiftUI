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
    @Published var name = ""
    @Published var streetAdress = ""
    @Published var city = ""
    @Published var zip = ""
    var hasValidAddress: Bool {
        if name.isEmpty || streetAdress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
}
