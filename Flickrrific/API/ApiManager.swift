//
//  ApiManager.swift
//  Flickrrific
//
//  Created by Cole Warner on 9/25/24.
//

import Foundation

protocol ApiManagerType {
    func getData<T: Codable>(type: T.Type, url: String) async throws -> T?
}

class ApiManager: ApiManagerType {
    static let shared = ApiManager()
    private init() {}
    
    func getData<T: Codable>(type: T.Type, url: String) async throws -> T? {
        guard let url = URL(string: url) else {
            throw ApiError.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw ApiError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw ApiError.decodingError
        }
    }
}

enum ApiError: Error {
    case urlError
    case responseError
    case decodingError
}

extension ApiError {
    var errorMessage: String? {
        switch self {
        case .urlError:
            return NSLocalizedString(ErrorKeys.url.rawValue, comment: ErrorComments.url.rawValue)
        case .responseError:
            return NSLocalizedString(ErrorKeys.response.rawValue, comment: ErrorComments.response.rawValue)
        case .decodingError:
            return NSLocalizedString(ErrorKeys.decoding.rawValue, comment: ErrorComments.decoding.rawValue)
        }
    }
}
