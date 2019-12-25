//
//  AstronautView.swift
//  Moonshot
//
//  Created by Néstor I. Martínez Ostoa on 24/12/19.
//  Copyright © 2019 Néstor I. Martínez Ostoa. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(astronaut: Astronaut, allMissions: [Mission]) {
        self.astronaut = astronaut
        var matches = [Mission]()
        for mission in allMissions {
            for crew in mission.crew {
                if astronaut.id == crew.name {
                    matches.append(mission)
                }
            }
        }
        self.missions = matches
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    Text("Missions")
                        .font(.title)
                        .padding()
                    ForEach(self.missions, id: \.id) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            
                            VStack(alignment: .leading) {
                                Text("\(mission.displayName)")
                                    .bold()
                                Text("\(mission.formattedLaunchDate)")
                                    .font(.subheadline)
                            }

                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], allMissions: missions)
    }
}
