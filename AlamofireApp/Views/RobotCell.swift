//
//  RobotCell.swift
//  AlamofireApp
//
//  Created by Татьяна Дубова on 17.11.2023.
//

import UIKit

final class RobotCell: UITableViewCell {
    
    @IBOutlet weak var robotImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with robot: Robot) {
        titleLabel.text = robot.title.title
        nameLabel.text = "Name: \(robot.firstName)"
        lastNameLabel.text = "LastName: \(robot.lastName)"
        
        networkManager.fetchData(from: robot.avatar) { result in
            switch result {
            case .success(let avatar):
                self.robotImage.image = UIImage(data: avatar)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        robotImage.image = nil
    }

}
