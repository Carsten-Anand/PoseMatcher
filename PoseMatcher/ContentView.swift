import SwiftUI


struct ContentView: View {
    @State private var image: CGImage? = nil
    
    var body: some View {
        VStack{
            LiveViews()
           // StaticViews(image: <#CGImage#>)
            
            if let image {
                StaticViews(image:image)
            } else {
                PhotoPickerView( selectedCGImage: $image)
            }
        }
    }
}

#Preview {
    ContentView()
}
