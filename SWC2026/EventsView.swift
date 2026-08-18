import SwiftUI

struct RegionalEvent: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let isCompleted: Bool
}

struct EventsView: View {

    private let events: [RegionalEvent] = [
        RegionalEvent(name: "SWC Bosnia & Herzegovina", date: "October 7–9, 2026", isCompleted: false),
        RegionalEvent(name: "Bulgaria", date: "October 18, 2025", isCompleted: true),
        RegionalEvent(name: "USA – Long Beach", date: "November 6, 2025", isCompleted: true),
        RegionalEvent(name: "Slovenia", date: "November 7, 2025", isCompleted: true),
        RegionalEvent(name: "Costa Rica", date: "November 9, 2025", isCompleted: true),
        RegionalEvent(name: "Cape Town, South Africa", date: "November 13, 2025", isCompleted: true),
        RegionalEvent(name: "Saudi Arabia", date: "November 13, 2025", isCompleted: true),
        RegionalEvent(name: "Hamburg, Germany", date: "November 22, 2025", isCompleted: true),
        RegionalEvent(name: "Vietnam", date: "December 12, 2025", isCompleted: true),
        RegionalEvent(name: "USA – Las Vegas", date: "January 7, 2026", isCompleted: true),
        RegionalEvent(name: "Dubai, UAE", date: "February 7, 2026", isCompleted: true),
        RegionalEvent(name: "Milan, Italy", date: "March 6, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Agriculture & Food", date: "March 10, 2026", isCompleted: true),
        RegionalEvent(name: "India – Greater Noida", date: "March 12, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Houston", date: "March 25, 2026", isCompleted: true),
        RegionalEvent(name: "Lagos, Nigeria", date: "March 26, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Honolulu", date: "April 8–9, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Harker National Youth Qualifier", date: "April 17, 2026", isCompleted: true),
        RegionalEvent(name: "Moldova", date: "April 22, 2026", isCompleted: true),
        RegionalEvent(name: "Warsaw, Poland", date: "April 22, 2026", isCompleted: true),
        RegionalEvent(name: "Nagoya, Japan", date: "April 23, 2026", isCompleted: true),
        RegionalEvent(name: "Tunisia", date: "April 23, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Riverside County", date: "April 29, 2026", isCompleted: true),
        RegionalEvent(name: "Tech Day Costa Rica", date: "May 6, 2026", isCompleted: true),
        RegionalEvent(name: "USA – Silicon Valley", date: "May 7, 2026", isCompleted: true)
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("2025~2026 REGIONAL EVENTS")) {
                    ForEach(events) { event in
                        eventRow(event)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Events")
        }
    }

    private func eventRow(_ event: RegionalEvent) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(event.name)
                    .font(.system(size: 16, weight: .semibold))
                Text(event.date)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }

            Spacer()

            if event.isCompleted {
                Text("Completed")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(.systemGray5))
                    .clipShape(Capsule())
            } else {
                Text("Upcoming")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(red: 0.29, green: 0.69, blue: 0.87))
                    .clipShape(Capsule())
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    EventsView()
}
