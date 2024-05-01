//
//  URLSessionService.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

struct URLSessionService: NetworkService {
    var urlSession = URLSession.shared
    
    func request<T: Decodable>(with endPoint: Endpoint) async throws -> T {
        guard let urlRequest = endPoint.createURLRequest() else { throw NetworkError.badRequest }
        let (data, response) = try await urlSession.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        if let decodedData: T = decodeData(data) {
            return decodedData
        } else {
            throw NetworkError.decodeFailed
        }
    }
    
    func decodeData<T: Decodable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return try? decoder.decode(T.self, from: data)
    }
}
