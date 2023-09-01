//
//  NetworkingService.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import Foundation

protocol NetworkingService {
    func fetchProductList(completion: @escaping (Result<[Product], Error>) -> Void)
    func fetchExtendedProductData(productId: Int, completion: @escaping (Result<Product, Error>) -> Void)
}
