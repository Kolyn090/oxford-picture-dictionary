//
//  LangManager.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import Foundation

class LangManager: ObservableObject {
    @Published var currentLang: Lang = .UK
    @Published var isShowView: Bool = false
    
    func changeLanguage(to lang: Lang) -> Void {
        currentLang = lang
        SpeechManager.shared.changeLanguage(to: lang.rawValue)
    }
}
