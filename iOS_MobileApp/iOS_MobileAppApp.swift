import SwiftUI
import FirebaseCore

@main
struct iOS_MobileAppApp: App {
    @StateObject var cartManager = CartManager() // Declare cartManager as @StateObject if it conforms to ObservableObject
    @StateObject private var dataController = DataController()
   
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
                .environmentObject(dataController)
                .environment(\.managedObjectContext, dataController.persistentContainer.viewContext)
        }
    }
}

