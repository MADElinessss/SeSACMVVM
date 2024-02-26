//
//  UserTableViewController.swift
//  SeSACMVVM
//
//  Created by Madeline on 2/22/24.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    let viewModel = UserViewModel()
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var deleteAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        bindData()
    }
    
    func configureView() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
        deleteAllButton.addTarget(self, action: #selector(deleteAllButtonTapped), for: .touchUpInside)
    }
    
    func bindData() {
        // didSet해서 reloadData 했던거를 이렇게 바꿔
        viewModel.list.bind { value in // value: [User]
            self.tableView.reloadData()
        }
    }
    
    @objc func deleteAllButtonTapped(_ sender: UIButton) {
        viewModel.inputDeleteButtonTapped.value = ()
    }
    
    @objc func loadButtonTapped(_ sender: UIButton) {
        // viewModel - fetchUser -> 다시 4명만 넣어주기
        viewModel.inputLoadButtonTapped.value = () // 비어있는 튜플을 보낸다!
    }

    
    @objc func addButtonTapped(_ sender: UIButton) {
        // viewModel > list > append
        // viewModel.appendUser(name: addTextField.text)
        
        viewModel.inputAddText.value = addTextField.text
        
        // tableView.reloadData()
    }
    
    @objc func searchButtonTapped() {
        // 검색 기능
        // VC에서 하던걸 -> 뷰모델
        viewModel.inputSearchWord.value = searchTextField.text
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
