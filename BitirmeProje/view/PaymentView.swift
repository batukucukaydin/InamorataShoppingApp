//
//  PaymentView.swift
//  BitirmeProje
//
//  
//

import SwiftUI

struct PaymentView: View {
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var cardHolderName: String = ""
    @State private var isPaymentSuccessful: Bool = false
    @State private var showingPaymentAlert = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Ödeme Bilgileri")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                TextField("Kart Numarası", text: $cardNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                TextField("Son Kullanma Tarihi (MM/YY)", text: $expiryDate)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                TextField("CVV", text: $cvv)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                TextField("Kart Sahibinin Adı", text: $cardHolderName)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                
                Button(action: {
                    // Implement payment processing logic here
                    processPayment()
                }) {
                    Text("Ödemeyi Tamamla")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .alert(isPresented: $showingPaymentAlert) {
                    Alert(title: Text(isPaymentSuccessful ? "Başarılı" : "Başarısız"), message: Text(isPaymentSuccessful ? "Ödemeniz başarıyla gerçekleşti." : "Ödeme işlemi başarısız oldu."), dismissButton: .default(Text("Tamam")))
                }
            }
            .padding()
            .navigationTitle("Ödemeyi Tamamla")
        }
    }

    private func processPayment() {
        // Simulate payment processing
        // Set isPaymentSuccessful to true if payment is successful
        // For now, we'll randomly set it to true or false
        isPaymentSuccessful = Bool.random()
        showingPaymentAlert = true
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
