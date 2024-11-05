//
//  ViewController.swift
//  3Buttons
//
//  Created by mariya.shabanova on 05.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let firstButton = MyButton(title: "First Button")
    let secondButton = MyButton(title: "Second Medium Button")
    let thirdButton = MyButton(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
        
        thirdButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
    }
    
    private func setupStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    @objc private func showModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .automatic
        present(modalVC, animated: true, completion: nil)
        updateButtonColors()
    }
    
    private func updateButtonColors() {
        let buttons = [firstButton, secondButton, thirdButton]
        buttons.forEach { button in
            button.updateColors(backgroundColor: .systemGray2, textColor: .systemGray3, iconColor: .systemGray3)
        }
    }
}


final class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}


