//
//  NetworkRequester.swift
//  Stash_iOS_Challenge
//
//  Created by Lee Pollard on 4/5/21.
//

enum ResponseError: Error {
    case invalidData
    case invalidPath
}

final class NetworkRequester: NetworkRequesting {
    private let modelProviding: ModelProviding
    private let httpProviding: HTTPProviding
    
    init(modelProviding: ModelProviding,
         httpProviding: HTTPProviding) {
        self.modelProviding = modelProviding
        self.httpProviding = httpProviding
    }
    
    func request<ModelType: Decodable>(for endpoint: RestEndpoint, completion: @escaping (ResponseResult<ModelType>) -> Void) {
        httpProviding.task(endpoint: endpoint) { [weak self] (data, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let model: ModelType = self?.modelProviding.serializeData(data: data) else {
                completion(.failure(ResponseError.invalidData))
                return
            }
            
            completion(.success(model))
        }
    }
}
