//
//  Observable.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation
import SwiftUI

@propertyWrapper
public class Observable<T>: ObservableObject {

    @Published private var value: T
        
    public var wrappedValue: T {
        didSet {
            value = wrappedValue
        }
    }
    
    public var projectedValue: Observed<T> {
        Observed(observable: self)
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.value = wrappedValue
    }
    
    public init(_ wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.value = wrappedValue
    }
}

extension Observable: DeepCopying {
    public func deepCopy() -> Self {
        if let value = value as? DeepCopying, let copiedValue = value.deepCopy() as? T {
            return Observable(wrappedValue: copiedValue) as! Self
        }
        return Observable(wrappedValue: value) as! Self
    }
}
