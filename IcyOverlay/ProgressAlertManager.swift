//
//  ProgressAlertManager.swift
//  IcyOverlay
//
//  Created by シン・ジャスティン on 2024/12/15.
//

import Foundation
import SwiftUI

@Observable
class ProgressAlertManager {
    var isShowing: Bool = false
    var title: String = ""
    var message: String = ""
    var percentage: Int = 0

    func show(title: String, message: String, completion: @escaping () -> Void = {}) {
        // Removing withAnimation fixes freeze
        withAnimation {
            self.title = title
            self.message = message
            percentage = 0
            isShowing = true
        } completion: {
            completion()
        }
    }

    func hide() {
        // Removing withAnimation fixes freeze
        withAnimation {
            isShowing = false
            title = ""
            message = ""
            percentage = 0
        }
    }

    @MainActor
    func updateProgress(_ percentage: Int) {
        self.percentage = percentage
    }

    @MainActor
    func updateTitle(_ title: LocalizedStringResource) {
        self.title = String(localized: title)
    }
}
