//
//  CoinData.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import Foundation

struct CoinData: Codable {
    let current_price: Double
    let symbol: String
    let name: String
    let image: String
    let price_change_percentage_24h: Double
}
