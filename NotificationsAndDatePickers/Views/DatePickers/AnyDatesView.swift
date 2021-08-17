//
//  AnyDatesView.swift
//  AnyDatesView
//
//  Created by Russell Gordon on 2021-08-16.
//

import SwiftUI

struct AnyDatesView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var someDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Section(title: "Any Dates")
            
            Text("By omitting the `in:` parameter, this date picker allows selection of any date, past, present, or future.")
                .multilineTextAlignment(.leading)
            
            DatePicker(selection: $someDate, displayedComponents: .date) {
                Text("Select a date")
                    .bold()
            }
            
            Text("Date is \(someDate, formatter: dateFormatter)")
        }
        .padding()
    }
}

struct AnyDatesView_Previews: PreviewProvider {
    static var previews: some View {
        AnyDatesView()
    }
}
