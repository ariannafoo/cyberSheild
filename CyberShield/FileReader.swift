//
//  FileReader.swift
//  CyberShield
//
//  Created by Arianna Foo on 2023-09-24.
//

import Foundation


private func readFile() -> String {
    let filename = "some_random_text.txt"
    var str1: String
    var myCounter: Int
    do {
        let contents = try String(contentsOfFile: filename)
        let lines = contents.split(separator:"\n")
        myCounter = lines.count
        str1 = String(myCounter)
        } catch {
            return (error.localizedDescription)
        }
        return str1
    }
