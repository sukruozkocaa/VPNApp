//
//  ServerListViewController.swift
//  VpnApp
//
//  Created by Şükrü Özkoca on 24.02.2023.
//

import UIKit
import SnapKit

class ServerListViewController: UIViewController {
    
    //MARK: - NavigationBarItems
    private let settingButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.red.cgColor
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape",withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)), for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Server List"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -SearchBar
    private let searchBgView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 18/255, green: 26/255, blue: 36/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        return view
        
    }()
    
    private let searchImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass",withConfiguration: UIImage.SymbolConfiguration(pointSize: 10))
        imageView.backgroundColor = .none
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let searctTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Search location..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = UIReturnKeyType.search
        return textField
    }()
    
    //MARK: - Servers
    private let fastServerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fast servers"
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        label.textColor = .white
        return label
    }()

    private let fastServerTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "denemeTableCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        return tableView
    }()
    
    private let optimalServerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Optimal servers"
        label.font = UIFont(name: "GillSans-Bold", size: 20)
        label.textColor = .white
        return label
    }()
    
    let flags = ["turkey","america","france","italy"]
    
    private let optimalServerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "denemeTableCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        return tableView
    }()
    
    private let allServerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 15)
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor(red: 54/255, green: 195/255, blue: 58/255, alpha: 1), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 29/255, green: 39/255, blue: 49/255, alpha: 1)
        view.addSubview(settingButton)
        settingButton.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(settingButton)
            make.centerX.equalTo(view)
        }
        view.addSubview(searchBgView)
        searchBgView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(60)
            make.width.equalTo(view.frame.width*0.9)
            make.height.equalTo(60)
            make.centerX.equalTo(view)
        }
        searchBgView.addSubview(searchImageView)
        searchImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(searchBgView)
            make.left.equalTo(searchBgView).offset(40)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        searchBgView.addSubview(searctTextField)
        searctTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(searchBgView)
            make.left.equalTo(searchImageView).offset(40)
            make.width.equalTo(view.frame.width*0.7)
        }
        view.addSubview(fastServerTitle)
        fastServerTitle.snp.makeConstraints { (make) in
            make.top.equalTo(searchBgView).offset(100)
            make.left.equalTo(view).offset(25)
        }
        view.addSubview(fastServerTableView)
        fastServerTableView.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(25)
            make.width.equalTo(view.frame.width-50)
            make.height.equalTo(400)
            make.top.equalTo(fastServerTitle).offset(50)
        }
        fastServerTableView.delegate = self
        fastServerTableView.dataSource = self
        view.addSubview(optimalServerTitle)
        optimalServerTitle.snp.makeConstraints { (make) in
            make.top.equalTo(fastServerTableView).offset(275)
            make.left.equalTo(view).offset(25)
        }
        view.addSubview(allServerButton)
        allServerButton.snp.makeConstraints {(make) in
            make.centerY.equalTo(optimalServerTitle)
            make.right.equalTo(view).offset(-30)
        }
        view.addSubview(optimalServerTableView)
        optimalServerTableView.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(25)
            make.width.equalTo(view.frame.width-50)
            make.height.equalTo(400)
            make.top.equalTo(fastServerTableView).offset(325)
        }
        optimalServerTableView.delegate = self
        optimalServerTableView.dataSource = self
    }
}

extension ServerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == fastServerTableView {
            return 3
        }
        else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ServersTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ServersTableViewCell
        cell.flagImageView.image = UIImage(named: flags[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == fastServerTableView {
            return 80
        }
        else {
            return 80
        }
    }
}
