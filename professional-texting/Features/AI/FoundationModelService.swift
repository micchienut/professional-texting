//
//  FoundationModelService.swift
//  professional-texting
//
//  Created by Michelle Nathania on 03/09/26.
//

import Foundation
import FoundationModels

struct FoundationModelService {
    
    func evaluate(message: String) async throws -> String {
        
        let session = LanguageModelSession(instructions: evaluationInstruction)
        
        let prompt = """
            Evaluate the following message: \(message)
            """
        
        let response = try await session.respond(to: prompt)
        
        return response.content
    }
}
