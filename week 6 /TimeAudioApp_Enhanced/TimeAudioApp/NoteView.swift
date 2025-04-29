import SwiftUI

struct NoteView: View {
    @AppStorage("savedNote") private var savedNote: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Write a Note:")
                .font(.title2)

            TextEditor(text: $savedNote)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .frame(height: 200)

            Text("Saved Note:")
                .font(.headline)

            Text(savedNote)
                .padding()
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle("Notes")
    }
}