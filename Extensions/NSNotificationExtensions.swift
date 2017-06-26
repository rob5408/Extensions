//
//  NSNotificationExtensions.swift
//  Extensions
//
//  Created by Robert Johnson on 6/1/15.
//  Copyright (c) 2015 Unled, LLC. All rights reserved.
//

extension NSNotification {

    public func keyboardAnimationDuration() -> TimeInterval {
        if let info = self.userInfo {
            return info[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.0
        } else {
            return 0.0
        }
    }

    public func keyboardFrameEnd() -> CGRect {
        if let info = self.userInfo, let value = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            return value.cgRectValue
        } else {
            return CGRect.zero
        }
    }

}
