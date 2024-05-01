//
//  NetworkError.swift
//  MovieDiscover
//
//  Created by Ali Farhadi on 5/1/24.
//

import Foundation

enum NetworkError: String, Error {
    case badRequest = "Bad request"
    case invalidResponse = "Invalid response"
    case decodeFailed = "Decoding failed"
}
