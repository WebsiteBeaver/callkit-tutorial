import UIKit
import CallKit

class ViewController: UIViewController, CXProviderDelegate {
    
    override func viewDidLoad() {
        let provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "My App"))
        provider.setDelegate(self, queue: nil)
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "Pete Za")
        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
    }
    
    func providerDidReset(_ provider: CXProvider) {
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
    
}
