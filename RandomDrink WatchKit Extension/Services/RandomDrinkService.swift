import Foundation
import Alamofire

struct DrinkItemResponse: Decodable {
    let strDrink: String
    let strInstructions: String
    let strDrinkThumb: String
}

struct DrinkResponse: Decodable {
    let drinks: [DrinkItemResponse]
}

class RandomDrinkService: NSObject {
    private let randomDrinkURL = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    
    func random(completion: @escaping (Drink?) -> Void) {
        AF.request(randomDrinkURL).responseDecodable(of: DrinkResponse.self) { response in
            completion(Drink(response: (response.value?.drinks[0])!))
        }
    }
}
