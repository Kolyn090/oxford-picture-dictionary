//
//  SpeechAdjustView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import SwiftUI

struct SpeechAdjustView: View {
    @State private var screenWidth: CGFloat = 0
    @State private var screenHeight: CGFloat = 0
    
    
    var body: some View {
        VStack {
            ZStack() {
                FloatSlider(percentObject: SpeechManager.shared.speedRateObject,
                            width: screenWidth, height: screenHeight)
                Text("speed")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.TextColorPrimary)
            }
            ZStack() {
                FloatSlider(percentObject: SpeechManager.shared.volumeObject,
                            width: screenWidth, height: screenHeight)
                Text("volume")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.TextColorPrimary)
            }
        }
        .background(GeometryReader { geometry in
            Color.clear
                .onAppear {
                    screenWidth = geometry.size.width
                    screenHeight = geometry.size.height
                }
                .onChange(of: geometry.size) { newSize, oldState in
                    screenWidth = newSize.width
                    screenHeight = newSize.height
                }
        })
    }
}
