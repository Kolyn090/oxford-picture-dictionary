//
//  ContentView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    static var minPage: Int = 2
    static var maxPage: Int = 103
    static let isUsingDrag: Int = 0
    
    @State var counter: Int = minPage
    func setCounter(val: Int) -> Void {
        counter = min(max(2, val), ContentView.maxPage)
    }
    @ObservedObject var fileLoader = FileLoader(fileName: "p\(minPage)")
    
    class FileLoader: ObservableObject {
        @Published var fileName: String = "" {
            didSet {
                if ContentView.isUsingDrag != 0 { return }
                data = getCSVData(fileName: fileName)
                title = getCSVTitle(fileName: fileName)
            }
        }
        @Published var data: [[String]] = []
        @Published var title: String = ""

        init(fileName: String) {
            self.fileName = fileName
        }

        func getCSVData(fileName: String) -> [[String]] {
            if let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") {
                do {
                    let content = try String(contentsOfFile: filePath, encoding: .utf8)
                    var parsedCSV: [String] = content.components(separatedBy: "\n")
                    parsedCSV.removeFirst()
                    
                    var filteredCSV:[[String]] = parsedCSV
                        .filter { $0 != "" }
                        .map {
                            [$0.components(separatedBy: ",")[0],
                             $0.components(separatedBy: ",")[1],
                             $0.components(separatedBy: ",")[2]]
                        }
                    filteredCSV.removeFirst()
                    return filteredCSV
                } catch {
                    print("Error reading file: \(error)")
                    return []
                }
            } else {
                print("File not found")
                return []
            }
        }
        
        func getCSVTitle(fileName: String) -> String {
            if let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") {
                do {
                    let content = try String(contentsOfFile: filePath, encoding: .utf8)
                    return content.components(separatedBy: "\n").first ?? ""
                } catch {
                    print("Error reading file: \(error)")
                    return ""
                }
            } else {
                print("File not found")
                return ""
            }
        }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                if ContentView.isUsingDrag == 0 {
                    BubbleImageView(bubbles: fileLoader.data
                        .map { data in
                        return Bubble(word: data[0],
                                      xPercentage: CGFloat(Double(data[1])!),
                                      yPercentage: CGFloat(Double(data[2])!))
                        }, imageName: fileLoader.fileName, title: fileLoader.title)
                } else {
                    DragBubbleImageView(imageName: fileLoader.fileName)
                }
            }
            if ContentView.isUsingDrag == 0 {
                VStack {
                    Spacer()
                    ZStack() {
                        HStack {
                            Button {
                                setCounter(val: counter-1)
                                fileLoader.fileName = "p\(counter)"
                            } label: {
                                HStack {
                                    Text("◀ ")
                                        .foregroundStyle(Color.ColorPrimary)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .background(Color.ButtonBGColor)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Button {
                                setCounter(val: counter+1)
                                fileLoader.fileName = "p\(counter)"
                            } label: {
                                HStack {
                                    Text(" ▶")
                                        .foregroundStyle(Color.ColorPrimary)
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                .padding()
                                .background(Color.ButtonBGColor)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                
                            }
                        }
                        .padding(.horizontal, 10)
                        
                        SpeechAdjustView()
                            .padding()
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
