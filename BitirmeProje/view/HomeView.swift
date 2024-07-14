//
//  HomeView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct HomeView: View {
    
    @State var currentCategory = "Hepsi"
    @State var productsList = sampleProducts
    @State var selectedSize = 128
    @State var product : ProductsModel? = nil
    @State var showProduct = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image("logo2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 225, height: 100)
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical, 25)
                            .padding(.horizontal, 16)
                            .imageScale(.large)
                            .foregroundColor(Color("GradientTop"))
                    }
                    
                    categoriesView
                    productsView
                        .fullScreenCover(isPresented: $showProduct, content: {
                            Product(data: product ?? sampleProducts[0])
                        })
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    var categoriesView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(sampleBrands, id: \.id) { item in
                    HStack {
                        if !item.icon.isEmpty {
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                        }
                        
                        Text(item.title)
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : Color("GradientTop"))
                    .padding()
                    .background(currentCategory == item.title ? Color("GradientTop") : .gray.opacity(0.08))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            currentCategory = item.title
                            filterProducts(item.title)
                            updateSelectedSize(for: item.title)
                        }
                    }
                }
            }
        }
    }
    
    var productsView : some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(productsList, id: \.id) { item in
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
                    .onTapGesture{
                        product = item
                        showProduct = true
                  }
                }
            
                
            }
            .padding(.horizontal)
        }
    }
    
    func filterProducts(_ category: String) {
        if category == "Hepsi" {
            productsList = sampleProducts
        } else {
            productsList = sampleProducts.filter { $0.brand == category }
        }
    }
    
    func updateSelectedSize(for category: String) {
        switch category {
        case "Giyim":
            selectedSize = 40
        case "Elektronik":
            selectedSize = 128
        case "Eşya":
            selectedSize = 0
        default:
            selectedSize = 128
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
