//
//  ProductCell.swift
//  SportsStore
//
//  Created by Alexey Danilov on 03.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    private(set) var product: Product? {
        didSet {
            if let product = product {
                self.nameLabel.text = product.name
                self.descriptionLabel.text = product.description
                self.stockStepper.value = Double(product.stockLevel)
                self.stockTextField.text = String(product.stockLevel)
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var stockStepper: UIStepper!
    
    @IBOutlet weak var stockTextField: UITextField!
    
    func configure(_ product: Product) {
        self.product = product
    }
    
}
