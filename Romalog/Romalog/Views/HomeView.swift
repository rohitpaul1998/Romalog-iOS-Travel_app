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
                    placesView()
                } else {
                    emptyStateView()
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
                    .presentationDragIndicator(.hidden)
                    .presentationCornerRadius(20)
                    .presentationBackground(.ultraThinMaterial)
            }
        }
    }
    
    private func placesView() -> some View {
        GeometryReader {geo in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.places) { place in
                        placesCell(place, imageMaxWidth: geo.size.width * 0.95)
                    }
                }
            }
        }
    }
    
    private func placesCell(_ place: PlaceVM, imageMaxWidth: CGFloat) -> some View {
        NavigationLink {
            LazyView {
                PlaceDetailView(place: place)
            }
        } label: {
            ZStack(alignment: .bottom) {
                place.placeImage
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: imageMaxWidth)
                
                VStack {
                    Label(place.name, systemImage: "mappin.circle.fill")
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Spacer()
                    HStack {
                        Text(place.city)
                        Spacer()
                        Text(place.country)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                }
            }
            .contentShape(Rectangle())
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(.plain)
    }
    
    private func emptyStateView() -> some View {
        Group {
            Spacer()
            Text("Tap on + to add your most recent travel log")
                .font(.largeTitle)
                .foregroundStyle(.secondary.opacity(0.5))
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
