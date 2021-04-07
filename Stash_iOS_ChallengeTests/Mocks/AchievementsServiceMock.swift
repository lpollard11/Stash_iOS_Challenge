//
//  AchievementsServiceMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

@testable import Stash_iOS_Challenge

class AchievementsServiceMock: AchievementsService {
    var responseResult: ResponseResult<AchievementList> = .failure(ResponseError.invalidData)
    
    func achievements(completion: @escaping (ResponseResult<AchievementList>) -> Void) {
        completion(responseResult)
    }
}
