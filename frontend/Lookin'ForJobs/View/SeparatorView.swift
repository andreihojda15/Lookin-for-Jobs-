//
//  SeparatorView.swift
//  Lookin'ForJobs
//
//  Created by Alexandra Minyov on 15.01.2023.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Divider()
            .frame(height: 1)

            .background(
                            LinearGradient(
                                colors: [ .mint, .clear, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            )
            
            .padding(.horizontal, 30)
            .padding(.bottom, 15)
    }
}

