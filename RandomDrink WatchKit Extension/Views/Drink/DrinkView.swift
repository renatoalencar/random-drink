import SwiftUI

struct DrinkView: View {
    var drink: Drink
    var loader: () -> Void

    var body: some View {
        VStack {
            Text(drink.name)
                .font(.caption)
            RemoteImage(url: drink.imageURL) { (image, loaded) in
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }
            HStack {
                NavigationLink(destination: DrinkDetailView(drink: drink)) {
                    Text("Details")
                }
                Button(action: {
                    self.loader()
                }) {
                    Text("Refresh")
                }
            }
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        let drink = Drink(name: "Lorem Ipsum", instructions: "Lorem Ipsum Dolor Sit Amet", imageURL: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg")
        return DrinkView(drink: drink, loader: {})
    }
}
