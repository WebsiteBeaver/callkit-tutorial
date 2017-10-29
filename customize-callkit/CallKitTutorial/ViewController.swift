import UIKit
import CallKit

class ViewController: UIViewController, CXProviderDelegate {
    
    override func viewDidLoad() {
        let config = CXProviderConfiguration(localizedName: "My App")
        config.iconTemplateImageData = UIImagePNGRepresentation(UIImage(named: "pizza")!)
        config.ringtoneSound = "ringtone.caf"
        config.includesCallsInRecents = false;
        config.supportsVideo = true;
        let provider = CXProvider(configuration: config)
        provider.setDelegate(self, queue: nil)
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "Pete Za")
        update.hasVideo = true
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
