import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ClockView()
                .tabItem {
                    Label("Clock", systemImage: "clock")
                }

            AudioPlayerView()
                .tabItem {
                    Label("Audio", systemImage: "speaker.wave.2.fill")
                }
        }
    }
}