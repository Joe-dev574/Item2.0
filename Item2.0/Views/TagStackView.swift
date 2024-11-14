//
//  TagStackView.swift
//  Item2.0
//
//  Created by Joseph DeWeese on 11/12/24.
//

import SwiftUI

struct TagsStackView: View {
    var tags: [Tag]
    var body: some View {
        HStack {
            ForEach(tags.sorted(using: KeyPathComparator(\Tag.name))) { tag in
                Text(tag.name)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).fill(tag.hexColor))
            }
        }
    }
}
