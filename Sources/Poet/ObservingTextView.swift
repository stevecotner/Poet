//
//  ObservingTextView.swift
//  
//
//  Created by Stephen E. Cotner on 7/13/20.
//

import SwiftUI

public struct ObservingTextView: View {
    
    @Observed public var text: String?
    public var alignment: TextAlignment?
    public var kerning: CGFloat
    
    public init(_ text: Observed<String?>, alignment: TextAlignment? = nil, kerning: CGFloat = 0) {
        self._text = text
        self.alignment = alignment
        self.kerning = kerning
    }
    
    public var body: some View {
        Text(text ?? "")
            .kerning(kerning)
            .multilineTextAlignment(alignment ?? .leading)
    }
}

// MARK: Preview

public struct ObservingTextView_Previews: PreviewProvider {
    @Observable public static var helloText: String? = "Hello"
    public static var previews: some View {
        ObservingTextView($helloText, alignment: .leading)
    }
}
