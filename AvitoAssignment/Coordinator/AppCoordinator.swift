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
        let navigationController = UINavigationController(rootViewController: productListScreen)
        self.navigationController = navigationController
        return navigationController
    }

    private func openDetailsScreen() {
        // TODO: push to navC
    }

}

extension AppCoordinator: ProductListOutput {

    func askToOpenDetails(productId: Int) {
        // TODO: pass productId
        openDetailsScreen()
    }

}
