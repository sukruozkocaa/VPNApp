//
//  TabBarViewController.swift
//  VpnApp
//
//  Created by Şükrü Özkoca on 14.02.2023.
//

import UIKit

protocol serverListControl {
    func goServer()
}

protocol selectLocationProtocol {
    func selectLocation(imageName: String, countryName: String)
}

class TabBarViewController: UIViewController {

    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    //MARK: - TabBarView
    private let TabBarView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - TabBar Items
    
    //HomeButton
    private let homeView: UIView = {
       let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        return view
    }()
    
    private let homeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "house",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.tintColor = .green
        button.tag = 0
        button.addTarget(self, action: #selector(selectButton), for: .touchDown)
        return button
    }()
    
    //AnalysisButton
    private let analysisView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        return view
    }()
    
    private let analysisButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chart.line.uptrend.xyaxis",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.tintColor = .white
        button.tag = 1
        button.addTarget(self, action: #selector(selectButton), for: .touchDown)
        return button
    }()
    
    private let personView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        return view
    }()
    
    private let personButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
        button.tintColor = .white
        button.tag = 2
        button.addTarget(self, action: #selector(selectButton), for: .touchDown)
        return button
    }()
    
    var delegate: selectLocationProtocol?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        view.addSubview(TabBarView)
        tabBarViewConstraints()
        
        TabBarView.addSubview(homeButton)
        TabBarView.addSubview(analysisButton)
        TabBarView.addSubview(personButton)
        TabBarView.addSubview(homeView)
        TabBarView.addSubview(analysisView)
        TabBarView.addSubview(personView)
        tabBarItemsConstraints()
        
    }
    
    @objc func selectButton(sender: UIButton) {
        if sender.tag == 0 {
            homeView.backgroundColor = .green
            homeButton.tintColor = .green
            
            analysisView.backgroundColor = .white
            analysisButton.tintColor = .white
            
            personView.backgroundColor = .white
            personButton.tintColor = .white
            
            let vc = HomeViewController()
            vc.delegate = self
            contentView.addSubview(vc.view)
            self.addChild(vc)
            vc.didMove(toParent: self)
            
        }
        else if sender.tag == 1 {
            homeView.backgroundColor = .white
            homeButton.tintColor = .white
            
            analysisView.backgroundColor = .green
            analysisButton.tintColor = .green
            
            personView.backgroundColor = .white
            personButton.tintColor = .white
            
            let vc = AnalysisViewController()
            contentView.addSubview(vc.view)
            self.addChild(vc)
            vc.didMove(toParent: self)
        }
        else {
            homeView.backgroundColor = .white
            homeButton.tintColor = .white
            
            analysisView.backgroundColor = .white
            analysisButton.tintColor = .white
            
            personView.backgroundColor = .green
            personButton.tintColor = .green
            
            let vc = PersonViewController()
            contentView.addSubview(vc.view)
            self.addChild(vc)
            vc.didMove(toParent: self)
        }
    }
    
    func tabBarViewConstraints() {
        NSLayoutConstraint.activate([
            TabBarView.widthAnchor.constraint(equalToConstant: view.frame.width),
            TabBarView.heightAnchor.constraint(equalToConstant: view.frame.height*0.15),
            TabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        ])
    }
    
    func tabBarItemsConstraints() {
        NSLayoutConstraint.activate([
            homeButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.1),
            homeButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.09),
            homeButton.leftAnchor.constraint(equalTo: TabBarView.leftAnchor, constant: view.frame.width*0.17),
            homeButton.topAnchor.constraint(equalTo: TabBarView.topAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            homeView.widthAnchor.constraint(equalToConstant: 8),
            homeView.heightAnchor.constraint(equalToConstant: 8),
            homeView.centerXAnchor.constraint(equalTo: homeButton.centerXAnchor),
            homeView.topAnchor.constraint(equalTo: homeButton.bottomAnchor,constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            analysisButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.09),
            analysisButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.09),
            analysisButton.leftAnchor.constraint(equalTo: homeButton.rightAnchor, constant: view.frame.width*0.20),
            analysisButton.topAnchor.constraint(equalTo: TabBarView.topAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            analysisView.widthAnchor.constraint(equalToConstant: 8),
            analysisView.heightAnchor.constraint(equalToConstant: 8),
            analysisView.centerXAnchor.constraint(equalTo: analysisButton.centerXAnchor),
            analysisView.topAnchor.constraint(equalTo: analysisButton.bottomAnchor,constant: 17)
        ])
        
        NSLayoutConstraint.activate([
            personButton.widthAnchor.constraint(equalToConstant: view.frame.width*0.09),
            personButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.09),
            personButton.leftAnchor.constraint(equalTo: analysisButton.rightAnchor, constant: view.frame.width*0.20),
            personButton.topAnchor.constraint(equalTo: TabBarView.topAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            personView.widthAnchor.constraint(equalToConstant: 8),
            personView.heightAnchor.constraint(equalToConstant: 8),
            personView.centerXAnchor.constraint(equalTo: personButton.centerXAnchor),
            personView.topAnchor.constraint(equalTo: personButton.bottomAnchor,constant: 17)
        ])
    }
}

extension TabBarViewController: serverListControl {
    func goServer() {
        let vc = ServerListViewController()
        self.present(vc, animated: true)
        vc.delegate = self
    }
}

extension TabBarViewController: selectLocationProtocol {
    func selectLocation(imageName: String, countryName: String) {
        delegate?.selectLocation(imageName: imageName, countryName: countryName)
    }
}
