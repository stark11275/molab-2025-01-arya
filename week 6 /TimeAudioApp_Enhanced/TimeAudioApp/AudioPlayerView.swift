import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    @State private var isPlaying = false
    @State private var player: AVAudioPlayer?
    @AppStorage("autoPlaySound") private var autoPlaySound = false

    var body: some View {
        VStack {
            Text("Audio Playback")
                .font(.title)
                .padding()

            Button(action: togglePlayback) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
        }
        .onAppear {
            if autoPlaySound { playSound() }
        }
    }

    func togglePlayback() {
        if let player = player {
            if player.isPlaying {
                player.pause()
                isPlaying = false
            } else {
                player.play()
                isPlaying = true
            }
        } else {
            playSound()
        }
    }

    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.play()
                isPlaying = true
            } catch {
                print("Error playing sound: \(error)")
            }
        } else {
            print("Sound file not found")
        }
    }
}