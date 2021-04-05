//
//  AchievementList.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

struct AchievementList: Decodable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
}
