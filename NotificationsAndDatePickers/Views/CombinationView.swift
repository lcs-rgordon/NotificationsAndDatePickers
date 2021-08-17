//
//  CombinationView.swift
//  CombinationView
//
//  Created by Russell Gordon on 2021-08-13.
//

import SwiftUI

struct CombinationView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        return formatter
    }()
    
    @State private var futureDateAndTime = Date()
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Here we allow the user to select some date and time in the future, and do some arithmetic to determine the number of seconds between the current date and time and that was selected. A notification is scheduled based upon that difference.")
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        askNotificationPermission()
                    }, label: {
                        Text("Enable Local Notifications")
                    })
                        .buttonStyle(.borderedProminent)
                        .padding(.bottom)
                    
                    Spacer()
                    
                }
                
                Section(title: "Notification Date/Time")
                
                Text("When would you like the notification to occur?")
                
                DatePicker(selection: $futureDateAndTime, in: Date()...) {
                    Text("Select a date and time")
                        .bold()
                }
                .datePickerStyle(CompactDatePickerStyle())
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        let delta = futureDateAndTime.timeIntervalSince(Date())
                        
                        publishNotification(title: "Example",
                                            subtitle: "Some subtitle",
                                            body: "Body of notification",
                                            timeUntil: delta)
                        
                    }, label: {
                        
                        Text("Publish Notification")
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                    
                    Spacer()
                }
                    
                Text("**NOTE:** Notifications will only appear on the home or lock screen.")
                
                Spacer()
            }
            .padding()
            
        }
        .navigationTitle("Combination")
        
    }
}

struct CombinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CombinationView()
        }
    }
}
