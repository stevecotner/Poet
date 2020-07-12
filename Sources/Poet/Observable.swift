//
//  Observable.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation
import SwiftUI

@available(iOS 13.0, OSX 10.15, *)
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
