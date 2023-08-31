//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 25.08.2023.
//

import UIKit

final class ProductListViewController: UIViewController {

    var output: ProductListViewOutput?

    private lazy var productCollectionView: ProductCollectionView = {
        let view = ProductCollectionView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(productCollectionView)
        setupConstraints()
    }

    private func setupConstraints() {
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.collectionViewPadding),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.collectionViewPadding),
            productCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.collectionViewPadding),
            productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.collectionViewPadding),
        ])
    }

}

extension ProductListViewController: ProductListViewInput {

    func showError(message: String) {
        // TODO: doto
    }

    func setupList(products: [Product]) {
        productCollectionView.productList = products
    }

}

private enum Constants {
    static let collectionViewPadding: CGFloat = 7
}
