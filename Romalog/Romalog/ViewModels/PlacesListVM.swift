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
        // places = PlaceVM.sampleData
        
        // coredata manager logic
        
        places = CoreDataManager.shared.getAll().map({ place in
            PlaceVM(id: place.id!, name: place.name!, city: place.city!, country: place.country!, notes: place.notes!, placeImage: Image(uiImage: UIImage(data: place.image!)!))
        })
        
    }
}
