//
//  HistoryEvaluating.swift
//  
//
//  Created by Stephen E. Cotner on 7/13/20.
//

import Combine
import SwiftUI

public protocol HistoryEvaluating: class {
    associatedtype State: EvaluatorState
    var state: State? { get set }
    var passableState: Passable<State> { get }
    var history: [State] { get set } // Make this property @Observable on your evaluator
    var futureHistory: [State] { get set } // Make this property @Observable on your evaluator
    var isProcessingUndoOrRedo: Bool { get set }
    func historySink() -> AnyCancellable
    func undo()
    func redo()
}

extension HistoryEvaluating {
    public func historySink() -> AnyCancellable {
        return passableState.subject.sink { [weak self] value in
            if let value = value {
                self?.history.append(value)
                if self?.isProcessingUndoOrRedo == false {
                    self?.futureHistory.removeAll()
                }
            }
        }
    }
    
    public func undo() {
        if let currentState = history.popLast() {
            if let last = history.popLast() {
                futureHistory.append(currentState)
                self.isProcessingUndoOrRedo = true
                state = last
                self.isProcessingUndoOrRedo = false
            } else {
                history.append(currentState)
            }
        }
    }
    
    public func redo() {
        if let nextState = futureHistory.popLast() {
            self.isProcessingUndoOrRedo = true
            state = nextState
            self.isProcessingUndoOrRedo = false
        }
    }
}
