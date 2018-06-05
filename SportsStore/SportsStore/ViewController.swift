//
//  ViewController.swift
//  SportsStore
//
//  Created by Alexey Danilov on 03.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "ProductCell"
    
    var product: Product?
    
    @IBOutlet weak var totalStockLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var products = [
        Product(name:"Kayak", description:"A boat for one person",
                category:"Watersports", price:275.0, stockLevel:10),
        Product(name:"Lifejacket", description:"Protective and fashionable",
                category:"Watersports", price:48.95, stockLevel:14),
        Product(name:"Soccer Ball", description:"FIFA-approved size and weight",
                category:"Soccer", price:19.5, stockLevel:32),
        Product(name:"Corner Flags",
                description:"Give your playing field a professional touch",
                category:"Soccer", price:34.95, stockLevel:1),
        Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",
                category:"Soccer", price:79500.0, stockLevel:4),
        Product(name:"Thinking Cap",
                description:"Improve your brain efficiency by 75%",
                category:"Chess", price:16.0, stockLevel:8),
        Product(name:"Unsteady Chair",
                description:"Secretly give your opponent a disadvantage",
                category: "Chess", price: 29.95, stockLevel:3),
        Product(name:"Human Chess Board",
                description:"A fun game for the family", category:"Chess",
                price:75.0, stockLevel:2),
        Product(name:"Bling-Bling King",
                description:"Gold-plated, diamond-studded King",
                category:"Chess", price:1200.0, stockLevel:4)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        displayStockTotal()
    }
    
    @IBAction func stockLevelChanged(_ sender: Any) {
        if let senderView = sender as? UIView,
            let containerView = senderView.superview,
            let stackView = containerView.superview,
            let contentView = stackView.superview,
            let currentCell = contentView.superview,
            let productCell = currentCell as? ProductCell,
            let product = productCell.product {
            var newStockLevel: Int?
            if let stepper = sender as? UIStepper {
                newStockLevel = Int(stepper.value)
            } else if let textField = sender as? UITextField,
                let text = textField.text {
                newStockLevel = Int(text)
            }
            if let level = newStockLevel {
                product.stockLevel = level
                productCell.stockStepper.value = Double(product.stockLevel)
                productCell.stockTextField.text = String(product.stockLevel)
            }
            displayStockTotal()
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func displayStockTotal() {
        let finalTotals: (Int, Double) = products.reduce((0, 0.0), {
            (total, product) -> (Int, Double) in
                return (
                    total.0 + product.stockLevel,
                    total.1 + product.stockValue
            )
        })
        totalStockLabel.text = "\(finalTotals.0) Products in Stock. " +
        "Total Value: \(Utils.currencyStringFromNumber(finalTotals.1))"
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        cell.configure(product)
        return cell
    }
}

