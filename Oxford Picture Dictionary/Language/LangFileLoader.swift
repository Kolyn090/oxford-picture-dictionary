//
//  LangFileLoader.swift
//  Oxford Picture Dictionary
//
//  Created by Jianxin Lin on 8/7/24.
//

import Foundation

class LangFileLoader: ObservableObject {
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
