//
//  LoginView.swift
//  Bankey
//
//  Created by Bruno Madeira on 16/10/2024.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let usernameTextField = UITextField()
    let passwordField = UITextField()
    let stackView = UIStackView()
    let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        styelUI()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func styelUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
    }
    
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordField)
        addSubview(stackView)

        NSLayoutConstraint.activate(
            [
                stackView.topAnchor
                    .constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
                stackView.leadingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: leadingAnchor,
                        multiplier: 1
                    ),
                trailingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: stackView.trailingAnchor,
                        multiplier: 1
                    ),
                bottomAnchor
                    .constraint(
                        equalToSystemSpacingBelow: stackView.bottomAnchor,
                        multiplier: 1
                    )
            ])
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
