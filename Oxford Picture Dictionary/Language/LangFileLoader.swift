//
//  LangFileLoader.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import Foundation

class LangFileLoader: ObservableObject {
    @Published var positionFileName: String = "" {
        didSet {
            if ContentView.isUsingDrag != 0 { return }
            positionData = LangFileLoader.getPositionData(fileName: positionFileName)
        }
    }
    @Published var wordsFileName: String = "" {
        didSet {
            if ContentView.isUsingDrag != 0 { return }
            wordsData = LangFileLoader.getWords(fileName: wordsFileName)
            if wordsData.isEmpty {
                title = ""
            } else {
                title = wordsData.removeFirst()
            }
        }
    }
    @Published var positionData: [[String]] = []
    @Published var wordsData: [String] = []
    @Published var title: String = ""

    static func getPositionData(fileName: String) -> [[String]] {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") {
            do {
                let content = try String(contentsOfFile: filePath, encoding: .utf8)
                var parsedCSV: [String] = content.components(separatedBy: "\n")
                parsedCSV.removeFirst()
                
                let filteredCSV:[[String]] = parsedCSV
                    .filter { $0 != "" }
                    .map {
                        [$0.components(separatedBy: ",")[0],
                         $0.components(separatedBy: ",")[1]]
                    }
                return filteredCSV
            } catch {
                print("Error reading file: \(error)")
                return []
            }
        } else {
            print("File not found: \(fileName)")
            return []
        }
    }
    
    static func getWords(fileName: String) -> [String] {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                let content = try String(contentsOfFile: filePath, encoding: .utf8)
                return content.components(separatedBy: "\n")
            } catch {
                print("Error reading file: \(error)")
                return []
            }
        } else {
            print("File not found: \(fileName)")
            return []
        }
    }
    
    static func getFirstLineOfFiles(fileNames: [String]) -> [String] {
        return fileNames.map{ fileName in
            return getWords(fileName: fileName).first ?? ""
        }
    }
}
