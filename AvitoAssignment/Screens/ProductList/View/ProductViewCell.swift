//
//  ProductViewCell.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit

final class ProductViewCell: UICollectionViewCell {

    static let reuseID = "ProductViewCell"
    private(set) var productId: Int = 0

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    private lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .leading
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = Constants.cornerRadius
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(model: Product) {
        self.productId = model.id
        // TODO: Kingfisher :D
        self.imageView.image = UIImage(systemName: "trash")
        self.titleLabel.text = model.title
        self.dateLabel.text = model.creationDate.russianFormat
        self.priceLabel.text = "\(model.rublePrice)₽"
    }

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(infoStackView)
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(priceLabel)
        infoStackView.addArrangedSubview(dateLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            infoStackView.topAnchor.constraint(equalTo: centerYAnchor, constant: Constants.infoPadding),
            infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.infoPadding),
            infoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.infoPadding),
            infoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.infoPadding),
        ])
    }
}

private enum Constants {
    static let cornerRadius: CGFloat = 7
    static let infoPadding: CGFloat = 7
}
