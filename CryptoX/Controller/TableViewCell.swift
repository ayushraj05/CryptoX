//
//  TableViewCell.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // Coin Image
    let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Symbol Label
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    // Name Label
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
        
    // Price Label
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
        
    // Percentage Change Label
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        // Set the background color for the cell
        self.backgroundColor = .clear
        contentView.backgroundColor = .black
        
        // Add subviews
        contentView.addSubview(coinImageView)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(percentageLabel)
        
        // Setup constraints for each element
        setupConstraints()
        self.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Coin ImageView constraints
            coinImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            coinImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            coinImageView.widthAnchor.constraint(equalToConstant: 40),
            coinImageView.heightAnchor.constraint(equalToConstant: 40),
            
            // Symbol Label constraints
            symbolLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 16),
            symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            // Full Name Label constraints
            fullNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 5),
            
            // Price Label constraints
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: coinImageView.centerYAnchor),
            
            // Percentage Label constraints
            percentageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            percentageLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5)
        ])
    }
    
    

}
