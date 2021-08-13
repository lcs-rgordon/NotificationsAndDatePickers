//
//  NotificationsExampleView.swift
//  NotificationsAndDatePickers
//
//  Created by Russell Gordon on 2021-08-13.
//

import SwiftUI

struct NotificationsExampleView: View {
    
    @State private var title = ""
    @State private var subtitle = ""
    @State private var messageBody = "Walking time from Foodland to campus is about 32 minutes"
    @State private var secondsUntilPosted = ""

    var body: some View {
        
        ScrollView {
            
            Text("Typically, you would not ask for permission to post notifications using a button; instead, you would invoke the function `askNotificationPermission()` in the `.onAppear` modifier within the first view that your app presents. Notifications must be tested using the full simulator, not an Xcode Preview window. If the user has already granted permission for notifications to be shown, they will not be prompted to give permission a second time.")
                .multilineTextAlignment(.leading)
                .padding()
            
            Button(action: {
                askNotificationPermission()
            }, label: {
                Text("Enable Local Notifications")
            })
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            
            VStack(alignment: .leading) {

                Group {
                         
                    
                    Text("Notification Details")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    Group {
                        Text("Title")
                            .bold()
                        TextField("Title", text: $title, prompt: Text("e.g.: Return to Campus Suggested"))
                            .padding(.bottom)
                    }

                    Group {
                        Text("Subtitle")
                            .bold()
                        TextField("Subtitle", text: $subtitle, prompt: Text("e.g.: 40 minutes of leave time remain"))
                            .padding(.bottom)
                    }

                    Group {
                        Text("Body")
                            .bold()
                        TextEditor(text: $messageBody)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                            .foregroundColor(messageBody == "Walking time from Foodland to campus is about 32 minutes" ? Color.secondary : Color.primary)
                    }

                    Group {
                        Text("Seconds Until Notification Appears")
                            .bold()
                        TextField("Seconds Until Notification Appears", text: $secondsUntilPosted, prompt: Text("15"))
                            .padding(.bottom)
                            .keyboardType(.decimalPad)
                    }

                    Group {
                        Button(action: {
                            publishNotification(title: title,
                                                subtitle: subtitle,
                                                body: messageBody,
                                                timeUntil: Double(secondsUntilPosted) ?? 5.0)
                        }, label: {
                            Text("Publish Notification")
                        })
                            .buttonStyle(.borderedProminent)
                            .padding(.bottom)
                        
                        Text("**NOTE:** Notifications will only appear on the home or lock screen.")
                    }
                    
                }
                .padding(.horizontal)
                

            }
            
            Spacer()


        }
        .navigationTitle("Notifications")
        
    }
}

struct NotificationsExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotificationsExampleView()
        }
    }
}
