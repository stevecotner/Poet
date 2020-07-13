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

    @Published public var observableObjectWrapper: ObservableObjectWrapper<T>
        
    public var wrappedValue: T {
        didSet {
            observableObjectWrapper.value = wrappedValue
        }
    }
    
    public var projectedValue: Observed<T> {
        Observed(observed: observableObjectWrapper)
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.observableObjectWrapper = ObservableObjectWrapper<T>(wrappedValue)
    }
}
