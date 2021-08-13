//
//  NotificationsAndDatePickersApp.swift
//  NotificationsAndDatePickers
//
//  Created by Russell Gordon on 2021-08-13.
//

import SwiftUI

@main
struct NotificationsAndDatePickersApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationView {
                    NotificationsExampleView()
                }
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Notifications")
                }

                NavigationView {
                    DatePickerExampleView()
                }
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Date Picker")
                }

                NavigationView {
                    CombinationView()
                }
                .tabItem {
                    Image(systemName: "hands.clap")
                    Text("Combination")
                }

                
            }
            
        }
    }
}
