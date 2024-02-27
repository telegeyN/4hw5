//
//  CustomTableViewCell.swift
//  4hw5
//
//  Created by Telegey Nurbekova on 27/02/24.
//

import UIKit

class CustomtTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.semiBold.size(18)
        label.textColor = .init(hex: "#000000")
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.medium.size(14)
        label.textColor = .init(hex: "#616161")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let dotsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        bgView.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            logoImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 48),
            logoImage.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        bgView.addSubview(newsLabel)
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 2),
            newsLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            newsLabel.widthAnchor.constraint(equalToConstant: 198)
        ])
        
        bgView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 5),
            timeLabel.centerXAnchor.constraint(equalTo: newsLabel.centerXAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 198)
        ])
        
        bgView.addSubview(dotsImage)
        NSLayoutConstraint.activate([
            dotsImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            dotsImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5),
            dotsImage.heightAnchor.constraint(equalToConstant: 18),
            dotsImage.widthAnchor.constraint(equalToConstant: 4)
        ])
        
        bgView.addSubview(foodImage)
        NSLayoutConstraint.activate([
            foodImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            foodImage.trailingAnchor.constraint(equalTo: dotsImage.leadingAnchor, constant: -8),
            foodImage.heightAnchor.constraint(equalToConstant: 72),
            foodImage.widthAnchor.constraint(equalToConstant: 72)
        ])
        
    }
    
    func setData(logo: String, news: String, time: String, food: String, dots: String){
        logoImage.image = UIImage(named: logo)
        newsLabel.text = news
        timeLabel.text = time
        foodImage.image = UIImage(named: food)
        dotsImage.image = UIImage(named: dots)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
