//
//  Passable.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation
import SwiftUI

@propertyWrapper
public class Passable<S> {
    public var subject = PassthroughSubject<S?, Never>()
    
    public var wrappedValue: S? {
        willSet {
            subject.send(newValue)
        }
    }
    
    public var projectedValue: Passable<S> {
        return self
    }

    public init(wrappedValue: S?) {
        self.wrappedValue = wrappedValue
    }
}
