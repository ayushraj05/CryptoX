//
//  ViewController.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(trendingLabel)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero

        
        setupConstraints()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    // MARK: -  Views
    private let trendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemYellow
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white

        return tableView
    }()
    
    
    // MARK: - Coinstraints
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                // Trending label constraints
                trendingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                trendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                trendingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                // Table view constraints
                tableView.topAnchor.constraint(equalTo: trendingLabel.bottomAnchor, constant: 10),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

}

