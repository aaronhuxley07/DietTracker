//
//  LabeledNumberField.swift
//  DietTracker
//
//  Created by Aaron Huxley on 08/09/2026.
//

import SwiftUI

struct LabeledNumberField: View {

    let title: String
    @Binding var value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            TextField(
                "",
                value: $value,
                format: .number
            )
            .keyboardType(.decimalPad)
        }
    }
}
