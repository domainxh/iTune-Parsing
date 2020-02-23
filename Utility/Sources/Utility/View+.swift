//
//  File.swift
//  
//
//  Created by Xiaoheng Pan on 2/21/20.
//

import UIKit

public extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

public extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
