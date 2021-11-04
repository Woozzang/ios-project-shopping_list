//
//  UIAlertController+Extension.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import UIKit

extension UIAlertController {
  
  static func alertControllerWithOkAction(title: String, message: String, okTitle: String = "네") -> UIAlertController {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: okTitle, style: .default, handler: nil)
    
    alertController.addAction(okAction)
    
    return alertController
  }
}
