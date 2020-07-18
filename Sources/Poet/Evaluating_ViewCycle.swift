//
//  Evaluating_ViewCycle.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Foundation

public protocol Evaluating_ViewCycle: Evaluating where Action: EvaluatorAction_ViewCycle {}
        
public protocol EvaluatorAction_ViewCycle: EvaluatorAction {
    static var onAppear: Self { get }
    static var onDisappear: Self { get }
}
