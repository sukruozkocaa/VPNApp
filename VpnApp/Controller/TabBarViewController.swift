//
//  TabBarViewController.swift
//  VpnApp
//
//  Created by Şükrü Özkoca on 14.02.2023.
//

import UIKit
import SnapKit

protocol serverListControl {
    func goServer()
}

class TabBarViewController: UIViewController {

    //MARK: - ContentView
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
    
    //MARK: - TabBarItems
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
    
    //PersonButton
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let vc = HomeViewController()
        contentView.frame = view.bounds
        vc.delegate = self
        contentView.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllItems()
    }
    
    func getAllItems() {
        view.addSubview(contentView)
        view.addSubview(TabBarView)
        TabBarView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height*0.15)
            make.bottom.equalTo(view).offset(0)
        }
        TabBarView.addSubview(homeButton)
        homeButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*0.1)
            make.height.equalTo(view.frame.width*0.09)
            make.left.equalTo(TabBarView).offset(view.frame.width*0.17)
            make.top.equalTo(TabBarView).offset(20)
        }
        TabBarView.addSubview(analysisButton)
        analysisButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*0.09)
            make.height.equalTo(view.frame.width*0.09)
            make.centerX.equalTo(TabBarView)
            make.top.equalTo(TabBarView).offset(20)
        }
        TabBarView.addSubview(personButton)
        personButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*0.09)
            make.height.equalTo(view.frame.width*0.09)
            make.right.equalTo(TabBarView).offset(-view.frame.width*0.17)
            make.top.equalTo(TabBarView).offset(20)
        }
        TabBarView.addSubview(homeView)
        homeView.snp.makeConstraints { (make) in
            make.width.equalTo(8)
            make.height.equalTo(8)
            make.centerX.equalTo(homeButton)
            make.bottom.equalTo(homeButton).offset(17)
        }
        TabBarView.addSubview(analysisView)
        analysisView.snp.makeConstraints { (make) in
            make.width.equalTo(8)
            make.height.equalTo(8)
            make.centerX.equalTo(analysisButton)
            make.bottom.equalTo(analysisButton).offset(17)
        }
        TabBarView.addSubview(personView)
        personView.snp.makeConstraints { (make) in
            make.width.equalTo(8)
            make.height.equalTo(8)
            make.centerX.equalTo(personButton)
            make.bottom.equalTo(personButton).offset(17)
        }
    }
    
    @objc func selectButton(sender: UIButton) {
        if sender.tag == 0{
            editSelectItems(homeVwColor: .green, homeBtnColor: .green, analysisVwColor: .white, analysisBtnColor: .white, personVwColor: .white, personBtnColor: .white,vc: HomeViewController())
        }
        else if sender.tag == 1 {
            editSelectItems(homeVwColor: .white, homeBtnColor: .white, analysisVwColor: .green, analysisBtnColor: .green, personVwColor: .white, personBtnColor: .white,vc: AnalysisViewController())
        }
        else {
            editSelectItems(homeVwColor: .white, homeBtnColor: .white, analysisVwColor: .white, analysisBtnColor: .white, personVwColor: .green, personBtnColor: .green,vc: PersonViewController())
        }
    }
    
    func editSelectItems(homeVwColor: UIColor, homeBtnColor: UIColor, analysisVwColor: UIColor, analysisBtnColor: UIColor, personVwColor: UIColor, personBtnColor: UIColor, vc: UIViewController) {
        self.homeView.backgroundColor = homeVwColor
        self.homeButton.tintColor = homeBtnColor
        self.analysisView.backgroundColor = analysisVwColor
        self.analysisButton.tintColor = analysisBtnColor
        self.personView.backgroundColor = personVwColor
        self.personButton.tintColor = personBtnColor
        contentView.addSubview(vc.view)
        self.addChild(vc)
        vc.didMove(toParent: self)
    }
}

extension TabBarViewController: serverListControl {
    func goServer() {
        let vc = ServerListViewController()
        self.present(vc, animated: true)
    }
}
