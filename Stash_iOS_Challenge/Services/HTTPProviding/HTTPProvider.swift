//
//  HTTPProvider.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

final class HTTPProvider: HTTPProviding {
    func task(endpoint: RestEndpoint, completion: @escaping ((Data?, Error?) -> Void)) {
        guard let path = Bundle.main.path(forResource: endpoint.path, ofType: "json") else {
            completion(nil, ResponseError.invalidPath)
            return
        }
        
        let url = URL(fileURLWithPath: path)
        var error: Error?
        var data: Data?
        do {
            data = try Data(contentsOf: url)
        } catch (let catchError) {
            error = catchError
        }
        completion(data, error)
    }
}
