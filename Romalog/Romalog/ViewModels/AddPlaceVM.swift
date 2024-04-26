//
//  AddPlaceVM.swift
//  Romalog
//
//  Created by Rohit Paul on 4/22/24.
//

import Foundation
import SwiftUI
import UIKit

class AddPlaceVM: ObservableObject {
    @Published var name: String = ""
    @Published var city: String = ""
    @Published var country: String = ""
    @Published var notes: String = ""
    
    // progress properties
    @Published var showProgress = false
    
    // image related properties
    @Published var image: Image?
    @Published var imageData: Data?
    
    func savePlace() async {
        // coredata manager save place logic
        if let data = imageData {
            CoreDataManager.shared.save(name: name, notes: notes, city: city, country: country, imageData: data)
        }
    }
    
    func getImageFor(placeName: String) async {
        let encodedName = placeName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        let url = URL(string: "https://source.unsplash.com//1080x1350/?\(encodedName)")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run {
                imageData = data
                image = Image(uiImage: UIImage(data: data)!)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
}
