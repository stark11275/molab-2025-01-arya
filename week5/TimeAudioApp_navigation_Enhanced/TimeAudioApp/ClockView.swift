import SwiftUI

struct ClockView: View {
    @State private var currentTime = Date()
    @AppStorage("textColor") private var textColor: String = "green"

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Current Time")
                .font(.title)
                .padding()

            Text(currentTime, style: .time)
                .font(.system(size: 48, weight: .bold, design: .monospaced))
                .foregroundColor(Color(textColor))
                .onReceive(timer) { input in
                    currentTime = input
                }
        }
    }
}