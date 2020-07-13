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
struct Observed<T>: DynamicProperty {
    
    @ObservedObject var observed: ObservableObjectWrapper<T>

    public var wrappedValue: T {
        get {
            return observed.value
        }
        set {
            observed.value = newValue
        }
    }
}

extension Observed: DeepCopying {
    func deepCopy() -> Observed<T> {
        return Observed(observed: self.observed.deepCopy())
    }
}
