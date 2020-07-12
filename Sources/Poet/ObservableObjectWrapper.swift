//
//  ObservableObjectWrapper.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation

class ObservableObjectWrapper<T>: ObservableObject {
    let objectDidChange = ObservableObjectPublisher()
    
    @Published var value: T {
        didSet {
            objectDidChange.send()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}

extension ObservableObjectWrapper: DeepCopying {
    func deepCopy() -> Self {
        if let value = value as? DeepCopying, let copiedValue = value.deepCopy() as? T {
            return ObservableObjectWrapper(copiedValue) as! Self
        }
        return ObservableObjectWrapper(value) as! Self
    }
}

extension ObservableObjectWrapper: Equatable where T: Equatable {
    static func == (lhs: ObservableObjectWrapper<T>, rhs: ObservableObjectWrapper<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension ObservableObjectWrapper where T: ExpressibleByNilLiteral {
    convenience init() {
        self.init(nil)
    }
}
