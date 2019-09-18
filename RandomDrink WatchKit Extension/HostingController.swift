
import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<HomeView> {
    override var body: HomeView {
        return HomeView()
    }
}
