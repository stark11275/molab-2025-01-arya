import SwiftUI
import PhotosUI
import AVKit

struct ContentView: View {
    @State private var selectedVideo: PhotosPickerItem? = nil
    @State private var player: AVPlayer? = nil
    @State private var thumbnail: UIImage? = nil
    @State private var duration: String = ""

    var body: some View {
        VStack(spacing: 20) {
            if let thumbnail = thumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
            }

            if let player = player {
                VideoPlayer(player: player)
                    .frame(height: 200)
                Text("Duration: \(duration)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } else {
                Text("No video selected")
                    .foregroundColor(.gray)
            }

            PhotosPicker("Pick a Video", selection: $selectedVideo, matching: .videos)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .onChange(of: selectedVideo) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let url = await saveToTempFile(data: data) {
                    loadVideo(from: url)
                }
            }
        }
    }

    func saveToTempFile(data: Data) async -> URL? {
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("temp.mov")
        do {
            try data.write(to: tempURL)
            return tempURL
        } catch {
            print("Error saving video: \(error)")
            return nil
        }
    }

    func loadVideo(from url: URL) {
        player = AVPlayer(url: url)

        // Extract thumbnail
        let asset = AVAsset(url: url)
        let imgGen = AVAssetImageGenerator(asset: asset)
        imgGen.appliesPreferredTrackTransform = true

        do {
            let cgImage = try imgGen.copyCGImage(at: .zero, actualTime: nil)
            thumbnail = UIImage(cgImage: cgImage)
        } catch {
            print("Thumbnail error: \(error)")
        }

        // Extract duration
        let durationInSeconds = CMTimeGetSeconds(asset.duration)
        duration = String(format: "%.1f seconds", durationInSeconds)
    }
}