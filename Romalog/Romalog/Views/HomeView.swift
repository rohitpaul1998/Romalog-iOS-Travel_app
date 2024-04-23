//
//  HomeView.swift
//  Romalog
//
//  Created by Rohit Paul on 4/22/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = PlacesListVM()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                topHeader()
                if !viewModel.places.isEmpty {
                    // placesView()
                } else {
                    // emptyStateView()
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.fetchPlaces()
            }
        }
    }
    
    private func topHeader() -> some View {
        HStack {
            Text("Romalog")
                .font(.largeTitle)
            Spacer()
            
            Button(action: { viewModel.showAddSheet.toggle() }) {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                    .tint(Color.cyan.gradient)
            }
            .sheet(isPresented: $viewModel.showAddSheet, onDismiss: {
                viewModel.fetchPlaces()
            }) {
                AddNewPlaceView()
                    .presentationDetents([.large])
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
