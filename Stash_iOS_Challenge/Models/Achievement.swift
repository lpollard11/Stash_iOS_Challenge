//
//  Achievement.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

struct Achievement: Decodable, Equatable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let imageURL: URL
    let accessible: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case imageURL = "bg_image_url"
        case accessible
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let level = try container.decode(String.self, forKey: .level)
        let progress = try container.decode(Int.self, forKey: .progress)
        let total = try container.decode(Int.self, forKey: .total)
        let imageURL = try container.decode(URL.self, forKey: .imageURL)
        let accessible = try container.decode(Bool.self, forKey: .accessible)
        
        self.id = id
        self.level = level
        self.progress = progress
        self.total = total
        self.imageURL = imageURL
        self.accessible = accessible
    }
}
