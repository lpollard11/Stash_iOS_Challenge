//
//  NetworkRequesterTests.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

import XCTest
@testable import Stash_iOS_Challenge

class NetworkRequesterTests: XCTestCase {
    func test_request_success() {
        let httpProvider = HTTPProvidingMock(error: nil, data: Data())
        let modelProvider = ModelProvidingMock(model: achievementList)
        let sut = NetworkRequester(modelProviding: modelProvider,
                                   httpProviding: httpProvider)
        
        let expectation = self.expectation(description: "Request")
        var responseResult: ResponseResult<AchievementList>?
        let completion: (ResponseResult<AchievementList>) -> Void = { result in
            responseResult = result
            expectation.fulfill()
        }
        sut.request(for: RestEndpointMock(), completion: completion)
        
        wait(for: [expectation], timeout: 5)
        if case .success(let achievementList) = responseResult {
            XCTAssertEqual(achievementList, self.achievementList)
        }
    }
    
    func test_request_failure_invalidPath() {
        let httpProvider = HTTPProvidingMock(error: ResponseError.invalidPath, data: Data())
        let modelProvider = ModelProvidingMock(model: achievementList)
        let sut = NetworkRequester(modelProviding: modelProvider,
                                   httpProviding: httpProvider)
        
        let expectation = self.expectation(description: "Request")
        var responseResult: ResponseResult<AchievementList>?
        let completion: (ResponseResult<AchievementList>) -> Void = { result in
            responseResult = result
            expectation.fulfill()
        }
        sut.request(for: RestEndpointMock(), completion: completion)
        
        wait(for: [expectation], timeout: 5)
        guard case .failure(ResponseError.invalidPath) = responseResult else {
            XCTFail()
            return
        }
    }
    
    func test_request_failure_invalidData() {
        let httpProvider = HTTPProvidingMock(error: nil, data: Data())
        let modelProvider = ModelProvidingMock(model: nil)
        let sut = NetworkRequester(modelProviding: modelProvider,
                                   httpProviding: httpProvider)
        
        let expectation = self.expectation(description: "Request")
        var responseResult: ResponseResult<AchievementList>? = .failure(ResponseError.invalidData)
        let completion: (ResponseResult<AchievementList>) -> Void = { result in
            responseResult = result
            expectation.fulfill()
        }
        sut.request(for: RestEndpointMock(), completion: completion)
        
        wait(for: [expectation], timeout: 5)
        guard case .failure(ResponseError.invalidData) = responseResult else {
            XCTFail()
            return
        }
    }
}

extension NetworkRequesterTests {
    private var achievementList: AchievementList {
        return AchievementList(success: true, status: 200, overview: Overview(title: ""), achievements: [])
    }
}
