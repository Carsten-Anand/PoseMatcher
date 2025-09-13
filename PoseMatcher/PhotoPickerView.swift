import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @State  var selectedItems = [PhotosPickerItem]() //private
    //    @State var cgImage: CGImage
    //    @Binding var selectedImages: [Image]
    @Binding var selectedCGImage: CGImage? //private
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let selectedCGImage {
                    Image(uiImage: UIImage(cgImage: selectedCGImage))
                } else {
                    PhotosPicker("Select image", selection: $selectedItems, matching: .images)
                }
            }
            .onChange(of: selectedItems) {
                Task {
                    selectedCGImage = nil
                    
                    for item in selectedItems {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data),
                           let cgImage = uiImage.cgImage {
                            selectedCGImage = cgImage
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoPickerView(selectedCGImage: .constant(nil))
}
