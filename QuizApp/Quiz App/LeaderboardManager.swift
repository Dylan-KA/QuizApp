//
//  LeaderboardManager.swift
//  QuizApp
//
//  Created by Keegen Wallis on 14/5/2024.
//

import Foundation

let fileName = "Leaderboard.json"

extension FileManager {
    static var docDirURL: URL{
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveDocument(contents: String, docName: String, completion: (Error?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        
        do {
            //the contents of the file are overwritten, encoded and saved
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    
    func readDocument(docName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        
        do {
            //tries to set data to be the contents of the persistent file, that is then later decoded in the HighScoreViewModel
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    //tests to see if the persistent file exists, returns true or false
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
