//
//  ObservableObjectWrapper.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import Foundation

//public class PublishedWrapper<T>: ObservableObject {
//    public let objectDidChange = ObservableObjectPublisher()
//
//    @Published public var value: T {
//        didSet {
//            objectDidChange.send()
//        }
//    }
//
//    public init(_ value: T) {
//        self.value = value
//    }
//}
//
//extension PublishedWrapper: DeepCopying {
//    public func deepCopy() -> Self {
//        if let value = value as? DeepCopying, let copiedValue = value.deepCopy() as? T {
//            return PublishedWrapper(copiedValue) as! Self
//        }
//        return PublishedWrapper(value) as! Self
//    }
//}
//
//extension PublishedWrapper: Equatable where T: Equatable {
//    public static func == (lhs: PublishedWrapper<T>, rhs: PublishedWrapper<T>) -> Bool {
//        return lhs.value == rhs.value
//    }
//}
//
//extension PublishedWrapper where T: ExpressibleByNilLiteral {
//    public convenience init() {
//        self.init(nil)
//    }
//}
