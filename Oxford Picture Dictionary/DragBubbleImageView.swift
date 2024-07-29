//
//  BubblesView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI

struct DragBubbleImageView: View {
    let imageName: String
    
    private struct BubbleButton: View {
        @State private var position: CGPoint = .zero
        
        let viewWidth: CGFloat
        let viewHeight: CGFloat
        
        var body: some View {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.red)
                .position(position)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            position = gesture.location
                        }
                        .onEnded { gesture in
                            print("\(gesture.location.x / viewWidth),\(gesture.location.y / viewHeight)")
                        }
                )
        }
    }
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    GeometryReader { geometry in
                        ZStack {
                            BubbleButton(viewWidth: geometry.size.width, viewHeight: geometry.size.height)
                                .position(
                                    x: geometry.size.width * 0.5,
                                    y: geometry.size.height * 0.5
                                )
                        }
                    }
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
