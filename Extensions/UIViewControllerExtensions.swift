//
//  UIViewControllerExtensions.swift
//  Elemental
//
//  Created by Robert Johnson on 11/2/15.
//  Copyright © 2015 Elemental. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentViewControllerNow(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        self.presentViewController(
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

    func alert(title: String?, _ message: String?, _ okAlertAction: UIAlertAction?) -> UIAlertController {
        
        let alertController = UIAlertController(
            title: title ?? "",
            message: message ?? "",
            preferredStyle: .Alert)
        
        if let okAlertAction = okAlertAction {
            alertController.addAction(okAlertAction)
        } else {
            let okAlertAction = UIAlertAction(
                title: NSLocalizedString("Ok", comment: ""),
                style: .Default,
                handler: nil)
            
            alertController.addAction(okAlertAction)
        }
        
        self.presentViewControllerNow(
            alertController,
            animated: true,
            completion: nil)
        
        return alertController
        
//        return UIAlertController.showAlertInViewController(
//            self,
//            withTitle: title ?? "",
//            message: message ?? "",
//            cancelButtonTitle: NSLocalizedString("Ok", comment: ""),
//            destructiveButtonTitle: nil,
//            otherButtonTitles: nil,
//            tapBlock: block
//        )
    }
    
    func alert(title: String?, _ message: String?) -> UIAlertController {
        return self.alert(title, message, nil)
    }
    
//    func confirm(title: String?, _ message: String?, _ yesNo: (yes: String, no: String)?, _ yesBlock: UIAlertControllerCompletionBlock?) -> UIAlertController {
//        return UIAlertController.showAlertInViewController(
//            self,
//            withTitle: title ?? "",
//            message: message ?? "",
//            cancelButtonTitle: yesNo?.no ?? NSLocalizedString("No", comment: ""),
//            destructiveButtonTitle: nil,
//            otherButtonTitles: [yesNo?.yes ?? NSLocalizedString("Yes", comment: "")],
//            tapBlock: { (alertController: UIAlertController, alertAction: UIAlertAction, buttonIndex: Int) -> Void in
//                if (buttonIndex == alertController.firstOtherButtonIndex) {
//                    yesBlock?(alertController, alertAction, buttonIndex)
//                }
//            }
//        )
//    }

}
