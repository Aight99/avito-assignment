//
//  ViewController.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 25.08.2023.
//

import UIKit

private enum ScreenState {
    case normal
    case loading
    case error(String)
}

final class ProductListViewController: UIViewController {

    private let loadingImage = UIImage(systemName: "rays")
    private let errorImage = UIImage(systemName: "exclamationmark.triangle")
    private var state: ScreenState = .loading {
        didSet {
            adaptStateVisuals()
        }
    }

    var output: ProductListViewOutput?

    private lazy var productCollectionView: ProductCollectionView = {
        let view = ProductCollectionView()
        return view
    }()
    private lazy var iconMessageView: IconMessageView = {
        let view = IconMessageView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        adaptStateVisuals()
        output?.viewDidLoad()
        productCollectionView.productCollectionDelegate = self
        view.backgroundColor = .systemBackground
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(iconMessageView)
        view.addSubview(productCollectionView)
        setupConstraints()
    }

    private func setupConstraints() {
        productCollectionView.translatesAutoresizingMaskIntoConstraints = false
        iconMessageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.collectionViewPadding),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.collectionViewPadding),
            productCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.collectionViewPadding),
            productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.collectionViewPadding),

            iconMessageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconMessageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconMessageView.heightAnchor.constraint(equalToConstant: Constants.iconMessageViewHeight),
            iconMessageView.widthAnchor.constraint(equalToConstant: Constants.iconMessageViewWidth),
        ])
    }

    private func adaptStateVisuals() {
        switch state {
        case .normal:
            productCollectionView.isHidden = false
            iconMessageView.isHidden = true
        case .loading:
            productCollectionView.isHidden = true
            iconMessageView.isHidden = false
            iconMessageView.configure(image: loadingImage)
        case .error(let message):
            productCollectionView.isHidden = true
            iconMessageView.isHidden = false
            iconMessageView.configure(image: errorImage, title: message)
        }
    }

}

extension ProductListViewController: ProductListViewInput {

    func showError(message: String) {
        state = .error(message)
    }

    func setupList(products: [Product]) {
        productCollectionView.productList = products
        state = .normal
    }
}

extension ProductListViewController: ProductCollectionDelegate {
    func handleTap(productId: Int) {
        print(productId)
        output?.handleUserTap(productId: productId)
    }
}

private enum Constants {
    static let collectionViewPadding: CGFloat = 7
    static let iconMessageViewHeight: CGFloat = 150
    static let iconMessageViewWidth: CGFloat = 150
}
