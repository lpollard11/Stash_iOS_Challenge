//
//  ModelProviding.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

protocol ModelProviding {
    func serializeData<ModelType: Decodable>(data: Data) -> ModelType?
}
