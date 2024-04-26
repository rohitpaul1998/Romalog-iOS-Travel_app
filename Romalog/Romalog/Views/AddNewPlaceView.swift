//
//  AddNewPlaceView.swift
//  Romalog
//
//  Created by Rohit Paul on 4/22/24.
//

import SwiftUI

struct AddNewPlaceView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = AddPlaceVM()
    
    var body: some View {
        ZStack {
            VStack {
                Text("New Travel Log")
                    .font(.title)
                Group {
                    TextField("Name of the place", text: $viewModel.name)
                    TextField("City", text: $viewModel.city)
                    TextField("Country", text: $viewModel.country)
                    TextField("Notes", text: $viewModel.notes)
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                
                Spacer()
                
                if let image = viewModel.image {
                    image
                        .resizable()
                        .frame(width: 200, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image("Holy_sepulchre_jerusalem")
                        .resizable()
                        .blur(radius: 30)
                        .frame(width: 200, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button("Get Image") {
                    Task {
                        await viewModel.getImageFor(placeName:viewModel.name)
                    }
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .disabled(viewModel.name.isEmpty)
                
                Spacer()
                HStack {
                    Button(action: {
                        savePlace()
                    }) {
                        Label("Save", systemImage: "doc.fill.badge.plus")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(role: .destructive, action: {
                        dismiss()
                    }) {
                        Label("Cancel", systemImage: "x.square.fill")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            
            if viewModel.showProgress {
                Rectangle()
                    .foregroundStyle(Color.secondary.opacity(0.8))
                ProgressView {
                    Text("Saving travel log...")
                }
            }
        }
        .interactiveDismissDisabled()
    }
    
    private func savePlace() {
        viewModel.showProgress.toggle()
        Task {
            await viewModel.savePlace()
            DispatchQueue.main.async {
                dismiss()
            }
        }
    }
}

#Preview {
    AddNewPlaceView()
        .preferredColorScheme(.dark)
}
