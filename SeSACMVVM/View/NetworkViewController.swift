//
//  NetworkViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/26/24.
//

import Alamofire
import UIKit

class NetworkViewController: UITableViewController {
    
    let viewModel = NetworkViewModel()

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네트워크 요청 -> response -> codable -> list에 append -> 뷰
        viewModel.inputViewDidLoadTrigger.value = ()
        bindData()
    }
    
    func bindData() {
        viewModel.outputMarketData.bind { market in
            self.tableView.reloadData()
        }
        viewModel.outputLabel.bind { value in
            self.resultLabel.text = value
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputMarketData.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "networkCell", for: indexPath)
        cell.textLabel?.text = viewModel.outputMarketData.value[indexPath.row].korean_name
        cell.detailTextLabel?.text = viewModel.outputMarketData.value[indexPath.row].market
        return cell
    }

}
