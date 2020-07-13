//
//  ActionEvaluating_ViewCycle.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Foundation

public protocol ActionEvaluating_ViewCycle: ActionEvaluating where Action: EvaluatorAction_ViewCycle {}
        
public protocol EvaluatorAction_ViewCycle: EvaluatorAction {
    static func viewDidLoad() -> Self
    static func viewWillAppear() -> Self
    static func viewDidAppear() -> Self
}
