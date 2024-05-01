//
//  NetworkService.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

protocol NetworkService {
    func request<T: Decodable>(with endPoint: any EndPoint) async throws -> T
}
