//
//  TimeTestView.swift
//  EmojiMatch
//
//  Created by StudentAM on 3/14/24.
//

import SwiftUI

struct TimeTestView: View {
    let date: Date
    
    let showSeconds: Bool
    
    var seconds: Int { Calendar.current.component(.second, from: date)
    }
    
    var minutes: Int { Calendar.current.component(.minute, from: date)
    }
    
    var hours: Int {
        Calendar.current.component(.hour, from: date)
    }
    
    var timeString: String {
        if showSeconds {
            if hours >= 12 {
                if hours > 12 {
                    return String(format: "%02d:%02d:%02d PM", hours-12, minutes, seconds)
                } else {
                    if hours == 0 {
                        return String(format: "%02d:%02d:%02d AM", hours+12, minutes, seconds)
                    } else {
                        return String(format: "%02d:%02d:%02d AM", hours, minutes, seconds)
                    }
                }
            } else {
                if hours == 0 {
                    return String(format: "%02d:%02d:%02d AM", hours+12, minutes, seconds)
                } else {
                    return String(format: "%02d:%02d:%02d AM", hours, minutes, seconds)
                }
            }
            
        } else {
            if hours >= 12 {
                if hours > 12 {
                    return String(format: "%02d:%02d PM", hours-12, minutes)
                } else {
                    if hours == 0 {
                        return String(format: "%02d:%02d AM", hours+12, minutes)
                    } else {
                        return String(format: "%02d:%02d AM", hours, minutes)
                    }
                }
            } else {
                if hours == 0 {
                    return String(format: "%02d:%02d AM", hours+12, minutes)
                } else {
                    return String(format: "%02d:%02d AM", hours, minutes)
                }
            }
        }
    }
    
    var body: some View {
        Text(timeString)
            .foregroundColor(.red)
            .background(.yellow)
            .frame(maxWidth: 100, maxHeight: 25)
            .font(.system(size: 15)
                .monospacedDigit()
            )
            .minimumScaleFactor(0.001)
            .padding()
    }
}

#Preview {
    TimeTestView(date: Date(), showSeconds: true)
}
