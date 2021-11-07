//
//  WishListTableViewController.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import UIKit
import RealmSwift

class ShoppingListTableViewController: UITableViewController {
  
  let localRealm = try! Realm()
  
  var token: NotificationToken?
  
  @IBOutlet weak var inputBackView: UIView! {
    didSet {
      inputBackView.layer.masksToBounds = true
      inputBackView.layer.cornerRadius = 8
    }
  }
  
  @IBOutlet weak var inputTextField: UITextField!
  /*
   Realm Database only guarantees a consistent order of results if you explicitly sort them.
   */
  
  lazy var shoppingList = localRealm.objects(ShoppingItem.self).sorted(by: { lhs, rhs in
    lhs.writtenDate < rhs.writtenDate
  })
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    token = localRealm.objects(ShoppingItem.self).observe { [weak self] (changes: RealmCollectionChange) in
      
      guard let self = self else { return }
      
      switch changes {
          
        case .initial:
          
          self.tableView.reloadData()
          
        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
          
          
          
          self.shoppingList = self.localRealm.objects(ShoppingItem.self).sorted(by: { lhs, rhs in
            lhs.writtenDate < rhs.writtenDate
          })
          
          self.tableView.reloadData()
          
        case .error(_):
          print("error")
      }
    }
  }
  
  deinit {
    
    token?.invalidate()
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
      
      return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return shoppingList.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListTableViewCell.identifier, for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell() }
    
    /**
     단일 섹션이므로 tag 를 사용하면 편함
     */
    
    cell.doneButton.tag = indexPath.row
    cell.starButton.tag = indexPath.row
    
    cell.doneButton.addTarget(self, action: #selector(didTapDoneButton(sender:)), for: .touchUpInside)
    
    cell.starButton.addTarget(self, action: #selector(didTapStarButton(sender:)), for: .touchUpInside)
    
    cell.textDescription = shoppingList[indexPath.row].textDescription
    cell.doneButton.isSelected = shoppingList[indexPath.row].isDone
    cell.starButton.isSelected = shoppingList[indexPath.row].isStarred
    
    return cell
  }

  
  @IBAction func didTapAddButton(_ sender: UIButton) {
    
    guard let text = inputTextField.text, !text.isEmpty else {
      
      let alert = UIAlertController.alertControllerWithOkAction(title: "입력값 없음", message: "입력 값을 확인해주세요")
      
      present(alert, animated: true, completion: nil)
      
      return
    }
    
    /*
     위 guard 문에 의해 text 는 항상 존재함
     */
    
    let item = ShoppingItem()
    item.textDescription = text
    
    try! localRealm.write({
      
      localRealm.add(item)
    })
    
  }
  
  @objc func didTapDoneButton(sender: UIButton) {

    guard (0..<shoppingList.count).contains(sender.tag) else { return }

    let targetItem = shoppingList[sender.tag]

    let object = localRealm.object(ofType: ShoppingItem.self, forPrimaryKey: targetItem.id)
    
    try! localRealm.write({
      object?.isDone.toggle()
    })
    
  }
  
  @objc func didTapStarButton(sender: UIButton) {
    
    guard (0..<shoppingList.count).contains(sender.tag) else { return }

    let targetItem = shoppingList[sender.tag]

    let object = localRealm.object(ofType: ShoppingItem.self, forPrimaryKey: targetItem.id)
    
    try! localRealm.write({
      object?.isStarred.toggle()
    })

  }
  
}
