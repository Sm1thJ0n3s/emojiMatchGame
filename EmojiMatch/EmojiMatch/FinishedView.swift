//
//  FinishedView.swift
//  EmojiMatch
//
//  Created by StudentAM on 3/14/24.
//

import SwiftUI

struct FinishedView: View {
    @State var showSeconds = true
    
    var body: some View {
        NavigationView{
            
            ZStack {
                Image("finishedBackground")
                VStack {
                    HStack {
                        TimelineView(.periodic(from: Date(), by: 1)) { context in TimeTestView(date: context.date, showSeconds: showSeconds)
                        }
                        Text("")
                            .frame(width:120, height:0)
                    }
                    
                    Text("Game Over")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .bold(true)
                        .font(.system(size:50))
                        .cornerRadius(15)
                    
                    Text("")
                        .frame(width:0, height:562)
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                        Text("Restart Game")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .bold(true)
                            .font(.system(size:23))
                            .cornerRadius(20)
                    })
                }
            }
        }
    }
}

#Preview {
    FinishedView()
}
