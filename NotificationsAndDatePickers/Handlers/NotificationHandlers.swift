//
//  NotificationHandlers.swift
//  NotificationHandlers
//
//  Created by Russell Gordon on 2021-08-13.
//

import Foundation
import os
import UserNotifications

// Prompts the user to allow the app to post local notifications on their device
func askNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            Logger().notice("All set!")
        } else if let error = error {
            Logger().notice("\(error.localizedDescription)")
        }
    }
}

/// Publishes a notification with the given text and timeframe.
/// - Parameters:
///   - title: Title strings should be short, usually only a couple of words describing the reason for the notification.
///   - subtitle: Use this property to specify additional context about the purpose of the notification. Subtitles offer additional context in cases where the title alone isn’t clear. Subtitles aren’t displayed in all cases.
///   - body: Use this property to specify the body of the notification alert. If your app isn’t authorized to display alert-based notifications, the system ignores this property. The body text should contain the final text that you want to display, and shouldn’t contain any placeholder characters. To include a percent symbol (%) in the message body, use two percent symbols (%%). The system strips all other printf style escape characters from your string prior to display.
///   - timeUntil: The number of seconds until the notification will be displayed.
func publishNotification(title: String, subtitle: String, body: String, timeUntil: Double) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.subtitle = subtitle
    content.body = body
    content.sound = UNNotificationSound.default
    
    // show this notification x number of seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeUntil, repeats: false)
    
    // choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // add our notification request
    UNUserNotificationCenter.current().add(request)
}
