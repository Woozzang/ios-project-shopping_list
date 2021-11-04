//
//  WishListTableViewCell.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import UIKit

final class WishListTableViewCell: UITableViewCell {
  
  static let identifier: String = String(describing: WishListTableViewCell.self)

  @IBOutlet weak var doneButton: UIButton!
  
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var starButton: UIButton!
  
  override func layoutSubviews() {
      super.layoutSubviews()

      contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
  }
}
