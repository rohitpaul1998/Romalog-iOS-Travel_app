//
//  PlaceVM.swift
//  Romalog
//
//  Created by Rohit Paul on 4/21/24.
//

import Foundation
import SwiftUI

class PlaceVM: Identifiable {
    var id: UUID
    var name: String
    var city: String
    var country: String
    var notes: String
    var placeImage: Image
    
    init(id: UUID, name: String, city: String, country: String, notes: String, placeImage: Image) {
        self.id = id
        self.name = name
        self.city = city
        self.country = country
        self.notes = notes
        self.placeImage = placeImage
    }
}

extension PlaceVM {
    static var sampleData: [PlaceVM] {
        [
            .init(id: UUID(), name: "Colosseum", city: "Rome", country: "Italy", notes: "Had the privilege to visit colosseum in Rome. One of the must visit places. Will never forget this moment with the fam xx", placeImage: Image("Rome")),
            .init(id: UUID(), name: "Holy Sepulchre", city: "Old Jerusalem", country: "Israel", notes: "What a moment to live in! I alwasy dreamt of taking my parents and family to Jerusalem where our Lord and savior was born!!", placeImage: Image("Holy_sepulchre_jerusalem")),
            .init(id: UUID(), name: "Sydney Opera House", city: "New South Wales", country: "Australia", notes: "If you like monumental places, I'd recommend to visit Australia, 'specially Sydney's Opera House in New South Wales, Australia!", placeImage: Image("Australia"))
        ]
    }
}
