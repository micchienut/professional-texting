//
//  FoundationModelService.swift
//  professional-texting
//
//  Created by Michelle Nathania on 03/09/26.
//

import Foundation
import FoundationModels

struct FoundationModelService {
    private let promptingStrategy: promptingStrategy = .oneShot
    
    func evaluate(message: String) async throws -> EvaluationStructure {
        
        let session = LanguageModelSession(
            instructions: evaluationInstruction.make(strategy: promptingStrategy)
        )
        
        let prompt = """
            Evaluate the following message: \(message)
            """
        
        let response = try await session.respond(
            to: prompt,
            generating: EvaluationStructure.self
        )
        
        return response.content
    }
}
