//
//  PassablePlease.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine

public struct Please {}

public typealias PassablePlease = Passable<Please>

extension PassablePlease {
    public func please() {
        subject.send(nil)
    }
}
