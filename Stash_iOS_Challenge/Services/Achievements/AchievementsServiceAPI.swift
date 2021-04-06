//
//  AchievementsServiceAPI.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

final class AchievementsServiceAPI: AchievementsService {
    private let networkRequester: NetworkRequesting
    
    init(networkRequester: NetworkRequesting) {
        self.networkRequester = networkRequester
    }
    
    func achievements(completion: @escaping (ResponseResult<AchievementList>) -> Void) {
        networkRequester.request(for: AchievementsEndpoint(), completion: completion)
    }
}
