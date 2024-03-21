//
//  UndercoverView.swift
//  EmojiMatch
//
//  Created by StudentAM on 3/18/24.
//

import SwiftUI



struct UndercoverView: View {
    var emoji: String
    var flipped: Bool
    
    var body: some View {
        
            Rectangle()
                .fill(flipped ? Color.white.opacity(0.01) : .blue)
                .frame(width: 90, height: 90)
                .cornerRadius(20)
            
            if flipped {
                Text(emoji)
                    .font(.system(size: 30))
            }
        }
}

#Preview {
    UndercoverView(emoji: "😀", flipped: false)
}
