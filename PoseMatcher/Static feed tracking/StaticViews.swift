//
//  Views.swift
//  PoseMatcher
//
//  Created by Carsten Anand on 23/8/25.
//

import SwiftUI
import AVFoundation
import Vision

// 1.
struct StaticViews: View {
    @State private var poseViewModel = StaticPoseEstimationViewModel()
    @State var image: CGImage
    var body: some View {
        // 2.
        ZStack {
            // 2a.
            Image(uiImage: UIImage(cgImage: image))
                .resizable()
                .scaledToFit()
            // 2b.
            StaticPoseOverlayView(
                bodyParts: poseViewModel.detectedBodyParts,
                connections: poseViewModel.bodyConnections
            )
        }
        .task {
            await poseViewModel.processFrame(image)
        }
    
    }
}

import SwiftUI
import CoreGraphics

struct ParentView: View {
    // You must provide a value for the image.
    // Here, we'll use an optional to handle cases where no image is loaded.
    @State private var loadedCGImage: CGImage? = nil

    var body: some View {
        VStack {
            if let cgImage = loadedCGImage {
                // Pass the loaded CGImage to the StaticViews initializer.
                StaticViews(image: cgImage)
            } else {
                Text("No image selected yet.")
            }

            // A button or a PhotosPicker to load an image and set `loadedCGImage`
            // For example:
            Button("Load Image") {
                // Replace this with your actual image loading logic.
                // For demonstration, we'll use a placeholder image.
                if let uiImage = UIImage(systemName: "photo") {
                    loadedCGImage = uiImage.cgImage
                }
            }
        }
    }
}
