import SwiftUI

struct ContentView: View {
    let rows = 40
    let cols = 25
    let cellSize: CGFloat = 10

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { _ in
                HStack(spacing: 0) {
                    ForEach(0..<cols, id: \.self) { _ in
                        Text(Bool.random() ? "\\" : "/")
                            .font(.system(size: cellSize))
                            .frame(width: cellSize, height: cellSize)
                    }
                }
            }
        }
        .padding()
        .background(Color.black)
        .foregroundColor(.green)
    }
}

