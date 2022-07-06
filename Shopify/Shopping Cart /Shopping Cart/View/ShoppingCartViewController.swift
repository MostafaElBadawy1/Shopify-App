//
//  ShoppingCartViewController.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit

class ShoppingCartViewController: UIViewController , CartSelection {
    func addProductToCart(product: CartItem, atIndex: Int) {
        cart[atIndex] = product

                calculateTotal()
    }
    
   

  
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate


    var cart = [CartItem]()
    
    var totalprize : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculateTotal()

        
        myTableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: "shoppingcart")
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
        cart = db.fetchDataCart(appDelegate: appDelegate)
        totalCost.text = "\(totalprize)"
    }


    @IBAction func ProcessedToCheckOut(_ sender: Any) {
    }
    
}



extension ShoppingCartViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] Action, view, completionHandler in
            db.delete(cartItem: cart[indexPath.row], indexPath: indexPath, appDelegate: appDelegate, delegate: self)
            myTableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    }



extension ShoppingCartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingcart", for: indexPath) as! ShoppingCartTableViewCell
        /*
        cell.brandName.text = cart[indexPath.row].productTitle
        cell.minCost = cart[indexPath.row].price
        print(cell.minCost as Any)
        self.totalprize += cell.totalCost
        print("\(totalprize)")
         
         */
        cell.brandName.text = cart[indexPath.row].productTitle
         cell.product = cart[indexPath.row]
        cell.brandCost.text = "\(cell.product.price)"
         cell.productIndex = indexPath.row
         cell.cartSelectionDelegate = self
         cell.brandCost.text =  "\(cart[indexPath.row].price)"
         
         
         
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
}




extension ShoppingCartViewController : DeletionDelegate {
    func deleteMovieAtIndexPath(indexPath: IndexPath) {
        cart.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
    
    
    
    
    
     func calculateTotal()
         {
             var totalValue = 0.0
             for objProduct in cart {

                 totalValue += objProduct.price
                 
             }
             self.totalCost.text = "\(totalValue) $"

    
    
}

}
