//
//  LangView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import SwiftUI

struct LangView: View {
    @ObservedObject var langManager: LangManager
    
    // Change to the language after pressed
    struct ChangeLangButton: View {
        @ObservedObject var langManager: LangManager
        
        var language: Lang
        
        var body: some View {
            Button {
                langManager.changeLanguage(to: language)
            } label: {
                Image(language.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
            }
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .opacity(0.8)
            
            let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Array(Lang.allCases), id: \.rawValue) { language in
                    ChangeLangButton(langManager: langManager, language: language)
                }
            }
        }
        .opacity(langManager.isShowView ? 1 : 0)
    }
}
