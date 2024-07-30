//
//  FloatObservableObject.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/29/24.
//

import Foundation

class PercentObservableObject: ObservableObject {
    @Published var val: Float
    @Published var percent: Float = 1
    let minimum: Float
    let maximum: Float
    
    init(val: Float, minimum: Float, maximum: Float) {
        self.val = val
        self.minimum = minimum
        self.maximum = maximum
    }
    
    func setPercent(newPercent: Float) -> Void {
        percent = newPercent
        val = (maximum - minimum) * newPercent + minimum
    }
}
