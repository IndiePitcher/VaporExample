import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "Hello! Trigger an email by visiting /send_email endpoint!"
    }

    app.get("send_email") { req async throws -> String in

        let emailBody = """
            This is an email sent from a **vapor backend**!
            """

        try await req.indiePitcher.sendEmail(
            data: .init(
                to: "petr@indiepitcher.com",
                subject: "This is an email sent from a vapor backend", body: emailBody,
                bodyFormat: .markdown))

        return "Sent!"
    }
}
