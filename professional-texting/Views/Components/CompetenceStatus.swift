//
//  CompetenceStatus.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import SwiftUI

struct CompetenceStatus: View {
    var body: some View {
        Text("Needs improvement")
            .font(.caption)
            .foregroundStyle(.white)
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 10)
            .background(Color.red)
            .cornerRadius(100)
            .glassEffect()
    }
}

#Preview {
    CompetenceStatus()
}
