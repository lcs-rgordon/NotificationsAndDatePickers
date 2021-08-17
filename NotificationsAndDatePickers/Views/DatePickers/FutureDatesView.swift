//
//  FutureDatesView.swift
//  FutureDatesView
//
//  Created by Russell Gordon on 2021-08-16.
//

import SwiftUI

struct FutureDatesView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var futureDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Section(title: "Future Dates")
            
            Text("By using an argument of `Date()...` for the `in:` parameter, this date picker allows selections of dates including today and any date in the future, but no dates in the past.")
                .multilineTextAlignment(.leading)
            
            
            DatePicker(selection: $futureDate, in: Date()..., displayedComponents: .date) {
                Text("Select a date")
                    .bold()
            }
            
            Text("Date is \(futureDate, formatter: dateFormatter)")
        }
        .padding()
    }
}

struct FutureDatesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FutureDatesView()
        }
    }
}
