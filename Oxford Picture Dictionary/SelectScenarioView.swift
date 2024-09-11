//
//  SelectScenarioView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/31/24.
//

import SwiftUI

struct SelectScenarioView: View {
    @ObservedObject var langManager = LangManager(defaultPage: LangManager.minPage, defaultLang: .UK)
    @Binding var isShow: Bool
    @Binding var isShowCredits: Bool
    
    let scenarioPages = Array(LangManager.minPage...LangManager.maxPage)
    let scenarioNames: [String]
    let imageNames: [String]
    
    init(langManager: LangManager, isShow: Binding<Bool>, isShowCredits: Binding<Bool>) {
        self.langManager = langManager
        self._isShow = isShow
        self._isShowCredits = isShowCredits
        scenarioNames = LangFileLoader.getFirstLineOfFiles(fileNames: scenarioPages.map { pageNumber in
            return langManager.getCSVNama(pageNumber: pageNumber)
        })
        imageNames = scenarioPages.map { pageNumber in
            return "p\(pageNumber)"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("       ")
                
                Spacer()
                
                Text("Table of Contents")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Spacer()
                
                Button {
                    isShowCredits = true
                } label: {
                    Text("Credits")
                        .fontWeight(.regular)
                        .padding(.top)
                }
            }
            .padding()
            
            List(Array(scenarioPages.enumerated()), id: \.offset) { index, pageNumber in
                HStack {
                    Button {
                        langManager.goToSelectedPage(pageNumber: pageNumber)
                        isShow = false
                    } label: {
                        HStack {
                            Text("\(pageNumber-1): ")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading)
                            Text("\(scenarioNames[pageNumber-2])")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer()
                    
                    Image(imageNames[pageNumber-2])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128, alignment: .center)
                        .clipped()
                        .padding(.trailing)
                }
            }
            .opacity(isShow ? 1 : 0)
        }
    }
}
