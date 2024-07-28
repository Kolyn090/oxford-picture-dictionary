//
//  ContentView.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 7/27/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let file: String = "p4"
    let isUsingDrag: Bool = false
    
    var body: some View {
        ZStack {
            if !isUsingDrag {
                BubbleImageView(bubbles: getCSVData(fileName: file).map { data in
                    return Bubble(word: data[0],
                                  xPercentage: CGFloat(Double(data[1])!),
                                  yPercentage: CGFloat(Double(data[2])!))
                }, imageName: file, title: getCSVTitle(fileName: file))
            } else {
                DragBubbleImageView(imageName: file)
            }
        }
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

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
