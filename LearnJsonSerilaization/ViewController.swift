//
//  ViewController.swift
//  LearnJsonSerilaization
//
//  Created by Mohamed on 9/22/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
  let jsonFormat = """

    {
    "name" : "Ahmed",
    "Age"  : "21",
    "email" : "mo7med9878@gmail.com"
    }

    """.data(using: .utf8)!
        
        
        if let jsonSerilization = try? JSONSerialization.jsonObject(with: jsonFormat, options: .allowFragments) as? [String:Any]
        {
            
            if let user = User(dictionary: jsonSerilization)
            {
                
                print(user.email)
                
            }
           
            
        }
    }
    


}


struct User {
    
    var name:String
    var Age:String
    var email:String
    
    
    init?(dictionary:[String:Any]) {
        
        guard let name = dictionary["name"] ,
            let age = dictionary["Age"] ,
            let email = dictionary["email"]
            else {return nil}
        
        self.name = name as! String
        self.Age = age as! String
        self.email = email as! String
        
        
    }
    
    
}

