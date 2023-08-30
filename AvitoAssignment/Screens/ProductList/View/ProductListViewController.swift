//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 25.08.2023.
//

import UIKit

final class ProductListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
    }

}

extension ProductListViewController: ProductListViewInput {

    func setupList(products: [Product]) {
        // TODO: doto
    }

}
