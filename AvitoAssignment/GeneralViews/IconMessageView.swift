//
//  IconMessageView.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit

class IconMessageView: UIStackView {

    private(set) var image: UIImage?
    private(set) var title: String?
    let color: UIColor = .label

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        view.tintColor = color
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        label.textColor = color
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        axis = .vertical
        alignment = .center
        setupSubviews()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addArrangedSubview(imageView)
        addArrangedSubview(titleLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.imageProportion),
        ])
    }

    func configure(image: UIImage? = nil, title: String? = nil) {
        imageView.isHidden = true
        titleLabel.isHidden = true
        if let image = image {
            imageView.image = image
            imageView.isHidden = false
        }
        if let title = title {
            titleLabel.text = title
            titleLabel.isHidden = false
        }
    }
}

private enum Constants {
    static let spacing: CGFloat = 7
    static let imageProportion: CGFloat = 0.7
}
