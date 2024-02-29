import SwiftUI
struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            if cartManager.paymentSuccess {
                Text("Thanks for your purchase!")
                    .padding()
            } else {
                if cartManager.products.count > 0 {
                    TableViewWrapper()
                        .environmentObject(cartManager)
                        .frame(height: 300)
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                } else {
                    Text("Your cart is empty.")
                }
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}
