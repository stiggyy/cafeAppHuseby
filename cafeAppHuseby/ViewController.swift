//
//  ViewController.swift
//  cafeAppHuseby
//
//  Created by CATHERINE HUSEBY on 9/12/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var errorMsgOutlet: UILabel!
    
    //@IBOutlet weak var menuOutlet: UILabel!
    
    @IBOutlet weak var cartViewOutlet: UITextView!
   // @IBOutlet weak var CartOutlet: UILabel!
    @IBOutlet weak var OrderOutlet: UITextField!
    
    @IBOutlet weak var quantOutlet: UITextField!
    
    @IBOutlet weak var menuViewOutlet: UITextView!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var itemNameOutlet: UITextField!
    
    @IBOutlet weak var amountAdminOutlet: UITextField!
    
    var foodNames = ["apples","bananas","bread","eggs","muffins"]
    var foodPrice = [0.10, 0.30, 0.50, 2.00, 5.00]
    var cart:[Double:String] =  [:]
    
    var price: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrderOutlet.delegate = self
        quantOutlet.delegate = self
        passwordOutlet.delegate = self
        itemNameOutlet.delegate = self
        amountAdminOutlet.delegate = self
    
        // Do any additional setup after loading the view.
        
        var menu = ""
        //var menuDict:[Double:String] = [:]
        for i in foodNames.indices{
            menu = menu + "\(foodNames[i]): $\(foodPrice[i]) \n"
        }
        
        
        menuViewOutlet.text = menu
    }
    
    @IBAction func orderAction(_ sender: Any) {
        var hasFood = true
        var orderText = OrderOutlet.text?.lowercased()
        if let x = Int(quantOutlet.text!){
            //var amt = Int(quantOutlet.text!)
            if let y = orderText {
                
                for i in foodNames.indices{
                    for (_, value) in cart {
                        if foodNames[i] == value {
                            hasFood = false
                            break
                        }
                    }
                    if y == foodNames[i] {
                        
                        cart[Double(Double(x)*foodPrice[i])] = y
                       break
                        
                    }
                    
                }
                
            } else {
                hasFood = false
            }
        } else {
            hasFood = false
        }
        
        if hasFood == false {
            errorMsgOutlet.text =
            "Error, please try again!"
        }
        
        //putting it in cart text
        var cartText = ""
        var cost = 0.0
        for (key, value) in cart{
            
            for c in foodPrice.indices{
                
                if foodNames[c] == value {
                    //cost = foodPrice[c] * Double(key)
                    cartText = cartText + "\(value) ($\(key)) \n"
                    cost = cost + (key)

                }
                
            }
        }
        
        cartText = cartText + "total cost: $\(cost) \n"
        cartViewOutlet.text = cartText
    }
    
    
    @IBAction func adminAction(_ sender: Any) {
        var password = "yay"
        if password == passwordOutlet.text! {
            var itemName = itemNameOutlet.text!
            foodNames.append(itemName)
            var amt = Double(amountAdminOutlet.text!)
            foodPrice.append(amt!)
            //putting new menu in
            var menu = ""
            //var menuDict:[Double:String] = [:]
            for i in foodNames.indices{
                menu = menu + "\(foodNames[i]): $\(foodPrice[i]) \n"
            }
            
            
            menuViewOutlet.text = menu
        } else {
            errorMsgOutlet.text = "Wrong password, try again!"
            
        }
    }
    
    @IBAction func nameSortAction(_ sender: Any) {
        
        var menuNameSortArray = foodNames
        var menuPriceSortArray: [Double] = []
        menuNameSortArray.sort()
        for i in foodNames.indices {
            for x in menuNameSortArray.indices {
                if menuNameSortArray[x] == foodNames[i] {
                    menuPriceSortArray.append(foodPrice[i])
                }
            }
        }
        
        var menu = ""
        //var menuDict:[Double:String] = [:]
        for i in menuNameSortArray.indices{
            menu = menu + "\(menuNameSortArray[i]): $\(menuPriceSortArray[i]) \n"
        }
        
        
        menuViewOutlet.text = menu
        
        
    }
    
    
    @IBAction func priceSortAction(_ sender: Any) {
        
        var menuNameSortArray: [String] = []
        var menuPriceSortArray = foodPrice
        menuPriceSortArray.sort()
        for i in foodPrice.indices {
            for x in menuPriceSortArray.indices {
                if menuPriceSortArray[x] == foodPrice[i] {
                    menuNameSortArray.append(foodNames[i])
                }
            }
        }
        
        var menu = ""
        //var menuDict:[Double:String] = [:]
        for i in menuNameSortArray.indices{
            menu = menu + "\(menuNameSortArray[i]): $\(menuPriceSortArray[i]) \n"
        }
        
        
        menuViewOutlet.text = menu

        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        OrderOutlet.resignFirstResponder()
        quantOutlet.resignFirstResponder()
        passwordOutlet.resignFirstResponder()
        itemNameOutlet.resignFirstResponder()
        amountAdminOutlet.resignFirstResponder()
        
        return true
    }

    


}

