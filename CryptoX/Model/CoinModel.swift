//
//  CoinModel.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import Foundation

protocol CoinModelDelegate: AnyObject {
    func didFailWithError(error: Error)
    func updataCoins(_ coinData: CoinData)
}

struct CoinModel {
    var delegate: CoinModelDelegate?
    let urlString =  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=10&page=1&sparkline=false"
    
    func getCellData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data{
                    if let coinData = parseData(safeData) {
                        self.delegate?.updataCoins(coinData)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseData(_ data: Data) -> CoinData? {
        do {
            let decoder = JSONDecoder()
            let coinData = try decoder.decode(CoinData.self, from: data)
            return coinData.self
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
