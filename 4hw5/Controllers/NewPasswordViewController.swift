//
//  ViewController.swift
//  4hw5
//
//  Created by Telegey Nurbekova on 25/02/24.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    private let createLabel = MakerView().makerLabel(text: "Create New Password 🔐")
    private let enterLabel = MakerView().makerLabel(text: "Enter your new password. If you forget it, then you have to do forgot password.", font: Fonts.regular.size(18), numberOfLines: 2)
    private let passwordLabel = MakerView().makerLabel(text: "Password", font: Fonts.bold.size(16))
    private let passwordTF = MakerView().makerTextFieldWithUnderline(placeholder: "Enter Password")
    private let passwordEyeButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate))
    private let confirmPasswordLabel = MakerView().makerLabel(text: "Confirm Password", font: Fonts.bold.size(16))
    private let confirmTF = MakerView().makerTextFieldWithUnderline(placeholder: "Confirm Password")
    private let confirmEyeButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate))
    private let rememberMeButton = MakerView().makerButton(image: UIImage(systemName: "square.fill")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "checkmark")?.withRenderingMode(.alwaysTemplate), cornerRadius: 8)
    private let rememberMeLabel = MakerView().makerLabel(text: "Remember me", font: Fonts.semiBold.size(18))
    private let continueButton = MakerView().makerButton(backgroundColor: .lightGray, title: "Continue", cornerRadius: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.isEnabled = false
        setUpUI()
        passwordTF.delegate = self
        confirmTF.delegate = self
        textFieldDidChangeSelection(passwordTF)
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(createLabel)
        NSLayoutConstraint.activate([
            createLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            createLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(enterLabel)
        NSLayoutConstraint.activate([
            enterLabel.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 15),
            enterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTF.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        passwordEyeButton.tintColor = UIColor.init(hex: "#F5484A")
        view.addSubview(passwordEyeButton)
        NSLayoutConstraint.activate([
            passwordEyeButton.centerYAnchor.constraint(equalTo: passwordTF.centerYAnchor),
            passwordEyeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordEyeButton.heightAnchor.constraint(equalToConstant: 30),
            passwordEyeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        passwordEyeButton.addTarget(self, action: #selector(passwordEyeTapped), for: .touchUpInside)
        
        view.addSubview(confirmPasswordLabel)
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 12),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(confirmTF)
        NSLayoutConstraint.activate([
            confirmTF.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 5),
            confirmTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmTF.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        confirmEyeButton.tintColor = UIColor.init(hex: "#F5484A")
        view.addSubview(confirmEyeButton)
        NSLayoutConstraint.activate([
            confirmEyeButton.centerYAnchor.constraint(equalTo: confirmTF.centerYAnchor),
            confirmEyeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmEyeButton.heightAnchor.constraint(equalToConstant: 30),
            confirmEyeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        confirmEyeButton.addTarget(self, action: #selector(confirmEyeTapped), for: .touchUpInside)
        
        rememberMeButton.tintColor = .white
        view.addSubview(rememberMeButton)
        NSLayoutConstraint.activate([
            rememberMeButton.topAnchor.constraint(equalTo: confirmTF.bottomAnchor, constant: 12),
            rememberMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rememberMeButton.heightAnchor.constraint(equalToConstant: 24),
            rememberMeButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        rememberMeButton.addTarget(self, action: #selector(rememberMeTapped), for: .touchUpInside)
        
        view.addSubview(rememberMeLabel)
        NSLayoutConstraint.activate([
            rememberMeLabel.centerYAnchor.constraint(equalTo: rememberMeButton.centerYAnchor),
            rememberMeLabel.leadingAnchor.constraint(equalTo: rememberMeButton.trailingAnchor, constant: 10)
        ])
        
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 58)
        ])
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
    }
    
    @objc private func passwordEyeTapped(_ sender: UIButton) {
        passwordTF.isSecureTextEntry.toggle()
        passwordEyeButton.isSelected.toggle()
    }
    
    @objc private func confirmEyeTapped(_ sender: UIButton) {
        confirmTF.isSecureTextEntry.toggle()
        confirmEyeButton.isSelected.toggle()
    }
    
    @objc private func rememberMeTapped(_ sender: UIButton) {
        rememberMeButton.isSelected.toggle()
    }
    
    @objc private func continueTapped(_ sender: UIButton) {
        
        let vc = NotificationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NewPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let passwordText = passwordTF.text, let confirmText = confirmTF.text else {
            return
        }
        if passwordText.count >= 4 && passwordText == confirmText {
            continueButton.isEnabled = true
            continueButton.backgroundColor = UIColor(hex: "#F5484A")
        } else {
            continueButton.isEnabled = false
            continueButton.backgroundColor = .lightGray
        }
    }
}
