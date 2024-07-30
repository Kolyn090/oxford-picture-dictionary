//
//  SpeechAdjustView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import SwiftUI

struct SpeechAdjustView: View {
    @State private var initFrame: CGRect = .infinite
    @State private var hasAppeared: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    SpeechManager.shared.changeLanguage(to: "en-US")
                } label: {
                    Text("US")
                }
                
                Spacer()
                
                Button {
                    SpeechManager.shared.changeLanguage(to: "en-UK")
                } label: {
                    Text("UK")
                }
                
                Spacer()
            }
            
            if hasAppeared {
                VStack {
                    HStack {
                        Spacer()
                        Text("Speaking speed:")
                            .background(.background)
                        FloatSlider(percentObject: SpeechManager.shared.speedRateObject,
                                    width: initFrame.width, height: initFrame.height)
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Speaking volume:")
                            .background(.background)
                        FloatSlider(percentObject: SpeechManager.shared.volumeObject,
                                    width: initFrame.width, height: initFrame.height)
                        
                        Spacer()
                    }
                }
            }
        }
        .background(GeometryReader { geo in Color.clear
            .onAppear {
                initFrame = geo.frame(in: .global)
                hasAppeared = true
            }
        })
    }
}
