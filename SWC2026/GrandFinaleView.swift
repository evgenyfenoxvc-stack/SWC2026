import SwiftUI

struct GrandFinaleView: View {

    private let siteURL = URL(string: "https://www.startupworldcup.io/grand-finale")!

    @State private var isLoading = true
    @State private var canGoBack = false
    @State private var reloadTrigger = false

    var body: some View {
        ZStack {
            WebView(
                url: siteURL,
                isLoading: $isLoading,
                canGoBack: $canGoBack,
                reloadTrigger: $reloadTrigger
            )
            .ignoresSafeArea(edges: .bottom)

            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.3)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground).opacity(0.9))
                    )
                    .shadow(radius: 4)
            }
        }
    }
}

#Preview {
    GrandFinaleView()
}
