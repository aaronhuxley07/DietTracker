//
//  LabeledTextField.swift
//  DietTracker
//
//  Created by Aaron Huxley on 08/09/2026.
//

import SwiftUI

struct LabeledTextField: View {

    let title: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            TextField("", text: $text)
        }
    }
}
