//
//  SectionView.swift
//  MCRAvocado
//
//  Created by Onie on 10.09.2022.
//

//import UIKit
//
//class SectionView: UIView {
//	let label: UILabel = {
//		let label = UILabel()
//		label.backgroundColor = .lightGray
//		label.translatesAutoresizingMaskIntoConstraints = false
//		return label
//	}()
//
//	let backView: UIView = {
//		let view = UIView()
//		view.translatesAutoresizingMaskIntoConstraints = false
//		return view
//	}()
//
//	let blurView: UIVisualEffectView = {
//		let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
//		let blurEffectView = UIVisualEffectView(effect: blurEffect)
//		blurEffectView.translatesAutoresizingMaskIntoConstraints = false
//		return blurEffectView
//	}()
//
//	init(frame: CGRect, text: String) {
//		super.init(frame: frame)
//		label.text = text
//		addSubview(backView)
//		backView.addSubview(blurView)
//		backView.addSubview(label)
//		setupConstrains()
//	}
//
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//
//	func setupConstrains() {
//		NSLayoutConstraint.activate([
//			backView.leadingAnchor.constraint(equalTo: leadingAnchor),
//			backView.trailingAnchor.constraint(equalTo: trailingAnchor),
//			backView.bottomAnchor.constraint(equalTo: bottomAnchor),
//			backView.topAnchor.constraint(equalTo: topAnchor),
//
//			blurView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
//			blurView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
//			blurView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
//			blurView.topAnchor.constraint(equalTo: backView.topAnchor),
//
//			label.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
//			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//
//		])
//	}
//}

