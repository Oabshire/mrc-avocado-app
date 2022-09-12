//
//  MenuCell.swift
//  Test
//
//  Created by Onie on 10.09.2022.
//

import UIKit

/// Cell for Menu table
class MenuItemCell: UITableViewCell {

	public static let reuseID = "MenuItem"

	public var dataModel: MenuCellModel? {
		didSet {
			nameLabel.text =  dataModel?.labelText
			cellImageView.image = dataModel?.cellImageView
			caloriesLabel.text = String(dataModel?.calories ?? 0) + " ccal"
			descriptionLabel.text = dataModel?.description ?? ""
			priceLabel.text = dataModel?.price
			setupConstrains()
		}
	}
	// MARK: - Private Components
	private let nameLabel: UILabel = {
		let label = UILabel()
		label.textColor  = .black
		label.numberOfLines = 2
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
		return label
	}()

	private let priceLabel: UILabel = {
		let label = UILabel()
		label.textColor  = .black
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
		return label
	}()

	private let descriptionLabel: UILabel = {
		let label = UILabel()
		label.textColor  = .black
		label.numberOfLines = 0
		label.textAlignment = .left
		label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
		label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)

		label.translatesAutoresizingMaskIntoConstraints = false
		label.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
		return label
	}()

	private let caloriesLabel: UILabel = {
		let label = UILabel()
		label.textColor  = .black
		label.textAlignment = .right
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
		label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)

		return label
	}()

	private let cellImageView: UIImageView = {
		let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = Constants.General.cellsCornerRadius
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	private let backView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = Constants.General.cellsCornerRadius
		view.layer.masksToBounds = false
		view.backgroundColor = .mainImageColor
		view.layer.shadowOpacity = 0.8
		view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
		view.layer.shadowRadius = 5.0
		view.layer.shadowColor = UIColor.gray.cgColor
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	// MARK: - Inits
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(backView)
		addViewToBackView()
		self.backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
		super.awakeFromNib()

	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
}

// MARK: - Private
private extension MenuItemCell {
	func addViewToBackView(){
		backView.addSubview(nameLabel)
		backView.addSubview(cellImageView)
		backView.addSubview(descriptionLabel)
		backView.addSubview(caloriesLabel)
		backView.addSubview(priceLabel)

		setupConstrains()
	}

	func setupConstrains() {
		NSLayoutConstraint.activate([

			backView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95),

			backView.centerXAnchor.constraint(equalTo: centerXAnchor),
			backView.centerYAnchor.constraint(equalTo: centerYAnchor),
			backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			backView.topAnchor.constraint(equalTo: topAnchor, constant: +10),

			cellImageView.topAnchor.constraint(equalTo: backView.topAnchor),
			cellImageView.widthAnchor.constraint(equalToConstant: 75),
			cellImageView.heightAnchor.constraint(equalToConstant: 75),
			cellImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),

			nameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
			nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
			nameLabel.trailingAnchor.constraint(equalTo: caloriesLabel.leadingAnchor, constant: -10),

			caloriesLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
			caloriesLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
			caloriesLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

			priceLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
			priceLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
			priceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),

			descriptionLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
			descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
			descriptionLabel.trailingAnchor.constraint(equalTo: caloriesLabel.leadingAnchor, constant: -5),
			descriptionLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),

			backView.heightAnchor.constraint(greaterThanOrEqualToConstant: 75)
		])
	}
}
