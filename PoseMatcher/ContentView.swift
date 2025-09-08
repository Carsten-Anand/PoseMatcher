import SwiftUI



struct ContentView: View {
    @State private var images = [CGImage]()
    @State private var selectedImagesFromPicker: [Image] = []

    
    
    var body: some View {
        HStack{
           LiveViews()
            StaticViews(image: Image(<#String#>) as! CGImage)
            PhotoPickerView(selectedImages: $selectedImagesFromPicker)

            //PhotoPickerView(selectedImages: $images, selectedCGImages: <#[CGImage]#>)
            StaticViews(image:images as! CGImage)
        }
    }
}

#Preview {
   ContentView()
}
