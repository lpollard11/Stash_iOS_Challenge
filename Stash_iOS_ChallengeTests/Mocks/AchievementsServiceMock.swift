//
//  AchievementsServiceMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

@testable import Stash_iOS_Challenge

class AchievementsServiceMock: AchievementsService {
    private let responseResult: ResponseResult<AchievementList>
    
    init(responseResult: ResponseResult<AchievementList>) {
        self.responseResult = responseResult
    }
    
    func achievements(completion: @escaping (ResponseResult<AchievementList>) -> Void) {
        completion(responseResult)
    }
}
