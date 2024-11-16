//
//  ViewController.swift
//  Bankey
//
//  Created by Bruno Madeira on 16/10/2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton
            .addTarget(
                self,
                action: #selector(signInTapped),
                for: .primaryActionTriggered
            )
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Login View
        NSLayoutConstraint.activate(
            [
                loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginView.leadingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: view.leadingAnchor,
                        multiplier: 1
                    ),
                view.trailingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: loginView.trailingAnchor,
                        multiplier: 1
                    )
            ]
        )
        
        //Sign In Button
        NSLayoutConstraint.activate(
            [
                signInButton.topAnchor
                    .constraint(
                        equalToSystemSpacingBelow: loginView.bottomAnchor,
                        multiplier: 2
                    ),
                signInButton.leadingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: view.leadingAnchor,
                        multiplier: 1
                    ),
                view.trailingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: signInButton.trailingAnchor,
                        multiplier: 1
                    )
            ]
        )
        
        //Error message label 
        NSLayoutConstraint.activate(
            [
                errorMessageLabel.topAnchor
                    .constraint(
                        equalToSystemSpacingBelow: signInButton.bottomAnchor,
                        multiplier: 2
                    ),
                errorMessageLabel.leadingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: view.leadingAnchor,
                        multiplier: 1
                    ),
                view.trailingAnchor
                    .constraint(
                        equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor,
                        multiplier: 1
                    )
            ]
        )

    }
}

extension LoginViewController {
 
    @objc func signInTapped(sender: UIButton) {
        
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorret username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}

