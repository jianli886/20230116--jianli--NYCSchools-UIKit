//
//  SchoolListView.swift
//  20230116-jian&li-NYCSchools
//
//  Created by jianli on 1/16/23.
//

import UIKit
import Combine

class SchoolListView: UITableView {
    private let viewModel: SchoolListViewModel
    private var subscribers = Set<AnyCancellable>()
    var searcher = UISearchController(searchResultsController: nil)
    
    init(viewModel: SchoolListViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        self.dataSource = self
        self.register(SchoolListViewCell.self, forCellReuseIdentifier: SchoolListViewCell.identifier)
        self.rowHeight = 60
        addBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func addBindings(){
        viewModel.schollsPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] (res:Any) in
                self?.reloadData()
            }.store(in: &subscribers)
    }
    
    func updateMovieData(filerText: String?=nil) {
        self.reloadData()
    }
}

extension SchoolListView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            //updateMovieData(filerText: searchText)
        } else {
            //updateMovieData()
        }
    }
}


extension SchoolListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = dequeueReusableCell(withIdentifier: SchoolListViewCell.identifier, for: indexPath)
        if let cell = cell as? SchoolListViewCell {
            cell.setData(data: viewModel.schools[row])
            cell.refresh()
        }
        return cell
    }
    
    override func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition) {
        
    }
}
