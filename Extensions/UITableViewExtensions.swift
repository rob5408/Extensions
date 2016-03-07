//
//  UITableViewExtensions.swift
//  Extensions
//
//  Created by Robert Johnson on 5/22/15.
//  Copyright (c) 2015 Unled, LLC. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func standardTheme(topOverscrollColor topColor: UIColor? = nil, bottomOverscrollColor bottomColor: UIColor? = nil) {

        // Top overflow
        // http://stackoverflow.com/a/20236562
        if let topColor = topColor {
            var frame = self.bounds ?? CGRectZero
            frame.origin.y = -(frame.size.height ?? 0.0)
            
            let backgroundView = UIView(frame: frame)
            backgroundView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            backgroundView.backgroundColor = topColor
            self.insertSubview(backgroundView, atIndex: 0)
        }
        
        // Bottom overflow
        if let bottomColor = bottomColor {
            self.backgroundColor = bottomColor
        }

        // Remove filler cells
        // http://stackoverflow.com/a/5377569
        self.tableFooterView = UIView(frame: CGRectZero)
    }

    func prepareForDynamicHeightsInAutoLayout(estimatedRowHeight: CGFloat = 44.0) {
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = estimatedRowHeight
    }
    
}
