//
//  CartView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "cart")
                        .font(.largeTitle)
                        .foregroundColor(Color("GradientTop"))
                    Text("Sepet")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("GradientTop"))
                    Spacer()
                }
                .padding()

                List {
                    ForEach(cartManager.cartItems) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.product.images[0])) { img in
                                img.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 5))

                            VStack(alignment: .leading) {
                                Text(item.product.title)
                                    .font(.headline)
                                Text("₺\(item.product.price) x \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Button(action: {
                                cartManager.removeFromCart(product: item.product)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }

                HStack {
                    Text("Toplam Fiyat: ₺\(cartManager.totalCost())")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // Ödeme sayfasına geçiş
                    }) {
                        Text("Alışverişi Tamamla")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Sepet")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
