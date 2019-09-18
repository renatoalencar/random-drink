
import SwiftUI
import Alamofire
import AlamofireImage

struct RemoteImage<ImageView: View>: View {
    @State var remoteImage: UIImage?
    let placeholderOne = UIImage(systemName: "photo.fill")
    
    var url: String
    private let block: (UIImage, Bool) -> ImageView
    
    init(url: String, @ViewBuilder block: @escaping (UIImage, Bool) -> ImageView) {
        self.url = url
        self.block = block
    }
    
    func fetchRemoteImage() {
        AF.request(self.url).responseImage { response in
            if let image = response.value {
                self.remoteImage = image
            }
        }
    }
    
    var body: some View {
        self.block(self.remoteImage ?? self.placeholderOne!, self.remoteImage != nil)
            .onAppear(perform: fetchRemoteImage)
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: "https://www.thecocktaildb.com/images/media/drink/2k5gbb1504367689.jpg") { (image, loaded) in
            Image(uiImage: image)
                .resizable()
                .clipShape(Circle())
        }
    }
}
