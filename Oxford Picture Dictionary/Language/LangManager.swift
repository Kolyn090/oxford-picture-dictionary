//
//  LangManager.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import Foundation

class LangManager: ObservableObject {
    private static var minPage: Int = 2
    private static var maxPage: Int = 103
    
    @Published var fileLoader = LangFileLoader(fileName: "p2-en")
    @Published var currentLang: Lang = .UK
    @Published var isShowView: Bool = false
    @Published var imageName: String = "p2"
    
    private var pageCounter: Int = minPage
    private func setCounter(val: Int) -> Void {
        pageCounter = min(max(LangManager.minPage, val), LangManager.maxPage)
        imageName = "p\(pageCounter)"
    }
    func goToPreviousPage() -> Void {
        setCounter(val: pageCounter-1)
    }
    func goToNextPage() -> Void {
        setCounter(val: pageCounter+1)
    }
    
    var isFirstPage: Bool {
        get {
            return pageCounter == LangManager.minPage
        }
    }
    
    var isLastPage: Bool {
        get {
            return pageCounter == LangManager.maxPage
        }
    }
    
    private var getCSVName: String {
        get {
            return "p\(pageCounter)\(csvNameSuffix)"
        }
    }
    
    init(defaultPage: Int, defaultLang: Lang) {
        pageCounter = defaultPage
        currentLang = defaultLang
        imageName = "p\(defaultPage)"
    }
    
    private var csvNameSuffix: String {
        get {
            func dash(val: String) -> String {
                return "-\(val)"
            }
            func getSuffix() -> String {
                switch currentLang {
                case .US, .UK:
                    return "en"
                case .CN:
                    return "zh"
                }
            }
            return dash(val: getSuffix())
        }
    }
    
    func changeLanguage(to lang: Lang) -> Void {
        currentLang = lang
        imageName = "p\(pageCounter)"
        fileLoader.fileName = getCSVName
        SpeechManager.shared.changeLanguage(to: lang.rawValue)
    }
}
