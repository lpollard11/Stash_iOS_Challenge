//
//  HTTPProviding.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

import Foundation

protocol HTTPProviding {
    func task(endpoint: RestEndpoint, completion: @escaping ((Data?, Error?) -> Void))
}
