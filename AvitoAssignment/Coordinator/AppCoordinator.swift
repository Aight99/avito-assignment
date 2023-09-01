//
//  AppCoordinator.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 29.08.2023.
//

import UIKit

final class AppCoordinator {

    private var navigationController: UINavigationController?

    func buildEntryPoint() -> UIViewController {
        let productListScreen = ProductListAssembly.build(screenOutput: self)
//        let productListScreen = DetailsAssembly.build(screenOutput: self)
        let vc = productListScreen.0
        let navigationController = UINavigationController(rootViewController: vc)
        self.navigationController = navigationController
        return navigationController
    }

    private func openDetailsScreen(productId: Int) {
        let detailsListScreen = DetailsAssembly.build(screenOutput: self)
        let vc = detailsListScreen.0
        let input = detailsListScreen.1
        navigationController?.pushViewController(vc, animated: true)
        input.setProduct(id: productId)
    }

}

extension AppCoordinator: ProductListOutput {

    func askToOpenDetails(productId: Int) {
        openDetailsScreen(productId: productId)
    }

}

extension AppCoordinator: DetailsOutput {
}
