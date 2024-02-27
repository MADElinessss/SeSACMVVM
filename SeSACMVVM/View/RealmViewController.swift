//
//  RealmViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import RealmSwift
import UIKit

class RealmViewController: UITableViewController {
    
    let viewModel = RealmViewModel()
    
    var list: [Diary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.inputViewDidLoadTrigger.value = ()
        
        viewModel.outputList.bind { data in
            self.list = data
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "realmCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "realmCell")!
        
        cell.textLabel?.text = viewModel.outputList.value[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.outputList.value[indexPath.row].market
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RealmDetailViewController()
        // vc.data = list
        vc.viewModel.outputData.value = list
        present(vc, animated: true)
    }

}

class RealmDetailViewController: UIViewController {
    
    // var data: [Diary] = []
    
    let viewModel = RealmDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print(data)
        // print(viewModel.outputData.value)
        
        view.backgroundColor = .orange
    }
}
