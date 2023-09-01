//
//  DefaultNetworkingService.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import Foundation

enum RequestProcessorError: Error {
    case wrongUrl(URLComponents)
    case unexpectedResponse(URLResponse)
    case failedResponse(URLResponse)
    case parsingFail
    case conversingFail
    case noItemWithIdentifier(String)
}

enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
}

private struct ConfigureUrl {
    static let scheme = "https"
    static let host = "www.avito.st"
    static let basePath = "/s/interns-ios"
    static let timeOut: TimeInterval = 30
}

class DefaultNetworkingService {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    private func makeUrl(path: String) -> URL? {
        let urlString = "\(ConfigureUrl.scheme)://\(ConfigureUrl.host)\(ConfigureUrl.basePath)\(path)"
        let components = URLComponents(string: urlString)
        guard let components, let url = components.url else {
            return nil
        }
        return url
    }

    private func makeRequest(_ tailRequest: String, method: RequestType) -> URLRequest {

        guard let url = makeUrl(path: tailRequest) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = ConfigureUrl.timeOut
        request.cachePolicy = .useProtocolCachePolicy
        return request
    }
}

extension DefaultNetworkingService: NetworkingService {
    func fetchProductList(completion: @escaping (Result<[Product], Error>) -> Void) {
        let request = makeRequest("/main-page.json", method: .get)
        let task = self.urlSession.objectTask(for: request) { (result: Result<ProductListDTO, Error>) in
            switch result {
            case .success(let productListDTO):
                var products: [Product] = []
                for productDTO in productListDTO.products {
                    products.append(productDTO.convert())
                }
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func fetchExtendedProductData(productId: Int, completion: @escaping (Result<Product, Error>) -> Void) {
        let request = makeRequest("/details/\(productId).json", method: .get)
        let task = self.urlSession.objectTask(for: request) { (result: Result<ProductDTO, Error>) in
            switch result {
            case .success(let productDTO):
                completion(.success(productDTO.convert()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
