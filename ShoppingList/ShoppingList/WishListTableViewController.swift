//
//  WishListTableViewController.swift
//  ShoppingList
//
//  Created by Woochan Park on 2021/11/04.
//

import UIKit

class WishListTableViewController: UITableViewController {
  
  @IBOutlet weak var inputBackView: UIView! {
    didSet {
      inputBackView.layer.masksToBounds = true
      inputBackView.layer.cornerRadius = 8
    }
  }
  
  @IBOutlet weak var inputTextField: UITextField!
  
  var wishList: [Wish] = []

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
      
      return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 10
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.identifier, for: indexPath) as? WishListTableViewCell else { return UITableViewCell() }
    
    /**
     단일 섹션이므로 tag 를 사용하면 편함
     */
    
    cell.doneButton.addTarget(self, action: #selector(didTapDoneButton(sender:)), for: .touchUpInside)
    
    cell.starButton.addTarget(self, action: #selector(didTapStarButton(sender:)), for: .touchUpInside)
    
    return cell
  }

  
  @IBAction func didTapAddButton(_ sender: UIButton) {
    
    guard let text = inputTextField.text, !text.isEmpty else {
      
      let alert = UIAlertController.alertControllerWithOkAction(title: "입력값 없음", message: "입력 값을 확인해주세요")
      
      present(alert, animated: true, completion: nil)
      
      return
    }
    
    UserDefaults.standard.set([], forKey: <#T##String#>)
    
  }
  
  @objc func didTapDoneButton(sender: UIButton) {
    print(sender.tag)
    
    sender.isSelected.toggle()
  }
  
  @objc func didTapStarButton(sender: UIButton) {
    print(sender.tag)
    
    sender.isSelected.toggle()
  }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
