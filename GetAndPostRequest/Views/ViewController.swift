//
//  ViewController.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private lazy var getButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .systemCyan
        view.layer.cornerRadius = 10
        view.setTitle("GET", for: .normal)
        view.setTitleColor( .black, for: .normal)
        view.addTarget(self, action: #selector(getRequest(sender: )), for: .touchUpInside)
        return view
    }()
    private lazy var postButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        view.setTitle("POST", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.backgroundColor = .systemMint
        view.addSubview(getButton)
        getButton.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(346)
        }
        view.addSubview(postButton)
        postButton.snp.makeConstraints { make in
            make.top.equalTo(getButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(346)
        }
        
    }
    @objc func getRequest(sender:UIButton){
        navigationController?.pushViewController(GetDataPage(), animated: true)
    }
    @objc func postRequest(sender:UIButton){
        navigationController?.pushViewController(PostDataPage(), animated: true)
    }
    
}
