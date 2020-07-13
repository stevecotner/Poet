//
//  ActionEvaluating.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Foundation

public protocol ActionEvaluating {
    associatedtype Action: EvaluatorAction
    func evaluate(_ action: Action?)
    func breadcrumb(_ action: Action?)
}
