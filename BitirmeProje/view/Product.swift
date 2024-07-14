//
//  Product.swift
//  BitirmeProje
//
//  
//
import SwiftUI

struct Product: View {
    var data: ProductsModel
    @State var selectedSize = 128
    @State private var quantity: Int = 1
    @EnvironmentObject var cartManager: CartManager
    @State private var showARView = false
    @Environment(\.presentationMode) var dismiss

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ZStack(alignment: .top) {
                        ImageSlider(images: data.images)
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .padding(10)
                            .padding(.top, 50)
                        // Navigation
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color("GradientTop"))
                                .onTapGesture {
                                    dismiss.wrappedValue.dismiss()
                                }
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(Color("GradientTop"))
                        }
                        .padding(.top, safeArea().top)
                        .padding(.horizontal, 30)
                        .imageScale(.large)
                    }

                    Text(data.title)
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("GradientTop"))
                        .padding(.top, 20)

                    Text("₺\(data.price)")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("GradientTop"))

                    VStack(alignment: .leading) {
                        Text("Beden/Boyut")
                            .font(.title.bold())
                            .foregroundColor(Color("GradientTop"))

                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(data.sizes, id: \.self) { item in
                                    Text("\(item)")
                                        .font(.headline)
                                        .frame(width: 70, height: 70)
                                        .background(selectedSize == item ? Color("GradientTop") : .gray.opacity(0.06))
                                        .foregroundColor(selectedSize == item ? .white : Color("GradientTop"))
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        .onTapGesture {
                                            selectedSize = item
                                        }
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding()

                    Text(data.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding()

                    // Quantity Selector
                    HStack {
                        Button(action: {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                        }

                        Text("\(quantity)")
                            .font(.title2)
                            .padding(.horizontal)

                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                    .padding()
                    .foregroundColor(Color("GradientTop"))

                    Button(action: {
                        cartManager.addToCart(product: data, quantity: quantity)
                    }) {
                        Text("Sepete Ekle")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    Button(action: {
                        showARView = true
                    }) {
                        HStack {
                            Image(systemName: "arkit")
                            Text("AR")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
            // Bottom bar
        }
        .sheet(isPresented: $showARView) {
            ARView(modelName: data.title) // Verilen model ismini kullanıyoruz
        }
    }
}

struct Product_Previews: PreviewProvider {
    static var previews: some View {
        Product(data: sampleProducts[0])
            .environmentObject(CartManager())
    }
}

extension View {
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }

        return safeArea
    }
}
