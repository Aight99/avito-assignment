//
//  ProductCollectionView.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit

protocol ProductCollectionDelegate: AnyObject {
    func handleTap(productId: Int)
}

final class ProductCollectionView: UICollectionView {

    weak var productCollectionDelegate: ProductCollectionDelegate?

    var productList = [Product]() {
        didSet {
            reloadData()
        }
    }

    init() {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumLineSpacing = Constants.minCellSpacing
        collectionLayout.minimumInteritemSpacing = Constants.minCellSpacing
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        self.backgroundColor = .clear
        self.register(ProductViewCell.self, forCellWithReuseIdentifier: ProductViewCell.reuseID)
        self.delegate = self
        self.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        let space = layout?.minimumInteritemSpacing ?? 0
        let width = collectionView.frame.width / Constants.cellsInRow - space
        let height = Constants.cellHeight
        return CGSize(width: width, height: height)
    }
}

extension ProductCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductViewCell.reuseID,
            for: indexPath
        ) as? ProductViewCell else {
            fatalError("Cannot dequeue valid cell")
        }
        cell.configure(model: productList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        productCollectionDelegate?.handleTap(productId: product.id)
    }
}

private enum Constants {
    static let minCellSpacing: CGFloat = 7
    static let cellsInRow: CGFloat = 2
    static let cellHeight: CGFloat = 160
}
