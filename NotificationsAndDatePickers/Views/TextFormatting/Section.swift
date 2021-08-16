//
//  Section.swift
//  Section
//
//  Created by Russell Gordon on 2021-08-16.
//

import SwiftUI

struct Section: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding(.bottom)
    }
}

struct Section_Previews: PreviewProvider {
    static var previews: some View {
        Section(title: "Notification Details")
    }
}
