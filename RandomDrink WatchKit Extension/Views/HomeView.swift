import SwiftUI

struct ContentView: View {
    @EnvironmentObject var state: AppState
    
    func loadRandomDrink() {
        state.random()
    }

    var body: some View {
        ScrollView {
            if state.drink != nil {
                DrinkView(drink: state.drink!, loader: loadRandomDrink)
            } else {
                ActivityIndicator()
            }
        }
        .onAppear(perform: loadRandomDrink)
        .navigationBarTitle(Text("Random Drink"))
    }
}

struct HomeView: View {
    var body: some View {
        ContentView()
            .environmentObject(AppState())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
