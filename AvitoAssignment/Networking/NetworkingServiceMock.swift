//
//  MockNetworkingService.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit
import Foundation

class MockNetworkingService {
    private let urlSession: URLSession
    private let responseDelay: DispatchTimeInterval
    private let isFailing: Bool

    init(urlSession: URLSession = .shared, delaySeconds: Int = 0, isFailing: Bool = false) {
        self.urlSession = urlSession
        self.responseDelay = DispatchTimeInterval.seconds(delaySeconds)
        self.isFailing = isFailing
    }

}

extension MockNetworkingService: NetworkingService {

    func fetchProductList(completion: @escaping (Result<[Product], Error>) -> Void) {

        let stubProducts: [Product] = [
            Product(id: 1, title: "Яблоко", rublePrice: 200, locationName: "Москва", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date()),
            Product(id: 2, title: "Ипхоне 10", rublePrice: 100000, locationName: "Москва", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date()),
            Product(id: 3, title: "Хорошее настроение", rublePrice: 1, locationName: "Владивосток", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date()),
            Product(id: 4, title: "Анапа", rublePrice: 2007, locationName: "Анапа", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date()),
            Product(id: 5, title: "Стажировка в авито", rublePrice: 1000000000, locationName: "Авито-сити", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date()),
        ]

        DispatchQueue.global().asyncAfter(deadline: .now() + responseDelay) { [weak self] in
            if self?.isFailing ?? false {
                completion(.failure(RequestProcessorError.parsingFail))
            } else {
                completion(.success(stubProducts))
            }
        }
    }

    func fetchExtendedProductData(completion: @escaping (Result<Product, Error>) -> Void) {

        let stubProduct = Product(id: 4, title: "Анапа", rublePrice: 2007, locationName: "Анапа", imageUrl: "https://www.avito.st/s/interns-ios/images/1.png", creationDate: Date(), description: "Очень круто и солнечно", sellerEmail: "anapa@anapa.anapa", sellerPhone: "+7 (123) 456-7890", sellerAddress: "ул. Пушкина, д. 1")

        DispatchQueue.main.asyncAfter(deadline: .now() + responseDelay) {
            completion(.success(stubProduct))
        }
    }

}
