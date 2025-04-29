import SwiftUI

struct SettingsView: View {
    @AppStorage("textColor") private var textColor: String = "green"
    @AppStorage("autoPlaySound") private var autoPlaySound: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Clock Settings")) {
                Picker("Text Color", selection: $textColor) {
                    Text("Green").tag("green")
                    Text("Red").tag("red")
                    Text("Blue").tag("blue")
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Audio Settings")) {
                Toggle("Auto-play Sound", isOn: $autoPlaySound)
            }
        }
        .navigationTitle("Settings")
    }
}