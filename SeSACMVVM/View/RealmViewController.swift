//
//  RealmViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/27/24.
//

import RealmSwift
import UIKit

class RealmViewController: UITableViewController {
    
    let repository = DiaryRepository()
    let viewModel = RealmViewModel()
    
    var list: [Diary] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.inputViewDidLoadTrigger.value = ()
        list = viewModel.repository.fetchItem()
        // list = repository.fetchItem()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "realmCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "realmCell")!
        
        cell.textLabel?.text = list[indexPath.row].name
        cell.detailTextLabel?.text = list[indexPath.row].market
        
        return cell
    }

}
