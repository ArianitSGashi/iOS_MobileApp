
import Foundation
import CoreData

class DataController: ObservableObject {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ProductModel")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
            
            if let url = self.persistentContainer.persistentStoreCoordinator.persistentStores.first?.url {
                print("SQLite file URL: \(url)")
            } else {
                print("Unable to retrieve SQLite file URL")
            }
        }
    }
    
    
    func saveProductAsClothes(product: Product) {
        let context = persistentContainer.viewContext
        let clothes = ProductEntity(context: context)
        
        clothes.id = UUID()
        clothes.name = product.name
        clothes.image = product.image
        clothes.price = product.price
        
        do {
            try context.save()
        } catch {
            print("Failed to save clothes: \(error)")
        }
    }
}

