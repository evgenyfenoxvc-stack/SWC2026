import SwiftUI

struct HomeView: View {

    @State private var timeRemaining: TimeInterval = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    // 6 ноября 2026, 9:00 (время устройства)
    private var targetDate: Date {
        var components = DateComponents()
        components.year = 2026
        components.month = 11
        components.day = 6
        components.hour = 9
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components) ?? Date()
    }

    private var days: Int { max(Int(timeRemaining) / 86400, 0) }
    private var hours: Int { max((Int(timeRemaining) % 86400) / 3600, 0) }
    private var minutes: Int { max((Int(timeRemaining) % 3600) / 60, 0) }
    private var seconds: Int { max(Int(timeRemaining) % 60, 0) }

    private let bannerBlue = Color(red: 0.29, green: 0.69, blue: 0.87)

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // MARK: - Верхний синий баннер
                VStack(spacing: 24) {
                    HStack(spacing: 16) {
                        Image(systemName: "laurel.leading")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 90)
                            .foregroundColor(.white)
                            .overlay(
                                Text("SWC")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.white)
                            )

                        VStack(alignment: .leading, spacing: 2) {
                            Text("Startup")
                                .font(.system(size: 30, weight: .bold))
                            Text("Competition")
                                .font(.system(size: 30, weight: .bold))
                        }
                        .foregroundColor(.white)

                        Spacer()
                    }
                    .padding(.top, 24)

                    HStack(spacing: 0) {
                        statColumn(icon: "dollarsign.circle", value: "$1M", label: "Investment Prize")
                        statColumn(icon: "mic", value: "20+", label: "Speakers")
                        statColumn(icon: "person.3", value: "2,500", label: "Participants")
                    }
                    .padding(.bottom, 24)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(bannerBlue)
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                .padding(.horizontal, 12)
                .padding(.top, 8)

                // MARK: - Coming soon / countdown
                VStack(spacing: 16) {
                    Text("COMING SOON")
                        .font(.system(size: 22, weight: .bold))
                        .padding(.top, 28)

                    HStack(spacing: 14) {
                        countdownUnit(value: days, label: "days")
                        Text(":").font(.system(size: 30, weight: .bold)).foregroundColor(.secondary)
                        countdownUnit(value: hours, label: "hours")
                        Text(":").font(.system(size: 30, weight: .bold)).foregroundColor(.secondary)
                        countdownUnit(value: minutes, label: "mins")
                        Text(":").font(.system(size: 30, weight: .bold)).foregroundColor(.secondary)
                        countdownUnit(value: seconds, label: "secs")
                    }
                    .padding(.bottom, 16)
                }

                // MARK: - Спонсоры
                VStack(spacing: 16) {
                    Text("OUR SPONSORS")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 28)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white.opacity(0.85))
                                    .frame(width: 120, height: 60)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 32)
                }
                .frame(maxWidth: .infinity)
                .background(bannerBlue)
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                .padding(.horizontal, 12)
                .padding(.top, 12)
                .padding(.bottom, 20)
            }
        }
        .background(Color(.systemBackground))
        .onAppear { updateTimeRemaining() }
        .onReceive(timer) { _ in updateTimeRemaining() }
    }

    private func updateTimeRemaining() {
        timeRemaining = targetDate.timeIntervalSinceNow
    }

    private func statColumn(icon: String, value: String, label: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Color(red: 0.29, green: 0.69, blue: 0.87))
                .frame(width: 44, height: 44)
                .background(Circle().fill(Color.white))

            Text(value)
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.white)

            Text(label)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }

    private func countdownUnit(value: Int, label: String) -> some View {
        VStack(spacing: 4) {
            Text(String(format: "%02d", value))
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.29, green: 0.69, blue: 0.87))
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
        .frame(width: 56)
    }
}

#Preview {
    HomeView()
}
