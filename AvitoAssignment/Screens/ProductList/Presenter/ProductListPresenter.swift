//
//  ProductListPresenter.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 29.08.2023.
//

import UIKit

final class ProductListPresenter {
    weak var view: UIViewController?
    var output: ProductListOutput?

    // TODO: init with networkingService injection
}

extension ProductListPresenter: ProductListViewOutput {
    func viewDidLoad() {
        // TODO: Network call
    }

    func handleUserTap(productId: Int) {
        output?.askToOpenDetails(productId: productId)
    }
}
