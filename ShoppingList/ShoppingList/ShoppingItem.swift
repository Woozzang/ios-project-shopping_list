//
//  WishList.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import Foundation
import RealmSwift

//struct ShoppingItem: Codable {
//
//  var isDone: Bool = false
//
//  var isStarred: Bool = false
//
//  var textDescription: String
//}

class ShoppingItem: Object {
  @Persisted(primaryKey: true) var id: ObjectId
  
  @Persisted var isDone: Bool = false
  
  @Persisted var isStarred: Bool = false
  
  @Persisted var textDescription: String = ""
  
  @Persisted var writtenDate: Date = Date()
}
