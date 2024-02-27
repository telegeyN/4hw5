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
    
    func makerImage(imageName: String = "",
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return image
    }
    
    
    func makerButton(backgroundColor: UIColor = .init(hex: "#767680", alpha: 0.2),
                     image: UIImage? = nil,
                     title: String = "",
                     titleColor: UIColor = .black,
                     titleFont: UIFont = Fonts.regular.size(17),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .clear,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setImage(image, for: .normal)
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
