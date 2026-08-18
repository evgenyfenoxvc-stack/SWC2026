import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("About Startup World Cup")
                        .font(.system(size: 22, weight: .bold))

                    Text("Startup World Cup is a global startup competition connecting founders, investors, and innovators from around the world, culminating in the Grand Finale in San Francisco.")
                        .font(.system(size: 15))
                        .foregroundColor(.secondary)

                    Divider()

                    infoRow(icon: "globe", text: "startupworldcup.io")
                    infoRow(icon: "envelope", text: "info@startupworldcup.io")
                    infoRow(icon: "mappin.and.ellipse", text: "San Francisco, CA")
                }
                .padding(20)
            }
            .navigationTitle("Info")
        }
    }

    private func infoRow(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(Color(red: 0.29, green: 0.69, blue: 0.87))
                .frame(width: 24)
            Text(text)
                .font(.system(size: 15))
        }
    }
}

#Preview {
    InfoView()
}
