//
//  ContentView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    static let isUsingDrag: Int = 0
    
    @ObservedObject var langManager = LangManager(defaultPage: 2, defaultLang: .UK)
    
    var body: some View {
        ZStack {
            ZStack {
                if ContentView.isUsingDrag == 0 {
                    BubbleImageView(bubbles: langManager.fileLoader.data
                        .map { data in
                        return Bubble(word: data[0],
                                      xPercentage: CGFloat(Double(data[1])!),
                                      yPercentage: CGFloat(Double(data[2])!))
                        }, imageName: langManager.imageName, title: langManager.fileLoader.title)
                } else {
                    DragBubbleImageView(imageName: langManager.fileLoader.fileName)
                }
            }
            
            if ContentView.isUsingDrag == 0 {
                VStack {
                    Spacer()
                    ZStack() {
                        HStack {
                            Button {
                                langManager.goToPreviousPage()
                            } label: {
                                HStack {
                                    Text("◀ ")
                                        .foregroundStyle(Color.ColorPrimary)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .background(langManager.isFirstPage ?
                                            Color.Disable :
                                            Color.ButtonBGColor)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                            }
                            .disabled(langManager.isFirstPage)
                            
                            Spacer()
                            
                            Button {
                                langManager.goToNextPage()
                            } label: {
                                HStack {
                                    Text(" ▶")
                                        .foregroundStyle(Color.ColorPrimary)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .background(langManager.isLastPage ?
                                            Color.Disable :
                                            Color.ButtonBGColor)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                
                            }
                            .disabled(langManager.isLastPage)
                        }
                        .padding(.horizontal, 10)
                        
                        SpeechAdjustView()
                            .padding()
                    }
                }
            }
            
            LangView(langManager: langManager)
            
            HStack {
                Spacer()
                VStack {
                    LangButton(langManager: langManager)
                        .padding()
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
