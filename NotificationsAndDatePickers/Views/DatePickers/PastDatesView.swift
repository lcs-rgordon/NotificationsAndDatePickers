//
//  PastDatesView.swift
//  PastDatesView
//
//  Created by Russell Gordon on 2021-08-16.
//

import SwiftUI

struct PastDatesView: View {
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()

        @State private var birthDate = Date()

        var body: some View {
            VStack(alignment: .leading) {
                
                Section(title: "Past Dates")
                
                Text("By using an argument of `...Date()` for the `in:` parameter, this date picker allows selections of dates leading up to and including today, but no dates in the future.")
                    .multilineTextAlignment(.leading)

                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                        .bold()
                }

                Text("Date is \(birthDate, formatter: dateFormatter)")
            }
            .padding()
        }
    
}

struct PastDatesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PastDatesView()
        }
    }
}
