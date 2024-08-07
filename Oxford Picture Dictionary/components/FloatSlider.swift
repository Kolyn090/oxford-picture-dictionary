//
//  MySlider.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import SwiftUI

struct FloatSlider: View {
    private static let lineWidth: CGFloat = 5.0
    
    @ObservedObject var percentObject: PercentObservableObject
    
    let width: CGFloat
    let height: CGFloat
    var useWidth: CGFloat {
        get {
            return width * 3
        }
    }
    var useHeight: CGFloat {
        get {
            return height / 2
        }
    }
    var dotLength: CGFloat {
        get {
            return max(height / 2.1 - 2 * FloatSlider.lineWidth, 1)
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.BackgroundColor)
                .stroke(Color.TextColorPrimary, lineWidth: FloatSlider.lineWidth)
                .frame(width: useWidth, height: useHeight)
                .padding(.leading)
            Capsule()
                .fill(Color.TextColorPrimary)
                .frame(width: dotLength, height: dotLength)
                .padding(.leading, CGFloat(percentObject.percent) * useWidth)
        }
        .gesture(DragGesture()
            .onChanged({ input in
                let x = input.location.x
                percentObject.setPercent(newPercent: Float(min(max(x / useWidth, 0.11), 0.96)))
            })
        )
        .frame(width: useWidth, height: useHeight)
        .offset(x: -2 * FloatSlider.lineWidth)
    }
}
