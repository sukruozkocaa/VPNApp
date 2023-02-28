//
//  HomeViewController.swift
//  VpnApp
//
//  Created by Şükrü Özkoca on 14.02.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "network")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    //MARK: - StartButtonView
    private let startView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 55
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let startButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "power.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize:100)), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onClicked), for: .allEvents)
        return button
    }()
    
    //MARK: - NavigationBarButtons
    
    private let menuButton: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 30
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.backgroundColor = .clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.red.cgColor
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.grid.2x2",withConfiguration: UIImage.SymbolConfiguration(pointSize: 28)), for: .normal)
        return button
    }()
    
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
        label.text = "TrueVPN"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - SelectLocationView
    private let locationBgView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 71/255, alpha: 1)
        view.layer.cornerRadius = 35
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "america")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let locationNameLabel: UILabel = {
       let label = UILabel()
        label.text = "United States"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "GillSans-Bold", size: 15)
        return label
    }()
    
    private let selectLocationButton: UIButton = {
       let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "greaterthan.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(serverList), for: .allTouchEvents)
        return button
    }()
    
    var selectCount = 0
    var delegate: serverListControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(startView)
        startView.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*0.3)
            make.height.equalTo(view.frame.height*0.3)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-250)
        }
        startView.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*0.3)
            make.height.equalTo(view.frame.width*0.3)
            make.bottom.equalTo(startView).offset(0)
        }
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(40)
            make.left.equalTo(view).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.leading.equalTo(view)
        }
        view.addSubview(settingButton)
        settingButton.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(menuButton)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(locationBgView)
        locationBgView.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-view.frame.height*0.15)
            make.centerX.equalTo(view)
            make.width.equalTo(275)
            make.height.equalTo(70)
        }
        
        locationBgView.addSubview(locationImageView)
        locationImageView.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.top.equalTo(locationBgView).offset(15)
            make.left.equalTo(locationBgView).offset(15)
        }
        
        locationBgView.addSubview(locationNameLabel)
        locationNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationBgView)
            make.centerX.equalTo(locationBgView)
        }
        
        locationBgView.addSubview(selectLocationButton)
        selectLocationButton.snp.makeConstraints { (make) in
            make.right.equalTo(locationBgView).offset(-20)
            make.centerY.equalTo(locationBgView)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    @objc func serverList() {
        delegate?.goServer()
    }
    
    @objc func onClicked() {
        if selectCount == 0 {
            UIView.animate(withDuration: 0.5, delay: 0.6) {
                self.startButton.translatesAutoresizingMaskIntoConstraints = true
                self.startButton.frame = CGRect(x: 0, y: 0, width: self.startView.frame.width, height: self.startView.frame.width)
                self.startButton.tintColor = .green
                self.startView.layer.borderColor = UIColor.green.cgColor
                self.selectCount = 1
            }
        }
        else if selectCount == 1 {
            UIView.animate(withDuration: 0.5, delay: 0.6) {
                self.startButton.frame = CGRect(x: 0, y: self.startView.frame.height-self.startButton.frame.height, width: self.startView.frame.width, height: self.startView.frame.width)
                self.startButton.tintColor = .red
                self.startView.layer.borderColor = UIColor.red.cgColor
                self.selectCount = 0
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
}
