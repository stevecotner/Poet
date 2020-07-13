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
    var history: Passable<[State]> { get set }
    var futureHistory: Passable<[State]> { get set }
    var isProcessingUndoOrRedo: Bool { get set }
    func historySink() -> AnyCancellable
    func undo()
    func redo()
}

extension HistoryEvaluating {
    public func historySink() -> AnyCancellable {
        return passableState.subject.sink { [weak self] value in
            if let value = value {
                self?.history.wrappedValue?.append(value)
                if self?.isProcessingUndoOrRedo == false {
                    self?.futureHistory.wrappedValue?.removeAll()
                }
            }
        }
    }
    
    public func undo() {
        if let currentState = history.wrappedValue?.popLast() {
            if let last = history.wrappedValue?.popLast() {
                futureHistory.wrappedValue?.append(currentState)
                self.isProcessingUndoOrRedo = true
                state = last
                self.isProcessingUndoOrRedo = false
            } else {
                history.wrappedValue?.append(currentState)
            }
        }
    }
    
    public func redo() {
        if let nextState = futureHistory.wrappedValue?.popLast() {
            self.isProcessingUndoOrRedo = true
            state = nextState
            self.isProcessingUndoOrRedo = false
        }
    }
}
