import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @StateObject private var dataController = DataController()
    var product: Product
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .cornerRadius(20)
                .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("$\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            Button(action: {
                cartManager.addToCart(product: product)
                dataController.saveProductAsClothes(product: product)
            }) {
                Text("Add to Cart")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
