//
//  Hour.swift
//  MV
//
//  Created by Rahul Pahuja on 08/10/23.
//

import Foundation

struct Hour: Codable {
    let hour: String
    let recordCount: Int

    enum CodingKeys: String, CodingKey {
        case hour
        case recordCount = "record_count"
    }
}
