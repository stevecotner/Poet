//
//  Observer.swift
//  
//
//  Created by Stephen E. Cotner on 7/12/20.
//

import Combine
import SwiftUI

struct Observer<Content, A>: View where Content: View {
    @Observed var observed: A
    var content: (A) -> Content
    
    init(_ observed: Observed<A>, @ViewBuilder content: @escaping (A) -> Content) {
        _observed = observed
        self.content = content
    }
    
    var body: some View {
        content(observed)
    }
}

struct Observer2<Content, A, B>: View where Content: View {
    @Observed var observedA: A
    @Observed var observedB: B
    var content: (A, B) -> Content
    
    init(_ observedA: Observed<A>, _ observedB: Observed<B>, @ViewBuilder content: @escaping (A, B) -> Content) {
        _observedA = observedA
        _observedB = observedB
        self.content = content
    }
    
    var body: some View {
        content(observedA, observedB)
    }
}

struct Observer3<Content, A, B, C>: View where Content: View {
    @Observed var observedA: A
    @Observed var observedB: B
    @Observed var observedC: C
    var content: (A, B, C) -> Content
    
    init(_ observedA: Observed<A>, _ observedB: Observed<B>, _ observedC: Observed<C>, @ViewBuilder content: @escaping (A, B, C) -> Content) {
        _observedA = observedA
        _observedB = observedB
        _observedC = observedC
        self.content = content
    }
    
    var body: some View {
        content(observedA, observedB, observedC)
    }
}
