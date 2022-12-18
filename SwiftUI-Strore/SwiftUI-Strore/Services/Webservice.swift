//  Webservice.swift
//  Created by aa on 12/17/22.

import Foundation

enum Endpoint: String {
    case store = "/v3/654bd15e-b121-49ba-a588-960956b15175"
    case details = "/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    case basket = "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
}

protocol WebServiceProtocol {
    func getData<T: Decodable>(_ type: T.Type, for endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

final class WebService: WebServiceProtocol {
    func getData<T: Decodable>(_ type: T.Type, for endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        performRequest(url: createURL(for: endpoint), expectation: T.self, completion: completion)
    }
}

private extension WebService {
    enum APIError: Error { case noDataReturned, invalidURL }

    func performRequest<T: Decodable>(url: URL?, expectation: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(expectation, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func createURL(for endpoint: Endpoint) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "run.mocky.io"
        urlComponents.path = endpoint.rawValue
        return urlComponents.url
    }
}
