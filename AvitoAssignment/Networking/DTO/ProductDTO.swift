//
//  ProductDTO.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 01.09.2023.
//

import Foundation

struct ProductListDTO: Codable {
    let products: [ProductDTO]

    private enum CodingKeys: String, CodingKey {
        case products = "advertisements"
    }
}

struct ProductDTO: Codable {
    let id: String
    let title: String
    let rublePrice: String
    let locationName: String
    let imageUrl: String
    let creationDate: String
    let description: String?
    let sellerEmail: String?
    let sellerPhone: String?
    let sellerAddress: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case rublePrice = "price"
        case locationName = "location"
        case imageUrl = "image_url"
        case creationDate = "created_date"
        case description = "description"
        case sellerEmail = "email"
        case sellerPhone = "phone_number"
        case sellerAddress = "address"
    }

    func convert() -> Product {
        return Product(
            id: Int(id) ?? 0,
            title: title,
            rublePrice: Int(rublePrice.split(separator: " ")[0]) ?? 0,
            locationName: locationName,
            imageUrl: imageUrl,
            creationDate: creationDate,
            description: description,
            sellerEmail: sellerEmail,
            sellerPhone: sellerPhone,
            sellerAddress: sellerAddress
        )
    }
}
