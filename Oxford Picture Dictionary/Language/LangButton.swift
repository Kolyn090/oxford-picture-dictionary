//
//  LangButton.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import SwiftUI

struct LangButton: View {
    @ObservedObject var langManager: LangManager
    
    var body: some View {
        Button {
            langManager.isShowView.toggle()
        } label: {
            Circle()
                .frame(width: 64, height: 64)
                .overlay(
                    Image(langManager.currentLang.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                )
                .foregroundColor(Color.secondary)
                .background(.clear)
        }
    }
}
