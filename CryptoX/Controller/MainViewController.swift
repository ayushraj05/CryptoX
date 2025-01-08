//
//  ViewController.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var coinModel: CoinModel = CoinModel()
    var coinData: [CoinData] = []

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
        tableView.rowHeight = 70


        
        setupConstraints()
        coinModel.delegate = self
        coinModel.getCellData()
    }
    
    
    
    //MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinData.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.priceLabel.text = String(coinData[indexPath.row].current_price)
        cell.percentageLabel.text = String(coinData[indexPath.row].price_change_percentage_24h)
        cell.fullNameLabel.text = coinData[indexPath.row].name
        cell.symbolLabel.text = coinData[indexPath.row].symbol
        
        if let imageUrl = URL(string: coinData[indexPath.row].image) {
            cell.coinImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
        }
        
        return cell
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
            tableView.separatorColor = .gray 
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
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

// MARK: - extenstion COinModel

extension MainViewController: CoinModelDelegate {
    func didFailWithError(error: any Error) {
        print(error)
    }
    
    func updataCoins(_ coinData: [CoinData]) {
        DispatchQueue.main.async {
            self.coinData = coinData
            self.tableView.reloadData()
        }
    }
    
    
}

