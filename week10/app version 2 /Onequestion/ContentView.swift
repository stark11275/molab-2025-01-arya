
import SwiftUI

struct ContentView: View {
    @State private var question = QuestionBank.randomQuestion()
    @State private var favorites: [String] = []
    @State private var showSavedAlert = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                Text("One Question")
                    .font(.largeTitle)
                    .fontDesign(.serif)
                    .fontWeight(.semibold)

                Text(question)
                    .font(.title2)
                    .fontDesign(.serif)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .transition(.opacity)
                    .id(question)
                    .animation(.easeInOut(duration: 0.5), value: question)

                HStack(spacing: 20) {
                    Button("Shuffle") {
                        withAnimation {
                            question = QuestionBank.randomQuestion()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray.opacity(0.2))

                    Button(action: {
                        if !favorites.contains(question) {
                            favorites.append(question)
                            showSavedAlert = true
                        }
                    }) {
                        Label("Save", systemImage: "heart")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray.opacity(0.2))
                }

                Spacer()
            }
            .padding()
            .alert(isPresented: $showSavedAlert) {
                Alert(title: Text("Saved"), message: Text("Question saved to favorites!"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct QuestionBank {
    static let questions = [
        "What is something you wish more people asked you about?",
        "When was the last time you felt truly seen?",
        "What does love mean to you right now?",
        "What are you grieving that no one knows about?",
        "What makes you feel deeply connected to someone?"
    ]

    static func randomQuestion() -> String {
        questions.randomElement() ?? ""
    }
}
