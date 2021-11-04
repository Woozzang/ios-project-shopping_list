//
//  WishListTableViewCell.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import UIKit

final class ShoppingListTableViewCell: UITableViewCell {
  
  static let identifier: String = String(describing: ShoppingListTableViewCell.self)

  @IBOutlet weak var doneButton: UIButton!
  
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var starButton: UIButton!
  
  var isDone: Bool {
    return doneButton.isSelected
  }
  
  var isStarred: Bool {
    return starButton.isSelected
  }
  
  var textDescription: String {
    
    get {
      return descriptionLabel.text ?? ""
    }
    
    set {
      descriptionLabel.text = newValue
    }
  }
}
