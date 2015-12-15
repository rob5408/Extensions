//
//  UITextFieldExtensions.swift
//  Extensions
//
//  Created by Robert Johnson on 11/29/15.
//  Copyright (c) 2015 Unled, LLC. All rights reserved.
//

import UIKit
//import ObjectiveC

public typealias NotificationHandler = (NSNotification) -> Void

// http://www.iphonelife.com/blog/31369/swift-programming-101-creating-self-registering-swift-ui-controls
class NotificationProxy: UIView {
    
    weak var objectProtocol: NSObjectProtocol?
    
    func addObserverForName(name: String?, object: AnyObject?, queue: NSOperationQueue?, usingBlock: NotificationHandler) {
        // Register the specified object and notification with NSNotificationCenter
        self.objectProtocol = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: queue, usingBlock: usingBlock)
    }
    
//    init() {
//        super.init()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    deinit {
        // Unregister the object from NSNotificationCenter
        if let objectProtocol = self.objectProtocol {
            NSNotificationCenter.defaultCenter().removeObserver(objectProtocol)
        }
    }
}

extension UITextField {

    public var textFieldDidChange: NotificationHandler? {

        set {
            // TODO: Look for previous proxies and remove them
            
            if let newValue = newValue {
                // Register for TextView text changes
                let notificationProxy = NotificationProxy()
                notificationProxy.addObserverForName(UITextFieldTextDidChangeNotification, object: self, queue: nil, usingBlock: newValue)
                self.addSubview(notificationProxy)
            }
        }

        get {
            // TODO: Implement
            return nil
        }

    }
    
}
