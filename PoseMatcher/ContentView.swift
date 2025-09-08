//import SwiftUI
//
//
//
//struct ContentView: View {
//    @State private var images = [CGImage]()
//    @State private var selectedImagesFromPicker: [Image] = []
//
//    
//    
//    var body: some View {
//        HStack{
//           LiveViews()
//            StaticViews(image: Image(<#String#>) as! CGImage)
//            PhotoPickerView(selectedImages: $selectedImagesFromPicker)
//
//            //PhotoPickerView(selectedImages: $images, selectedCGImages: <#[CGImage]#>)
//            StaticViews(image:images as! CGImage)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var images: [Image] = []
    
    
    var body: some View {
        HStack {
            
            if images.first != nil {
                
                if let cgImagePlaceholder = UIImage(systemName: "photo")?.cgImage {
                     StaticViews(image: cgImagePlaceholder)
                }
            } else {
                 
                 Text("No static image loaded")
            }

            
            PhotoPickerView(selectedImages: $images)
            
            
        }
    }
}

#Preview {
    ContentView()
}
