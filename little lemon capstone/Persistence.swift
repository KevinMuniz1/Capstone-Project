import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "dishesData")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func clear() {
        // Delete all dishes from the store
        
        let context = PersistenceController.shared.container.viewContext
        
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        
        do {
            let dishesToDelete = try context.fetch(fetchRequest)
            for dish in dishesToDelete {
                context.delete(dish)
            }
            
            try context.save() // Save the changes to the persistent store
        } catch {
            // Handle error
            print("Error deleting data: \(error)")
           
        }
        print("Clearing data")
    }
    
}




