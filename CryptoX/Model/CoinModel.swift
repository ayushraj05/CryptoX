//
//  CoinModel.swift
//  CryptoX
//
//  Created by Ayush Rajpal on 06/01/25.
//

import UIKit
import CoreData

protocol CoinModelDelegate: AnyObject {
    func didFailWithError(error: Error)
    func updataCoins(_ coinData: [CoinData])
}

struct CoinModel {
    var delegate: CoinModelDelegate?
    let urlString =  "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=50&page=1&sparkline=false"
    
    func getCellData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data{
                    if let coinData = parseData(safeData) {
                        saveToCoreData(coinData: coinData)
                        self.delegate?.updataCoins(coinData)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseData(_ data: Data) -> [CoinData]? {
        do {
            let decoder = JSONDecoder()
            let coinData = try decoder.decode([CoinData].self, from: data)
            return coinData.self
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func saveToCoreData(coinData: [CoinData]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Coin.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            // Clear existing data
            try context.execute(deleteRequest)
            try context.save()

            // Save new data
            for coin in coinData {
                let coinEntity = Coin(context: context)
                coinEntity.name = coin.name
                coinEntity.symbol = coin.symbol
                coinEntity.current_price = coin.current_price
                coinEntity.price_change_percentage_24h = coin.price_change_percentage_24h
                coinEntity.image = coin.image
            }
            try context.save()
            print("Core Data updated with new API data")
        } catch {
            print("Failed to save data to Core Data: \(error)")
        }
    }
}
