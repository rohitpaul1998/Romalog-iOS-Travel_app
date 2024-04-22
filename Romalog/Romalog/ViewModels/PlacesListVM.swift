//
//  PlacesListVM.swift
//  Romalog
//
//  Created by Rohit Paul on 4/21/24.
//

import Foundation
import SwiftUI
import UIKit

class PlacesListVM: ObservableObject {
    @Published var places = [PlaceVM]()
    @Published var showAddSheet = false
    
    init() {
        fetchPlaces()
    }
    
    func fetchPlaces() {
        places = PlaceVM.sampleData
        
        // coredata manager
        
    }
}
