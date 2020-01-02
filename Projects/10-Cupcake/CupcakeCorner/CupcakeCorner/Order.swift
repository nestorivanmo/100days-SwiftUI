//
//  Order.swift
//  CupcakeCorner
//
//  Created by Néstor I. Martínez Ostoa on 01/01/20.
//  Copyright © 2020 Néstor I. Martínez Ostoa. All rights reserved.
//

import Foundation

struct Cupcakeorder: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 3
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAdress = ""
    var city = ""
    var zip = ""
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var hasValidAddress: Bool {
        if name.isEmpty || streetAdress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }else {
            if name == " " || streetAdress == " " || city == " " || zip == " " {
                return false
            }
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

class Order: ObservableObject, Codable {
    @Published var cupcakeorder = Cupcakeorder()
    
    enum CodingKeys: CodingKey {
        case cupcakeorder
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cupcakeorder, forKey: .cupcakeorder)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cupcakeorder = try container.decode(Cupcakeorder.self, forKey: .cupcakeorder)        
    }
    
    init() {}
}
