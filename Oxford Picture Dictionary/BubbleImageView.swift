//
//  BubblesView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI

struct BubbleImageView: View {
    let bubbles: [Bubble]
    let imageName: String
    let title: String
    
    private struct BubbleButton: View {
        @State var isOpened: Bool = false
        let word: String
        let number: Int
        
        var body: some View {
            Button {
                isOpened.toggle()
            } label: {
                if isOpened {
                    
                    Text(word)
                        .foregroundColor(.black)
                        .padding(2)
                        .border(.black)
                        .background(.white)
                }
                else {
                    ZStack {
                        Circle()
                            .stroke(.black, lineWidth: 2)
                            .fill(.white)
                            .frame(width: 20, height: 20)
                        
                        Text("\(number)")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text(title)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    GeometryReader { geometry in
                        ZStack {
                            ForEach(Array(bubbles.enumerated()), id: \.offset) { index, bubble in
                                BubbleButton(word: bubble.word, number: index+1)
                                    .position(
                                        x: geometry.size.width * bubble.xPercentage,
                                        y: geometry.size.width * bubble.yPercentage
                                    )
                            }
                        }
                    }
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
