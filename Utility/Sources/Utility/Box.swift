//
//  Box.swift
//  
//
//  Created by Xiaoheng Pan on 3/23/21.
//

import Foundation

public class Box<T> {
    public typealias Listener = (T) -> Void
    var listener: Listener?
    
    public var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
