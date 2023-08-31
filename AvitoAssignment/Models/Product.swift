//
//  Product.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 30.08.2023.
//

import Foundation

struct Product {
    let id: Int
    let title: String
    let rublePrice: Int
    let locationName: String
    let imageUrl: String
    let creationDate: Date
    let description: String?
    let sellerEmail: String?
    let sellerPhone: String?
    let sellerAddress: String?

    init(
        id: Int,
        title: String,
        rublePrice: Int,
        locationName: String,
        imageUrl: String,
        creationDate: Date,
        description: String? = nil,
        sellerEmail: String? = nil,
        sellerPhone: String? = nil,
        sellerAddress: String? = nil
    ) {
        self.id = id
        self.title = title
        self.rublePrice = rublePrice
        self.locationName = locationName
        self.imageUrl = imageUrl
        self.creationDate = creationDate
        self.description = description
        self.sellerEmail = sellerEmail
        self.sellerPhone = sellerPhone
        self.sellerAddress = sellerAddress
    }
}
