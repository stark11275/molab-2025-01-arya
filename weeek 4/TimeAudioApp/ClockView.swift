import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Current Time")
                .font(.title)
                .padding()

            Text(currentTime, style: .time)
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .onReceive(timer) { input in
                    currentTime = input
                }
        }
    }
}