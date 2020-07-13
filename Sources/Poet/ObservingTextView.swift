//
//  ObservingTextView.swift
//  
//
//  Created by Stephen E. Cotner on 7/13/20.
//

import SwiftUI

struct ObservingTextView: View {
    
    @Observed var text: String
    var alignment: TextAlignment?
    var kerning: CGFloat
    
    init(_ text: Observed<String>, alignment: TextAlignment? = nil, kerning: CGFloat = 0) {
        self._text = text
        self.alignment = alignment
        self.kerning = kerning
    }
    
    var body: some View {
        Text(text)
            .kerning(kerning)
            .multilineTextAlignment(alignment ?? .leading)
    }
}

// MARK: Preview

struct ObservingTextView_Previews: PreviewProvider {
    @Observable static var helloText: String = "Hello"
    static var previews: some View {
        ObservingTextView($helloText, alignment: .leading)
    }
}
