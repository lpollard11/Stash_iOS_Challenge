//
//  ModelProviderMock.swift
//  Stash_iOS_ChallengeTests
//
//  Created by Lee Pollard on 4/7/21.
//

import Foundation
@testable import Stash_iOS_Challenge

class ModelProviderMock: ModelProviding {
    private let model: Any?
    
    init(model: Any?) {
        self.model = model
    }
    
    func serializeData<ModelType>(data: Data) -> ModelType? where ModelType : Decodable {
        return model as? ModelType
    }
}
