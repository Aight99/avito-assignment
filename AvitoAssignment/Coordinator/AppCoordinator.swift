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
        let vc = DetailsAssembly.build(screenOutput: self)
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension AppCoordinator: ProductListOutput {

    func askToOpenDetails(productId: Int) {
        // TODO: pass productId
        openDetailsScreen()
    }

}

extension AppCoordinator: DetailsOutput {

    func askToClose() {
        // TODO: i don't know
    }

}
