//
//  SchoolListViewCell.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import UIKit

class SchoolListViewCell: UITableViewCell {
    static let identifier = "SchoolListViewCell"
    
    var data: SchoolModel?
    
    func setData(data: SchoolModel) {
        self.data = data
    }
    // name
    lazy var nameTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = data?.name ?? ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    // address
    lazy var addrTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Addr:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var addrLabel:UILabel = {
        let label = UILabel()
        label.text = data?.location ?? ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    // telephone
    lazy var telTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Tel:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var telLabel:UILabel = {
        let label = UILabel()
        label.text = data?.phone ?? ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(nameTitleLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(addrTitleLabel)
        self.contentView.addSubview(addrLabel)
        self.contentView.addSubview(telTitleLabel)
        self.contentView.addSubview(telLabel)
        
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            nameTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            nameTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeArea.trailingAnchor, constant: -45),
            
            addrTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            addrTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            addrLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            addrLabel.leadingAnchor.constraint(equalTo: addrTitleLabel.trailingAnchor, constant: 10),
            addrLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50),
            
            telTitleLabel.topAnchor.constraint(equalTo: addrTitleLabel.bottomAnchor),
            telTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            telLabel.topAnchor.constraint(equalTo: addrTitleLabel.bottomAnchor),
            telLabel.leadingAnchor.constraint(equalTo: telTitleLabel.trailingAnchor, constant: 10),
            ])
    }
    
    func refresh() {
        nameLabel.text = data?.name ?? ""
        addrLabel.text = data?.location ?? ""
        telLabel.text = data?.phone ?? ""
    }
}
