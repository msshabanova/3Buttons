//
//  MyButton.swift
//  3Buttons
//
//  Created by mariya.shabanova on 06.11.2024.
//

import UIKit

final class MyButton: UIButton {
    
    private let buttonImageView = UIImageView()
    private let buttonTitleLabel = UILabel()

    init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton(title: "")
    }
    
    private func setupButton(title: String) {

        buttonTitleLabel.text = title
        buttonTitleLabel.textColor = .white
        buttonTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        buttonImageView.image = UIImage(systemName: "arrow.right.circle.fill")
        buttonImageView.tintColor = .white
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonTitleLabel)
        addSubview(buttonImageView)
        
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            buttonTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonImageView.leadingAnchor.constraint(equalTo: buttonTitleLabel.trailingAnchor, constant: 8),
            buttonImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonImageView.widthAnchor.constraint(equalToConstant: 24),
            buttonImageView.heightAnchor.constraint(equalToConstant: 24),
            
            trailingAnchor.constraint(equalTo: buttonImageView.trailingAnchor, constant: 14)
        ])
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 44)
        ])

        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
    }
    
    func updateColors(backgroundColor: UIColor, textColor: UIColor, iconColor: UIColor) {
        self.backgroundColor = backgroundColor
        buttonTitleLabel.textColor = textColor
        buttonImageView.tintColor = iconColor
    }
    
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.2) {
            self.transform = .identity
        }
    }
}
