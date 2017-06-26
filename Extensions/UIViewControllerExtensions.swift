import UIKit

extension UIViewController {
    
    public func simpleBackButton() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    public func presentViewControllerNow(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        self.present(
            viewControllerToPresent,
            animated: flag,
            completion: completion)
        // http://stackoverflow.com/a/30787046
        CFRunLoopWakeUp(CFRunLoopGetCurrent())
    }
    
//    let alertController = UIAlertController(
//        title: NSLocalizedString("Spot Award In Progress", comment: ""),
//        message: NSLocalizedString("Would you like to continue with the spot award or delete it and start over?", comment: ""),
//        preferredStyle: .Alert)
//    
//    let continueAction = UIAlertAction(title: NSLocalizedString("Continue", comment: ""), style: .Default) { (_) in
//        self.openRecognition(recognition: savedSpotAward)
//    }
//    
//    let startOverAction = UIAlertAction(title: NSLocalizedString("Start over", comment: ""), style: .Default) { (_) in
//        self.openRecognition()
//    }
//    
//    alertController.addAction(continueAction)
//    alertController.addAction(startOverAction)
//    
//    self.actionMenuViewController?.presentViewController(alertController, animated: true) {
//    }

    public func applyConstraintsImmediately() {
        // http://stackoverflow.com/a/13542580
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }

    public func alert(title title: String? = nil, message message: String? = nil, ok okAlertAction: UIAlertAction? = nil) -> UIAlertController {
        
        let useTitle = title ?? Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? ""
        
        let alertController = UIAlertController(
            title: useTitle,
            message: message,
            preferredStyle: .alert)
        
        if let okAlertAction = okAlertAction {
            alertController.addAction(okAlertAction)
        } else {
            let okAlertAction = UIAlertAction(
                title: NSLocalizedString("Ok", comment: ""),
                style: .default,
                handler: nil)
            
            alertController.addAction(okAlertAction)
        }
        
        self.presentViewControllerNow(
            viewControllerToPresent: alertController,
            animated: true,
            completion: nil)
        
        return alertController
    }
    
    public func alertWithError(error: NSError?) {
        self.alert(message: error?.localizedDescription)
    }

    public func confirm(title title: String? = nil, message message: String = "", ifOk okAlertAction: UIAlertAction? = nil, ifCancel cancelAlertAction: UIAlertAction? = nil) -> UIAlertController {
        
        let useTitle = title ?? Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? ""
        
        let alertController = UIAlertController(
            title: useTitle,
            message: message,
            preferredStyle: .alert)
        
        if let okAlertAction = okAlertAction {
            alertController.addAction(okAlertAction)
        } else {
            let okAlertAction = UIAlertAction(
                title: NSLocalizedString("Ok", comment: ""),
                style: .default,
                handler: nil)
            
            alertController.addAction(okAlertAction)
        }

        if let cancelAlertAction = cancelAlertAction {
            alertController.addAction(cancelAlertAction)
        } else {
            let cancelAlertAction = UIAlertAction(
                title: NSLocalizedString("Cancel", comment: ""),
                style: .default,
                handler: nil)
            
            alertController.addAction(cancelAlertAction)
        }

        self.presentViewControllerNow(
            viewControllerToPresent: alertController,
            animated: true,
            completion: nil)
        
        return alertController
    }

}
