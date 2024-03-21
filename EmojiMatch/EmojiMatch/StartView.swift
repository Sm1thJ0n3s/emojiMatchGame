//
//  ContentView.swift
//  EmojiMatch
//
//  Created by StudentAM on 3/13/24.
//

import SwiftUI

struct StartView: View {
    
    //Just for some time
    @State var showSeconds = true
    
    var body: some View {
        NavigationView {
            
            
            ZStack {
                Image("startBackground")
                VStack {
                    TimelineView(.periodic(from: Date(), by: 1)) { context in TimeTestView(date: context.date, showSeconds: showSeconds)
                    }
                    
                    Text("EMOJIMATCH")
                        .padding(37)
                        .cornerRadius(20)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .bold(true)
                        .font(.system(size: 43))
                        .padding(.bottom, 100)
                    
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                        Text("Start")
                            })
                            .padding(.horizontal, 40)
                            .padding(.vertical, 27)
                            .cornerRadius(20)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .bold(true)
                            .font(.system(size: 37))
                            .padding(.bottom, 60)
                    Group {
                        Toggle(isOn: $showSeconds) {
                            Text("Seconds")
                        }
                        .frame(width: 125)
                    }
                    .padding()
                    .frame(maxHeight: 25)
                }
            }
        }
    }
}

//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        if #available(iOS 15, *) {
//            StartView()
//                .previewInterfaceOrientation(.landscapeLeft)
//        } else {
//            StartView()
//        }
//    }
//}

#Preview {
    StartView()
        .background(
            Image("startBackground")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
}
