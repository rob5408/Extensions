//
//  UIControlExtensions.swift
//  Inspirus
//
//  Created by Robert Johnson on 7/10/15.
//  Copyright (c) 2015 Inspirus. All rights reserved.
//

import Foundation
import ALActionBlocks

extension UIControl {
    
    // Successive calls to handleControlEvents:withBlock: for the same UIControlEvent will cause multiple invocations. This
    // is usually the case where we use this API in UITableViewCells. This has caused quite a few headaches so I'm adding
    // another method that will first clear out any other calls for that UIControlEvent. I'm not sure why this is not the 
    // default behavior
    func clearAndHandleControlEvents(controlEvents: UIControlEvents, withBlock actionBlock: ALActionBlock!) {
        self.removeActionBlocksForControlEvents(controlEvents)
        self.handleControlEvents(controlEvents, withBlock: actionBlock)
    }
}

