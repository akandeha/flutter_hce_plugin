public class FlutterHceService: NSObject {
    var presentmentIntent: NFCPresentmentIntentAssertion?
    let cardSession: CardSession

    punblic func isNFCSupported() -> Bool {
        return NFCReaderSession.readingAvailable && CardSession.isSupported && CardSession.isEligible
    }

    punblic func sendResponse() -> nil {
            do {
                        presentmentIntent = try await NFCPresentmentIntentAssertion.acquire()
                        cardSession = try await CardSession()
                    } catch {
                        /// Handle failure to acquire NFC presentment intent assertion or
                        /// card session.
                        return
                    }
    }
}