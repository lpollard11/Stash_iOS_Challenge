//
//  AchievementsService.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

protocol AchievementsService {
    func achievements(completion: @escaping (ResponseResult<AchievementList>) -> Void)
}
