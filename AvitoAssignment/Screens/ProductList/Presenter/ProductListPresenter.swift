//
//  ProductListPresenter.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 29.08.2023.
//

import UIKit

final class ProductListPresenter {
    weak var view: ProductListViewInput?
    var output: ProductListOutput?
    let networkingService: NetworkingService

    init(networkingService: NetworkingService = MockNetworkingService()) {
        self.networkingService = networkingService
    }
}

extension ProductListPresenter: ProductListViewOutput {

    func viewDidLoad() {
        networkingService.fetchProductList() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let productList):
                    self?.view?.setupList(products: productList)
                case .failure(let error):
                    self?.view?.showError(message: error.localizedDescription)
                }
            }
        }
    }

    func handleUserTap(productId: Int) {
        output?.askToOpenDetails(productId: productId)
    }
}
