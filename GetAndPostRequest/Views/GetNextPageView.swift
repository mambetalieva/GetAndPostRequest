//
//  GetNextPageView.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import UIKit

class GetNextPageView: UIViewController {
    var item: Product? = nil
    
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var titleLabel: UILabel = {
        let  view = UILabel()
        view.textColor = .systemBrown
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    lazy var describeLabel: UILabel = {
        let  view = UILabel()
        view.textColor = .green
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .justified
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupData()
    }
    private func setupData() {
        view.backgroundColor = .systemMint
        titleLabel.text = item?.title
        describeLabel.text = item?.description
        let url = URL(string: (item?.thumbnail)!)
        image.kf.setImage(with: url)
    }
    
    private func setupConstraints() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(190)
            make.horizontalEdges.equalToSuperview().inset(20)
        
        }
        view.addSubview(describeLabel)
        describeLabel.snp.makeConstraints {make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
            
        }
        
        view.addSubview(image)
        image.snp.makeConstraints {make in
            make.center.equalToSuperview()
            make.top.equalTo(describeLabel.snp.bottom).offset(20)
            make.height.width.equalTo(300)
        }
        
    }
}


