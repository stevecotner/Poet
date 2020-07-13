//
//  ActionEvaluating_ViewCycle.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Foundation

public protocol ActionEvaluating_ViewCycle: ActionEvaluating where Action: EvaluatorAction_ViewCycle {}
        
public protocol EvaluatorAction_ViewCycle: EvaluatorAction {
    static var viewDidLoad: Self { get }
    static var viewWillAppear: Self { get }
    static var viewDidAppear: Self { get }
}
