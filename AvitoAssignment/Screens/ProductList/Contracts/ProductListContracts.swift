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

protocol ProductListInput {
}

protocol ProductListViewInput: AnyObject {
    func setupList(products: [Product])
    func showError(message: String)
}

protocol ProductListViewOutput {
    func viewDidLoad()
    func handleUserTap(productId: Int)
}
