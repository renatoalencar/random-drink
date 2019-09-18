import SwiftUI

struct ActivityIndicator: View {
    var body: some View {
        Image(systemName: "mostRecent.fill")
            .imageScale(.medium)
            .foregroundColor(.white)
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
