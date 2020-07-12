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
class Observable<T>: ObservableObject {

    @Published var observableObjectWrapper: ObservableObjectWrapper<T>
        
    var wrappedValue: T {
        didSet {
            observableObjectWrapper.value = wrappedValue
        }
    }
    
    var projectedValue: Observed<T> {
        Observed(observed: observableObjectWrapper)
    }

    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.observableObjectWrapper = ObservableObjectWrapper<T>(wrappedValue)
    }
}

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
