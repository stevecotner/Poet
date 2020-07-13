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
    func _evaluate(_ action: Action)
}

extension ActionEvaluating {
    public func evaluate(_ action: Action?) {
        if let action = action {
            breadcrumb(action)
            _evaluate(action)
        }
    }
    
    public func breadcrumb(_ action: Action) {
        debugPrint("Placeholder for breadcrumbing. Evaluator: \(self). Action: \(action.breadcrumbDescription).")
    }
}
