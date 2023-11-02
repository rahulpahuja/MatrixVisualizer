//
//  DataReader.swift
//  MV
//
//  Created by Rahul Pahuja on 08/10/23.
//

import Foundation


public class DataReader{
    
    func readJSONFile(forName name: String, completion: @escaping (_ data: MatrixData)->() ) {
       do {
          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
              if var matrixData = try? JSONDecoder().decode(MatrixData.self, from: jsonData){
                  completion(matrixData)
              }
              else {
                print("Given JSON is not a valid dictionary object.")
             }
          }
       } catch {
          print(error)
       }
    }
}
