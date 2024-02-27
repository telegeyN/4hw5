//
//  NotificationViewController.swift
//  4hw5
//
//  Created by Telegey Nurbekova on 25/02/24.
//

import UIKit

class NotificationViewController: UIViewController {
    
    private var items: [Item] = []
    private let notificationLabel = MakerView().makerLabel(text: "Notification", font: Fonts.bold.size(24))
    private let settingsButton = MakerView().makerButton(backgroundColor: .clear, image: UIImage(named: "settings"))
    private let generalLabel = MakerView().makerLabel(text: "General", font: Fonts.semiBold.size(18), textColor: .init(hex: "#F5484A"), textAlignment: .center)
    private let systemLabel = MakerView().makerLabel(text: "System", font: Fonts.semiBold.size(18), textColor: .init(hex: "#9E9E9E"), textAlignment: .center)
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#F5484A")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view }()
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(hex: "#9E9E9E")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view }()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        updateDetails()
        setData()
    }
    
    private func setData(){
        view.addSubview(notificationLabel)
        NSLayoutConstraint.activate([
            notificationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20)
        ])
        
        view.addSubview(settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.centerYAnchor.constraint(equalTo: notificationLabel.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -5),
            settingsButton.widthAnchor.constraint(equalToConstant: 28),
            settingsButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        view.addSubview(generalLabel)
        NSLayoutConstraint.activate([
            generalLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 15),
            generalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80)
        ])
        
        view.addSubview(systemLabel)
        NSLayoutConstraint.activate([
            systemLabel.centerYAnchor.constraint(equalTo: generalLabel.centerYAnchor),
            systemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])
        
        
        view.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: generalLabel.bottomAnchor, constant: 5),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            lineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        view.addSubview(grayView)
        NSLayoutConstraint.activate([
            grayView.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            grayView.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 0),
            grayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            grayView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        //table view
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant: 10),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomtTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func updateDetails(){
        
        items =  [
            Item(logoImage: "logo1", news: "Jane Cooper has published a new recipe!", time: "Today | 09:24 AM", foodImage: "food1", dotsImage: "dots"),
            Item(logoImage: "logo2", news: "Rochel has commented on your recipe", time: "1 day ago | 14:43 PM", foodImage: "food2", dotsImage: "dots"),
            Item(logoImage: "logo3", news: "Brad Wigington liked your comment", time: "1 day ago | 09:29 AM", foodImage: "food3", dotsImage: "dots"),
            Item(logoImage: "logo4", news: "Tyra Ballentine has published a new recipe!", time: "2 days ago | 10:29 AM", foodImage: "food4", dotsImage: "dots"),
            Item(logoImage: "logo5", news: "Marci Winkles has published a new recipe!", time: "3 days ago | 16:52 PM", foodImage: "food5", dotsImage: "dots"),
            Item(logoImage: "logo6", news: "Aileen has commented on your recipe", time: "4 days ago | 14:27 PM", foodImage: "food6", dotsImage: "dots"),
            Item(logoImage: "logo7", news: "George has commented on your recipe", time: "5 days ago | 09:20 AM", foodImage: "food7", dotsImage: "dots")
        ]
    }
}

extension NotificationViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomtTableViewCell
        
        let item = items[indexPath.row]
        cell.setData(logo: item.logoImage, news: item.news, time: item.time, food: item.foodImage, dots: item.dotsImage)
        
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
