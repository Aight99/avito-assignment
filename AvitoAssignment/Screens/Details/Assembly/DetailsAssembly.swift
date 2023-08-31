//
//  DetailsAssembly.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit

final class DetailsAssembly {
    static func build(
        screenOutput: DetailsOutput?
    ) -> UIViewController {
        let networkingService = MockNetworkingService(delaySeconds: 1, isFailing: false)
        let view = DetailsViewController()
        let presenter = DetailsPresenter(networkingService: networkingService)
        presenter.output = screenOutput
        presenter.view = view
        view.output = presenter
        return view
    }
}
