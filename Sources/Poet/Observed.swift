//
//  Observed.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation
import SwiftUI

@propertyWrapper
public struct Observed<T>: DynamicProperty {
    
    @ObservedObject public var observable: Observable<T>
    
    public var wrappedValue: T {
        get {
            return observable.wrappedValue
        }
        set {
            observable.wrappedValue = newValue
        }
    }
    
    public var projectedValue: Observed<T> {
        return self
    }
}

extension Observed: DeepCopying {
    public func deepCopy() -> Observed<T> {
        return Observed(observable: _observable.wrappedValue.deepCopy())
    }
}
