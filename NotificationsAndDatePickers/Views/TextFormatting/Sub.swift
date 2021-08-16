//
//  Sub.swift
//  Sub
//
//  Created by Russell Gordon on 2021-08-16.
//

import SwiftUI

struct Sub: View {
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
    }
}

struct Sub_Previews: PreviewProvider {
    static var previews: some View {
        Sub(title: "Bananas")
    }
}
