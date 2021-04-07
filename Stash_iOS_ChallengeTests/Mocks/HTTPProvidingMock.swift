//
//  HTTPProviderMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

import Foundation
@testable import Stash_iOS_Challenge

class HTTPProvidingMock: HTTPProviding {
    private let error: Error?
    private let data: Data?
    
    init(error: Error?, data: Data?) {
        self.error = error
        self.data = data
    }
    
    func task(endpoint: RestEndpoint, completion: @escaping ((Data?, Error?) -> Void)) {
        completion(data, error)
    }
}
