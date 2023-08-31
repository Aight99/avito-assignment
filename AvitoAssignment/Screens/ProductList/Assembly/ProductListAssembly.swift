//
//  ProductListAssembly.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 29.08.2023.
//

import UIKit

final class ProductListAssembly {
    static func build(
        screenOutput: ProductListOutput?
    ) -> UIViewController {
        let view = ProductListViewController()
        let presenter = ProductListPresenter()
        presenter.output = screenOutput
        presenter.view = view
        view.output = presenter
        return view
    }
}
