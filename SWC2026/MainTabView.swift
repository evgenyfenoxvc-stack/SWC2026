import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            EventsView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }

            GrandFinaleView()
                .tabItem {
                    Label("Grand Finale", systemImage: "trophy.fill")
                }

            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
        }
        .accentColor(Color(red: 0.29, green: 0.69, blue: 0.87))
    }
}

#Preview {
    MainTabView()
}
