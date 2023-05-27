//
//  CustomCell.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CustomCell: UITableViewCell {
    
    static let idCell = "CumtomCell"
    
     lazy var  titleLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 15)
        view.numberOfLines = 0
        
        view.textAlignment = .justified
        return view
        
    }()
    
     lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 13)
        view.numberOfLines = 0
        view.textColor = .systemMint
        view.textAlignment = .justified
        return view
        
    }()
    
    lazy var imageOfNews: UIImageView = {
        let imageOfNews = UIImageView()
        imageOfNews.backgroundColor = .white
        imageOfNews.contentMode = .scaleAspectFill
        imageOfNews.layer.cornerRadius = 4
        imageOfNews.layer.borderWidth = 2
        imageOfNews.layer.masksToBounds = true
//        imageOfNews.clipsToBounds = true
        return imageOfNews
    }()
    private lazy var dividerViews: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    override func layoutSubviews() {
        setupConstraints()

       
    }
    func  setupConstraints() {
        
        self.addSubview(imageOfNews)
        imageOfNews.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(140)
            imageOfNews.layer.cornerRadius = imageOfNews.frame.height / 12.0
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
            
        }
        self.addSubview(dividerViews)
        dividerViews.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(0.3)
            
        }
    }
    func configure(with: Product) {
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.imageOfNews.kf.setImage(with: URL(string: with.thumbnail!))
    }
}
