//
//  EvaluatorAction.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Foundation

public protocol EvaluatorAction {
    var breadcrumbDescription: String { get }
}

extension EvaluatorAction {
    public var breadcrumbDescription: String {
        return String(describing: self)
    }
}
