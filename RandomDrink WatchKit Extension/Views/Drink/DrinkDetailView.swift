
import SwiftUI

struct DrinkDetailView: View {
    var drink: Drink
    var body: some View {
        ScrollView {
            VStack(spacing: 1.0) {
                RemoteImage(url: drink.imageURL) { (image, loaded) in
                    Image(uiImage: image)
                        .resizable()
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fill)
                }
                Text(drink.instructions)
                    .font(.caption)
            }
        }.navigationBarTitle(drink.name)
    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let drink = Drink(name: "Lorem Ipsum", instructions: "Lorem Ipsum Dolor Sit Amet", imageURL: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg")
        return DrinkDetailView(drink: drink)
    }
}
