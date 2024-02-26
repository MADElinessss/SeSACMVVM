//
//  NetworkViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/26/24.
//

import Alamofire
import UIKit

class NetworkViewController: UITableViewController {
    
    var list: [Market] = []
    
    let viewModel = NetworkViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 네트워크 요청 -> response -> codable -> list에 append -> 뷰
        viewModel.inputViewDidLoadTrigger.value = ()
        bindData()
    }
    
    func bindData() {
        viewModel.ourpurMarketData.bind { market in
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ourpurMarketData.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "networkCell", for: indexPath)
        cell.textLabel?.text = viewModel.ourpurMarketData.value[indexPath.row].korean_name
        cell.detailTextLabel?.text = viewModel.ourpurMarketData.value[indexPath.row].market
        return cell
    }

}
