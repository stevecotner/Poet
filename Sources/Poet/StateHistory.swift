//
//  StateHistory.swift
//  
//
//  Created by Stephen E. Cotner on 7/13/20.
//

import Combine
import Foundation

public class StateHistory<S: EvaluatorState> {
    @Observable public var hasUndoHistory: Bool = false
    @Observable public var hasRedoHistory: Bool = false
    @Passable private var state: S?
    private var undoHistory: [S] = []
    private var redoHistory: [S] = []
    private var isProcessingUndoOrRedo: Bool = false
    private var stateSink: AnyCancellable?
    
    public init(_ state: Passable<S>) {
        _state = state
        stateSink = state.subject.sink { [weak self] value in
            if let value = value {
                self?.undoHistory.append(value)
                if self?.isProcessingUndoOrRedo == false {
                    self?.redoHistory.removeAll()
                }
            }
            self?.hasUndoHistory = (self?.undoHistory.count ?? 0) > 1
            self?.hasRedoHistory = (self?.redoHistory.count ?? 0) > 0
        }
    }
    
    public func undo() {
        if let currentState = undoHistory.popLast() {
            if let last = undoHistory.popLast() {
                redoHistory.append(currentState)
                isProcessingUndoOrRedo = true
                state = last
                isProcessingUndoOrRedo = false
            } else {
                undoHistory.append(currentState)
            }
        }
    }
    
    public func redo() {
        if let nextState = redoHistory.popLast() {
            isProcessingUndoOrRedo = true
            state = nextState
            isProcessingUndoOrRedo = false
        }
    }
    
    public func clearUndoHistory() {
        undoHistory.removeAll()
        self.hasUndoHistory = false
    }
}
