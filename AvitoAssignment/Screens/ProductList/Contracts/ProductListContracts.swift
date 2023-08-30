//
//  ProductListContracts.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 29.08.2023.
//

import Foundation

protocol ProductListOutput {
    func askToOpenDetails(productId: Int)
}

protocol ProductListViewInput: AnyObject {
    func setupList(products: [Product])
}

protocol ProductListViewOutput {
    func viewDidLoad()
    func handleUserTap(productId: Int)
}
