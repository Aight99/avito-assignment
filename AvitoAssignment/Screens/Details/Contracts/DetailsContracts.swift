//
//  DetailsContracts.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 30.08.2023.
//

import Foundation

protocol DetailsOutput {
    func askToClose()
}

protocol DetailsViewInput: AnyObject {
    func setupProductInfo(product: Product)
    func showError(message: String)
}

protocol DetailsViewOutput {
    func viewDidLoad()
}
