//
//  AchievementsInteractorTests.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

import XCTest
@testable import Stash_iOS_Challenge

class AchievementsInteractorTests: XCTestCase {
    private var sut: AchievementsInteractor!
    private var presenter: AchievementsOutputInteractorTypeMock!
    private var service: AchievementsServiceMock!
    
    override func setUp() {
        super.setUp()
        presenter = AchievementsOutputInteractorTypeMock()
        service = AchievementsServiceMock()
        sut = AchievementsInteractor(service: service)
        sut.presenter = presenter
    }
    
    func test_fetchAchievements_success() {
        service.responseResult = .success(achievementList)
        
        sut.fetchAchievements()
        
        XCTAssertTrue(presenter.didFetchSuccessfulFire)
        XCTAssertNil(sut.error)
        XCTAssertEqual(sut.achievements, [achievement])
    }
    
    func test_fetchAchievements_failure() {
        sut.fetchAchievements()
        
        XCTAssertTrue(presenter.didFetchFailedFire)
        XCTAssertNotNil(sut.error)
        XCTAssertEqual(sut.achievements, [])
    }
}

extension AchievementsInteractorTests {
    private var achievementList: AchievementList {
        return AchievementList(success: true,
                               status: 200,
                               overview: Overview(title: ""),
                               achievements: [achievement])
    }
    
    private var achievement: Achievement {
        return Achievement(id: 4,
                           level: "1",
                           progress: 10,
                           total: 50,
                           imageURL: URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png")!,
                           accessible: true)
    }
}
