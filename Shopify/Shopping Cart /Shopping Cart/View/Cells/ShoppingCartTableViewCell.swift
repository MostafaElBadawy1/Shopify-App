//
//  ShoppingCartTableViewCell.swift
//  Shopify
//
//  Created by Macintosh on 04/07/2022.
//

import UIKit



protocol CartSelection {
    
    func addProductToCart(product : CartItem, atIndex : Int)
}


class ShoppingCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandCost: UILabel!
    @IBOutlet weak var numberOfBrand: UILabel!
    
    
    var product:CartItem!
    private var counterValue: Int = 1 {
        didSet{
        numberOfBrand.text = "\(counterValue)"
        }
    }
    
    var productIndex = 0
    var cartSelectionDelegate: CartSelection?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


        // Configure the view for the selected state
    }
    
    
   
    
    
    @IBAction func decreaseOfBrand(_ sender: Any) {
        
       /* self.numBrand-=1;
        print("decrease \(numBrand)")
*/
        
        
        if(counterValue != 1){
                   counterValue -= 1;
               }
        self.numberOfBrand.text = "\(counterValue)"
         product.price = product.price - (product.price * Double(counterValue))
         print(product.price)
        cartSelectionDelegate?.addProductToCart(product: product, atIndex: productIndex)
             
        
        
        
    }
    @IBAction func increaseOfBrand(_ sender: Any) {
      //  self.numBrand+=1;
     //   print("increaese \(numBrand)")
        
        
        
                counterValue += 1;
               self.numberOfBrand.text = "\(counterValue)"
                product.price = product.price * Double(counterValue)
                print(product.price)
               cartSelectionDelegate?.addProductToCart(product: product, atIndex: productIndex)
    }

    }
    

    


