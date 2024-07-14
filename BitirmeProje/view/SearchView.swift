//
//  SearchView.swift
//  BitirmeProje
//
// 
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var filteredProducts: [ProductsModel] = sampleProducts

    var body: some View {
        VStack {
            TextField("Ürün veya Kategori Ara", text: $searchText)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .font(.system(size: 18, weight: .medium, design: .default))
                .onChange(of: searchText) { newValue in
                    self.filterProducts()
                }

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredProducts, id: \.id) { item in
                        VStack {
                            AsyncImage(url: URL(string: item.images[0])) { img in
                                img.resizable()
                                    .scaledToFill()
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: (UIScreen.main.bounds.width / 2) - 30)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30, height: (UIScreen.main.bounds.width / 2) - 30)
                            }
                            .clipShape(Rectangle())
                            
                            Text(item.title)
                                .font(.headline.bold())
                                .multilineTextAlignment(.center)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                                .foregroundColor(Color("GradientTop"))
                            
                            Text("₺\(item.price)")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                                .foregroundColor(Color("GradientTop"))
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: (UIScreen.main.bounds.width / 2) - 20)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func filterProducts() {
        if searchText.isEmpty {
            filteredProducts = sampleProducts
        } else {
            filteredProducts = sampleProducts.filter { product in
                product.title.lowercased().hasPrefix(searchText.lowercased()) ||
                product.brand.lowercased() == searchText.lowercased()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

