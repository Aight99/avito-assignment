//
//  DetailsPresenter.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import Foundation

final class DetailsPresenter {
    weak var view: DetailsViewInput?
    var output: DetailsOutput?
    let networkingService: NetworkingService

    init(networkingService: NetworkingService = MockNetworkingService()) {
        self.networkingService = networkingService
    }
}

extension DetailsPresenter: DetailsViewOutput {

    func viewDidLoad() {
        networkingService.fetchExtendedProductData() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let extendedProduct):
                    self?.view?.setupProductInfo(product: extendedProduct)
                case .failure(let failure):
                    self?.view?.showError(message: failure.localizedDescription)
                }
            }
        }
    }
}
