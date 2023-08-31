//
//  DetailsViewController.swift
//  AvitoAssignment
//
//  Created by Александр Ильченко on 31.08.2023.
//

import UIKit

private enum ScreenState {
    case normal
    case loading
    case error(String)
}

final class DetailsViewController: UIViewController {

    private let loadingImage = UIImage(systemName: "rays")
    private let errorImage = UIImage(systemName: "exclamationmark.triangle")
    private var state: ScreenState = .loading {
        didSet {
            adaptStateVisuals()
        }
    }

    var output: DetailsViewOutput?

    private lazy var iconMessageView: IconMessageView = {
        let view = IconMessageView()
        return view
    }()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .leading
        view.spacing = Constants.infoStackSpacing
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        adaptStateVisuals()
        output?.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(iconMessageView)
        view.addSubview(imageView)
        view.addSubview(infoStackView)
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(priceLabel)
        infoStackView.addArrangedSubview(dateLabel)
        infoStackView.addArrangedSubview(phoneLabel)
        infoStackView.addArrangedSubview(emailLabel)
        infoStackView.addArrangedSubview(addressLabel)
        infoStackView.addArrangedSubview(descriptionLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        iconMessageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),

            infoStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.infoStackPadding),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.infoStackPadding),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.infoStackPadding),

            iconMessageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconMessageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconMessageView.heightAnchor.constraint(equalToConstant: Constants.iconMessageViewHeight),
            iconMessageView.widthAnchor.constraint(equalToConstant: Constants.iconMessageViewWidth),
        ])
    }

    private func adaptStateVisuals() {
        switch state {
        case .normal:
            infoStackView.isHidden = false
            iconMessageView.isHidden = true
        case .loading:
            infoStackView.isHidden = true
            iconMessageView.isHidden = false
            iconMessageView.configure(image: loadingImage)
        case .error(let message):
            infoStackView.isHidden = true
            iconMessageView.isHidden = false
            iconMessageView.configure(image: errorImage, title: message)
        }
    }
}

extension DetailsViewController: DetailsViewInput {

    func setupProductInfo(product: Product) {
        state = .normal
        // TODO: Kingfisher :D
        self.imageView.image = UIImage(systemName: "trash")
        self.titleLabel.text = product.title
        self.dateLabel.text = product.creationDate.russianFormat
        self.priceLabel.text = "\(product.rublePrice)₽"

        descriptionLabel.isHidden = product.description == nil
        if let description = product.description {
            self.descriptionLabel.text = description
        }
        emailLabel.isHidden = product.sellerEmail == nil
        if let email = product.sellerEmail {
            self.emailLabel.text = email
        }
        phoneLabel.isHidden = product.sellerPhone == nil
        if let phone = product.sellerPhone {
            self.phoneLabel.text = phone
        }
        addressLabel.isHidden = product.sellerAddress == nil
        if let address = product.sellerAddress {
            self.addressLabel.text = address
        }
    }

    func showError(message: String) {
        state = .error(message)
    }
    
}

private enum Constants {
    static let infoStackPadding: CGFloat = 12
    static let infoStackSpacing: CGFloat = 6
    static let imageHeight: CGFloat = 250
    static let iconMessageViewHeight: CGFloat = 150
    static let iconMessageViewWidth: CGFloat = 150
}
