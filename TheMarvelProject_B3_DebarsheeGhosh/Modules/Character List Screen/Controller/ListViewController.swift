//
//  ListViewController.swift
//  TheMarvelProject_B3_DebarsheeGhosh
//
//  Created by Debarshee Ghosh on 6/7/21.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet private weak var listTableView: UITableView! {
        didSet {
            self.listTableView.dataSource = self
        }
    }
    
    lazy var viewModel = ListViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowsForTable()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableTableViewCell.identifier, for: indexPath) as? ListTableTableViewCell else {
            fatalError("Failed to dequeue the cell")
        }
        let data = viewModel.dataForCell(at: indexPath.row)
        cell.configure(configurator: data)
        return cell
    }
}

extension ListViewController: ListViewModelDelegate {
    func reloadTable() {
        self.listTableView.reloadData()
    }
}
