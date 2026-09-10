//
//  EvaluateTextShortcut.swift
//  professional-texting
//
//  Created by Michelle Nathania on 09/09/26.
//

import Foundation
import AppIntents

struct EvaluateTextShortcut: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut (
            intent: EvaluateTextIntent(),
            phrases: [
                "Evaluate message in \(.applicationName)",
                "Check message in \(.applicationName)"
            ],
            shortTitle: "Evaluate Message",
            systemImageName: "text.badge.checkmark"
        )
    }
}
