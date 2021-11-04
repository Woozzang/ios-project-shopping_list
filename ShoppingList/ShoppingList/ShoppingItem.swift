//
//  WishList.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import Foundation

struct ShoppingItem: Codable {
  
  var isDone: Bool = false
  
  var isStarred: Bool = false
  
  var textDescription: String
}
