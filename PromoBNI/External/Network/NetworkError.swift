//
//  NetworkError.swift
//  PromoBNI
//
//  Created by Kurniawan Gigih Lutfi Umam on 10/05/23.
//

import Foundation
import Alamofire

public enum NetworkError: LocalizedError {
    case badRequest
    case requestFailed
    case forbidden
    case notFound
    case tooManyRequests
    case serverError
    
    public static func map(_ statusCode: Int) -> NetworkError {
        switch statusCode {
        case 200:
            return .badRequest
        case 402:
            return .requestFailed
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 429:
            return .tooManyRequests
        default:
            return .serverError
        }
    }
    
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "The request was unacceptable, often due to an incorrect query string parameter"
        case .requestFailed:
            return "The parameters were valid but the request failed."
        case .forbidden:
            return "The user doesn't have permissions to perform the request."
        case .notFound:
            return "The requested resource doesn't exist."
        case .tooManyRequests:
            return "The rate limit has been exceeded."
        case .serverError:
            return "Something went wrong on our end."
        }
    }
}
