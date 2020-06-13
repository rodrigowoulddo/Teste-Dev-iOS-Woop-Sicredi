//
//  EventDetailViewController.swift
//  Teste-Dev-iOS-Woop-Sicredi
//
//  Created by Rodrigo Giglio on 12/06/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Attributes
    let viewModel = EventDetailViewModel()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupViewModel()
    }
    
    
    // MARK: - Configuration
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
    }
}


// MARK: - EventDetailViewModelDelegate
extension EventDetailViewController: EventDetailViewModelDelegate {
    
}


// MARK: - UITableViewDataSource
extension EventDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cellType = EventDetailCellType.atIndex(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier) as? EventDetailTableViewCell,
            let event = viewModel.event
            
        else { return UITableViewCell()  }
        
        cell.configure(with: event)
        
        return cell
    }
}