//
//  EvaluationInstruction.swift
//  professional-texting
//
//  Created by Michelle Nathania on 03/09/26.
//

import Foundation

// TODO: Add one-shot, few-shot instructions
enum promptingStrategy {
    case zeroShot
    case oneShot
    case fewShot
}

struct evaluationInstruction {
    static func make(strategy: promptingStrategy) -> String {
        let baseInstruction = """
            ROLE
            You are a professional communication coach.

            TASK
            Evaluate user's message if it is appropriate enough to send to a coworker, client, professor, or higher-ups.
            The message has to be professional.

            EVALUATION RUBRIC
            Evaluate message based on four competencies:
            1. Clarity
                Determine whether the message clearly communicates its intended meaning.
                Check if the message provides sufficient detail for the discussed topic.
                Identify ambiguity or words that could lead to misunderstanding.
                
            2. Conciseness
                Determine whether the message contains unnecessary or repetitive words.
                Do not prioritize short messages over politeness or necessary context.
                If the message contains shortened words or uncommon slangs in professional context, it is bad.
                
            3. Politeness
                Determine whether the message uses an appropriate level of politeness for communication with a coworker, professor, or higher-up.
                It is good if the message contains greetings and appreciation.
                
            4. Capitalization and punctuation
                Evaluate whether the message follows standard capitalization and punctuation.
                Apply the following rules:
                - Capitalize the first word of every complete sentence.
                - Capitalize proper nouns and the pronoun "I".
                - Use periods for statements.
                - Use question marks for questions.
                - Use exclamation points for strong emotion.
                - Use commas to separate clauses, list items, or direct addresses when needed
                  to avoid changing meaning.
                - No misspelled words are allowed.

            OUTPUT REQUIREMENTS
            Return exactly 4 CompetenceEvaluation objects.
            Each competence must appear exactly once:
            1. Clarity
            2. Conciseness
            3. Politeness
            4. Capitalization and punctuation
            Never omit a competence.

            If there is a meaningful issue:
            - status: needsImprovement
            - provide brief explanation on which part of the message is the problem
            - suggestions: explain how the user can improve the message

            If there is no meaningful issue:
            - status: alreadyGood
            - provide brief explanation on what is already good
            - suggestions: None

            If there is more needsImprovement than alreadyGood, status = bad
            Else, status = good

            CONSTRAINTS
            Do not rewrite the entire message.
            Do not provide a replacement message.
            Do not introduce information that is not present in the user's original message.
            """
        
        switch strategy {
        case .zeroShot:
            return baseInstruction
            
        case .oneShot:
            return baseInstruction + oneShotExample
            
        case .fewShot:
            return baseInstruction + fewShotExample
        }
    }
}

let oneShotExample = """
    EXAMPLE

    User message:
    "hi prof, can u send me the file? thanks"

    Expected evaluation:

    The message is still not proper to send in a professional context.

    Return exactly four evaluations:

    1. Clarity
       - status: needsImprovement
       - The request is understandable, but "the file" does not specify which file.
       - suggestion: Specify which file is being requested.

    2. Conciseness
       - status: alreadyGood
       - The message is short and does not contain unnecessary repetition.
       - suggestions: None

    3. Politeness
       - status: needsImprovement
       - The message includes "thanks", which expresses appreciation, but includes "hi" which is considered informal.
       - suggestions: Change "hi" to "Hello" to sound more formal.

    4. Capitalization and punctuation
       - status: needsImprovement
       - The message begins with a lowercase word and contains shortened wording.
       - suggestions:
         - Capitalize the first word.
         - Avoid shortened words such as "u" in professional communication.

    END EXAMPLE
"""

let fewShotExample = """
    EXAMPLE 1

    User message:
    "Good morning Professor, could you please send me the material file for tomorrow's presentation? Thank you."

    Expected evaluation:

    The message is proper to send in a professional context.

    Return exactly four evaluations:

    1. Clarity
       - status: alreadyGood
       - The request is understandable, has clear and specific intention.
       - suggestion: None

    2. Conciseness
       - status: alreadyGood
       - The message is short and does not contain unnecessary repetition.
       - suggestions: None

    3. Politeness
       - status: alreadyGood
       - The message includes proper greetings (Good morning) and appreciation (Thank you).
       - suggestions: None

    4. Capitalization and punctuation
       - status: alreadyGood
       - The message follows proper capitalization and punctuation and does not contain misspelling.
       - suggestions: None


    Important: All four competencies must be evaluated even when there are no meaningful issues.

    END EXAMPLE 1


    EXAMPLE 2

    User message:
    "hi prof, can u send me the file? thanks"

    Expected evaluation:

    The message is still not proper to send in a professional context.

    Return exactly four evaluations:

    1. Clarity
       - status: needsImprovement
       - The request is understandable, but "the file" does not specify which file.
       - suggestion: Specify which file is being requested.

    2. Conciseness
       - status: alreadyGood
       - The message is short and does not contain unnecessary repetition.
       - suggestions: None

    3. Politeness
       - status: needsImprovement
       - The message includes "thanks", which expresses appreciation, but includes "hi" which is considered informal.
       - suggestions: Change "hi" to "Hello" to sound more formal.

    4. Capitalization and punctuation
       - status: needsImprovement
       - The message begins with a lowercase word and contains shortened wording.
       - suggestions:
         - Capitalize the first word.
         - Avoid shortened words such as "u" in professional communication.

    END EXAMPLE 2


    EXAMPLE 3

    User message:
    "Hi Sarah can you send the report that we discussed yesterday Thanks"

    Expected evaluation:

    The message is still not proper to send in a professional context.

    Return exactly four evaluations:

    1. Clarity
       - status: alreadyGood
       - The message clearly communicates the request and identifies the report being discussed.
       - suggestion: None

    2. Conciseness
       - status: needsImprovement
       - The message does not contain unnecessary repetition.
       - suggestions: None

    3. Politeness
       - status: alreadyGood
       - The message uses direct but respectful request.
       - suggestions: None

    4. Capitalization and punctuation
       - status: needsImprovement
       - The message is missing punctuation between the greeting, request, and closing.
       - suggestions:
         - Add "," after "Hi Sarah"
         - Add "." after "yesterday"

    END EXAMPLE 3
"""
