//
//  UserTableViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Food(name: "")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.cellForRowAt(indexPath).name
        cell.detailTextLabel?.text = "\(viewModel.cellForRowAt(indexPath).age)"
        
        return cell
    }
}
