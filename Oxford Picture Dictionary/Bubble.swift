//
//  Bubble.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import Foundation

struct Bubble: Hashable {
    let id = UUID()
    let word: String
    let xPercentage: CGFloat
    let yPercentage: CGFloat
}
