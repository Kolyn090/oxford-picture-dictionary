//
//  BubblesView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI

struct BubbleImageView: View {
    @State private var offset = CGSize.zero
    @State private var currentOffset = CGSize.zero
    @State private var scale: CGFloat = 1.0
    @State private var currentScale: CGFloat = 1.0
    @State private var initFrame: CGRect = .infinite
    
    let minZoomRatio: Float = 1
    let maxZoomRatio: Float = 3
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
                if isOpened {
                    SpeechManager.shared.speak(word: word)
                }
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
            .background(GeometryReader { geo in Color.clear
                .onChange(of: word) {
                    // Closes the bubble
                    // !bug: it won't work if the same word appears
                    //       in the same index
                    isOpened = false
                }
            })
        }
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = validatedOffset(CGSize(
                    width: currentOffset.width + value.translation.width,
                    height: currentOffset.height + value.translation.height
                ))
            }
            .onEnded { _ in
                currentOffset = offset
            }
        
        let magnificationGesture = MagnificationGesture()
            .onChanged { value in
                scale = currentScale * value
                scale = min(scale, CGFloat(maxZoomRatio))
                scale = max(scale, CGFloat(minZoomRatio))
            }
            .onEnded { _ in
                currentScale = scale
            }
        
        let combinedGesture = dragGesture.simultaneously(with: magnificationGesture)
        
        VStack {
            Text(title)
                .fontWeight(.bold)
                .font(.title)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .border(.green)
                .overlay(
                    GeometryReader { geo in
                        ZStack {
                            ForEach(Array(bubbles.enumerated()), id: \.offset) { index, bubble in
                                BubbleButton(word: bubble.word, number: index+1)
                                    .position(
                                        x: geo.size.width * scale * bubble.xPercentage - offset.width + geo.size.width * (1 - scale)/2,
                                        y: geo.size.height * scale * bubble.yPercentage - offset.height + geo.size.height * (1 - scale)/2
                                    )
                                    .offset(CGSize(width: offset.width, height: offset.height))
                                    .scaleEffect(1/scale)
                                    
                            }
                        }
                    }
                )
                .background(GeometryReader { geo in Color.clear
                    .onAppear {
                        initFrame = geo.frame(in: .global)
                    }
                    .onChange(of: imageName) {
                        offset = .zero
                        scale = 1.0
                    }
                })
                .scaledToFit()
                .scaleEffect(scale)
                .offset(offset)
                .gesture(combinedGesture)
                .animation(.spring(), value: offset)
        }
    }
    
    private func validatedOffset(_ newOffset: CGSize) -> CGSize {
        let ratio = 2 * (1/scale)
        return CGSize(width: max(-initFrame.width/ratio, min(initFrame.width/ratio, newOffset.width)),
                      height: max(-initFrame.height/ratio, min(initFrame.height/ratio, newOffset.height)))
    }
}
