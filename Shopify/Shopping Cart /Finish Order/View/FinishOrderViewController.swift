//
//  FinishOrderViewController.swift
//  Shopify
//
//  Created by Macintosh on 05/07/2022.
//

import UIKit

class FinishOrderViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var subTotalLbl: UILabel!
    @IBOutlet weak var shippingFeeslbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var DiscountTxtView: UITextField!
    
    
    var TotalCart  = [CartItem]()
    var totalCost : Double = 0.0
    var customerID : Int = 0
    var address : String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("totalCost \(totalCost)")
        print("customer id \(customerID)")
        print("address \(address)")
        for item in TotalCart {
            print(item)
        }
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeorder(_ sender: Any) {
    }
    @IBAction func validateCoupon(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    
    
    func makeDesignToView () {
        // corner radius
        myView.layer.cornerRadius = 20

        // border
        myView.layer.borderWidth = 2.0
        myView.layer.borderColor = UIColor.black.cgColor
    }

    
    func calculateTotal () {
      //  totalLbl.text = totalCost + 
        
    }
    
}






