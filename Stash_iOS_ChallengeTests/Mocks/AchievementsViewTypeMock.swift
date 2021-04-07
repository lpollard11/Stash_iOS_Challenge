//
//  AchievementsViewTypeMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

@testable import Stash_iOS_Challenge

class AchievementsViewTypeMock: AchievementsViewType {
    var didReloadTableFire = false
    var didShowErrorFire = false
    
    func reloadTable() {
        didReloadTableFire = true
    }
    
    func showError() {
        didShowErrorFire = true
    }
}
