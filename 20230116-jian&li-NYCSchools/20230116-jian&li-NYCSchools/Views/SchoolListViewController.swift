//
//  SchoolListViewViewController.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import UIKit

class SchoolListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Global.titleName
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var schoolListView: SchoolListView = SchoolListView(controller: self, viewModel: SchoolListViewModel())

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(schoolListView)
        schoolListView.translatesAutoresizingMaskIntoConstraints = false
        // constrait
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant:20),
            
            schoolListView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            schoolListView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            schoolListView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant:20),
            schoolListView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20)
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
