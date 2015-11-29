//
//  NSNotificationExtensions.swift
//  Inspirus
//
//  Created by Robert Johnson on 6/1/15.
//  Copyright (c) 2015 Inspirus. All rights reserved.
//

extension NSNotification {

    func keyboardAnimationDuration() -> NSTimeInterval {
        if let info = self.userInfo {
            return info[UIKeyboardAnimationDurationUserInfoKey] as? NSTimeInterval ?? 0.0
        } else {
            return 0.0
        }
    }

    func keyboardFrameEnd() -> CGRect {
        if let info = self.userInfo, value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            return value.CGRectValue()
        } else {
            return CGRectZero
        }
    }

}
