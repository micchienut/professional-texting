//
//  CompetenceStatus.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import SwiftUI

struct CompetenceStatusCapsule: View {
    let status: CompetenceStatus
    
    var body: some View {
        Text(status.title)
            .font(.caption)
            .foregroundStyle(.white)
            .padding([.leading, .trailing])
            .padding([.top, .bottom], 10)
            .background(status.color)
            .cornerRadius(100)
            .glassEffect()
    }
}

//#Preview {
//    CompetenceStatusCapsule()
//}
