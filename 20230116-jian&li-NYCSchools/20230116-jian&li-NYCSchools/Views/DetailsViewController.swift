//
//  DetailsViewController.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/18/23.
//

import UIKit

class DetailsViewController: UIViewController {
    let data: SchoolSATModel
    
    init(data: SchoolSATModel) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
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
        label.text = data.name
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    // number
    lazy var numberTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Number of SAT Test takers: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var numberLabel:UILabel = {
        let label = UILabel()
        label.text = data.numOfSAT
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    // reading
    lazy var readingTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Reading Avg Score: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var readingLabel:UILabel = {
        let label = UILabel()
        label.text = data.readingAvgScore
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    // math
    lazy var mathTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Math Avg Score: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var mathLabel:UILabel = {
        let label = UILabel()
        label.text = data.mathAvgScore
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    // writing
    lazy var writingTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Writing Avg Score: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    lazy var writingLabel:UILabel = {
        let label = UILabel()
        label.text = data.writingAvgScore
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private func setupUI() {
        let line1 = UIStackView(arrangedSubviews: [
            nameTitleLabel, nameLabel])
        line1.spacing = 10
        line1.distribution = .equalSpacing
        let line2 = UIStackView(arrangedSubviews: [
            numberTitleLabel, numberLabel])
        line2.spacing = 10
        line2.distribution = .equalSpacing
        let line3 = UIStackView(arrangedSubviews: [
            readingTitleLabel, readingLabel])
        line3.spacing = 10
        line3.distribution = .equalSpacing
        let line4 = UIStackView(arrangedSubviews: [
            mathTitleLabel, mathLabel])
        line4.spacing = 10
        line4.distribution = .equalSpacing
        let line5 = UIStackView(arrangedSubviews: [
            writingTitleLabel, writingLabel])
        line5.spacing = 10
        line5.distribution = .equalSpacing
        
        let stack = UIStackView(arrangedSubviews: [
        line1, line2, line3, line4, line5])
        stack.axis = .vertical
        stack.alignment = .top
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        
        view.addSubview(stack)
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        stack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10).isActive = true
        //stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
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
