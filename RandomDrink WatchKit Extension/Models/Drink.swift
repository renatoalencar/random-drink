
struct Drink {
    let name: String
    let instructions: String
    let imageURL: String
    
    init(response: DrinkItemResponse) {
        self.name = response.strDrink
        self.instructions = response.strInstructions
        self.imageURL = response.strDrinkThumb
    }
    
    init(name: String, instructions: String, imageURL: String) {
        self.name = name
        self.instructions = instructions
        self.imageURL = imageURL
    }
}
