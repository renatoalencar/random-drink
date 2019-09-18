import SwiftUI

class AppState: ObservableObject {
    @Published var drink: Drink?
    
    var randomDrinkService = RandomDrinkService()
    
    func random() {
        self.drink = nil
        randomDrinkService.random() { drink in
            DispatchQueue.main.async {
                self.drink = drink
            }
        }
    }
}
