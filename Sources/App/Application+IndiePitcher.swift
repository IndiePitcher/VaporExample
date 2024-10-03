import Vapor
import IndiePitcherSwift

extension Request {
    var indiePitcher: IndiePitcher {
        guard let apiKey = Environment.get("INDIEPITCHER_SECRET_KEY") else {
            fatalError("INDIEPITCHER_SECRET_KEY env key missing")
        }

        return .init(client: application.http.client.shared, apiKey: apiKey)
    }
}

extension Application {
    var indiePitcher: IndiePitcher {
        guard let apiKey = Environment.get("INDIEPITCHER_SECRET_KEY") else {
            fatalError("INDIEPITCHER_SECRET_KEY env key missing")
        }

        return .init(client: http.client.shared, apiKey: apiKey)
    }
}