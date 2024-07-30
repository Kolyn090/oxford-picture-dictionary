//
//  MySlider.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import SwiftUI

struct FloatSlider: View {
    @ObservedObject var percentObject: PercentObservableObject
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.black.opacity(0.08))
                    .frame(height: height/2)
                Capsule()
                    .fill(.black)
                    .stroke(.white, lineWidth: 2)
                    .frame(width: CGFloat(percentObject.percent) * geo.size.width, height: height/2)
                Capsule()
                    .fill(.gray)
                    .frame(width: 10, height: 10)
                    .padding(.leading, CGFloat(percentObject.percent) * geo.size.width-9)
            }
            .gesture(DragGesture()
                .onChanged({ input in
                    let x = input.location.x
                    percentObject.setPercent(newPercent: Float(min(max(x / geo.size.width, 0), 1)))
                })
            )
        }
        .frame(width: width/2, height: height/2)
    }
}
