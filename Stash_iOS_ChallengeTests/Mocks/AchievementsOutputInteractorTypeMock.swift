//
//  AchievementsOutputInteractorTypeMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

@testable import Stash_iOS_Challenge

class AchievementsOutputInteractorTypeMock: AchievementsOutputInteractorType {
    var didFetchFailedFire = false
    var didFetchSuccessfulFire = false
    
    func fetchFailed() {
        didFetchFailedFire = true
    }
    
    func fetchSuccessful() {
        didFetchSuccessfulFire = true
    }
}
