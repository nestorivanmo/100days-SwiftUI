//
//  Mission.swift
//  Moonshot
//
//  Created by Néstor I. Martínez Ostoa on 24/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    //Nested struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
