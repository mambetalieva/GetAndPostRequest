//
//  PostDataPage.swift
//  GetAndPostRequest
//
//  Created by Каира on 27.05.2023.
//

import UIKit
import SnapKit

class PostDataPage: UIViewController {
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = "Input ID"
        text.keyboardType = .numberPad
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.borderStyle = .bezel
        return text
    }()
    private lazy var textField2: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = "  Input Product Title"
        text.keyboardType = .numberPad
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 1
        text.borderStyle = .bezel
        return text
    }()
    private lazy var postRequest: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("POST", for: .normal)
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
       setupConstraints()
        
    }
    
    private func setupConstraints() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
    }
    @objc func postRequest(sender: UIButton) {
        ApiManager.shared.postRequest(id: Int(textField.text!) ?? 0,
                                      title: textField2.text ?? "") { result in
            switch result {
            case .success(let code):
                DispatchQueue.main.async {
                    self.showAlert(title: "Status code", message: " Your status code is: \(code)")
                }
            case .failure(_):
                break
            }
        }
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        alert.addAction(.init(title: "Cansel", style: .cancel))
        present(alert, animated: true)
    }

}
