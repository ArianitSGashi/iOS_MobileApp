import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Double = 0
    var dataController: DataController?

   
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    

    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }

    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    

    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            DispatchQueue.main.async {
                self.paymentSuccess = success
                if success {
                    self.products.forEach { product in
                        self.dataController?.saveProductAsClothes(product: product)
                    }
                    // Clear the cart after saving to the database
                    self.products.removeAll()
                    self.total = 0
                }
            }
        }
    }

}






