
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        
        if userID == "" {
            AuthView()
        } else {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                .navigationTitle(Text("Clothing Shop"))
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink {
                            CartView()
                                .environmentObject(cartManager)
                        } label: {
                            SignOutButton()
                            CartButton(numberOfProducts: cartManager.products.count)
                            
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark) // You can adjust the color scheme as needed
            .onAppear {
                // Set a dummy user ID for preview
                UserDefaults.standard.set("dummy_user_id", forKey: "uid")
            }
    }
}
