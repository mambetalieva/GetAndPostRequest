//
//  GetDataPage.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import UIKit
import SnapKit

class GetDataPage: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        
        return view
    }()
    
    private  var data: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableViewSettings()
        networking()
    }
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupTableViewSettings(){
        view.backgroundColor = .purple
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.idCell)
        
    }
    private func  networking() {
        
        ApiManager.shared.getReguest { result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.data = value.products ?? []
                    self.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
}
extension GetDataPage: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.idCell, for: indexPath) as! CustomCell
        let model = data[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = GetNextPageView()
            vc.item = data[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
    
    
}
