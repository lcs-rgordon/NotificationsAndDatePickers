//
//  DatePickerExampleView.swift
//  DatePickerExampleView
//
//  Created by Russell Gordon on 2021-08-13.
//

import SwiftUI

// SEE: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-date-picker-and-read-values-from-it
struct DatePickerExampleView: View {

        var body: some View {
            ScrollView {
                PastDatesView()
                
                FutureDatesView()
                
                AnyDatesView()
            }
            .navigationTitle("Date Pickers")
        }
}

struct DatePickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DatePickerExampleView()
        }
    }
}
