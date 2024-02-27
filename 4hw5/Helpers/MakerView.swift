//
//  MakerView.swift
//  4hw5
//
//  Created by Telegey Nurbekova on 25/02/24.
//

import UIKit

class MakerView {
    
    func makerLabel(text: String = "",
                    font: UIFont = Fonts.bold.size(32),
                    textColor: UIColor = .init(hex: "#212121"),
                    backgroundColor: UIColor = .clear,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode:NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makerTextFieldWithUnderline(placeholder: String = "",
                                     font: UIFont = Fonts.semiBold.size(16),
                                     textColor: UIColor = UIColor.black,
                                     backgroundColor: UIColor = UIColor.clear,
                                     textAlignment: NSTextAlignment = NSTextAlignment.left,
                                     placeholderColor: UIColor = .lightGray,
                                     placeholderFont: UIFont = UIFont.systemFont(ofSize: 13),
                                     translatesAutoresizingMaskIntoConstraints: Bool = false) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = font
        textField.textColor = textColor
        textField.backgroundColor = backgroundColor
        textField.textAlignment = textAlignment
        
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .init(hex: "#F5484A")
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return textField
    }
    
    func makerButton(backgroundColor: UIColor = .init(hex: "#F5484A"),
                     image: UIImage? = nil,
                     image2: UIImage? = nil,
                     title: String = "",
                     titleColor: UIColor = .white,
                     titleFont: UIFont = Fonts.bold.size(16),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .clear,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setImage(image, for: .normal)
        button.setImage(image2, for: .selected)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
}
