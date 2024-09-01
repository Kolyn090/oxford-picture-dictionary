//
//  LangManager.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import Foundation

class LangManager: ObservableObject {
    static var minPage: Int = 2
    static var maxPage: Int = 103
    
    @Published var fileLoader = LangFileLoader()
    @Published var currentLang: Lang = .UK
    @Published var isShowView: Bool = false
    @Published var imageName: String = "p2"
    
    @Published private(set) var pageCounter: Int = minPage
    private func setCounter(val: Int) -> Void {
        pageCounter = min(max(LangManager.minPage, val), LangManager.maxPage)
        imageName = "p\(pageCounter)"
        fileLoader.wordsFileName = getCSVName
        fileLoader.positionFileName = imageName
    }
    func goToPreviousPage() -> Void {
        setCounter(val: pageCounter-1)
    }
    func goToNextPage() -> Void {
        setCounter(val: pageCounter+1)
    }
    func goToSelectedPage(pageNumber: Int) -> Void {
        setCounter(val: pageNumber)
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
    
    public func getCSVNama(pageNumber: Int) -> String {
        return "p\(pageNumber)\(csvNameSuffix)"
    }
    
    init(defaultPage: Int, defaultLang: Lang) {
        pageCounter = defaultPage
        currentLang = defaultLang
        imageName = "p\(defaultPage)"
        fileLoader.wordsFileName = getCSVName
        fileLoader.positionFileName = imageName
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
                    return "zh-Hans"
                case .TW:
                    return "zh-Hant"
                }
            }
            return dash(val: getSuffix())
        }
    }
    
    func changeLanguage(to lang: Lang) -> Void {
        currentLang = lang
        imageName = "p\(pageCounter)"
        fileLoader.wordsFileName = getCSVName
        fileLoader.positionFileName = imageName
        
        SpeechManager.shared.changeLanguage(to: lang.rawValue)
    }
}
