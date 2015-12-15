//
//  UITableViewCellExtensions.swift
//  Extensions
//
//  Created by Robert Johnson on 7/22/15.
//  Copyright (c) 2015 Unled, LLC. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    // https://pontifex.azurewebsites.net/self-sizing-uitableviewcell-with-uitextview-in-ios-8/
    // Search up the view hierarchy of the table view cell to find the containing table view
    var tableView: UITableView? {
        get {
            var table: UIView? = superview
            while !(table is UITableView) && table != nil {
                table = table?.superview
            }
            
            return table as? UITableView
        }
    }
    
    // http://stackoverflow.com/questions/8561774/hide-separator-line-on-one-uitableviewcell
    func hideSeparator() {
        self.separatorInset = UIEdgeInsetsMake(0.0, self.bounds.size.width, 0.0, 0.0)
    }
    
    // http://stackoverflow.com/a/26351692
    public func fixLabelHeights() {
        self.layoutIfNeeded()
    }
    
}
