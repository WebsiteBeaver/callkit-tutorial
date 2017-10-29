import UIKit
import CallKit

class ViewController: UIViewController, CXProviderDelegate {
    
    override func viewDidLoad() {
        let provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "My App"))
        provider.setDelegate(self, queue: nil)
        let controller = CXCallController()
        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(), handle: CXHandle(type: .generic, value: "Pete Za")))
        controller.request(transaction, completion: { error in })
    }
    
    func providerDidReset(_ provider: CXProvider) {
    }
    
}
