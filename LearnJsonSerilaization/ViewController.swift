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
    [
    {
    "name" : "Ahmed",
    "Age"  : "19",
    "email" : "ahmed@gmail.com"
    } ,
    {
    "name" : "mohamed",
    "Age"  : "22",
    "email" : "mo7med9878@gmail.com"
    },
    {
    "name" : "yousef",
    "Age"  : "21",
    "email" : "yousef@gmail.com"
    } ,
    ]
    """.data(using: .utf8)!
        
        
        if let jsonSerilization = try? JSONSerialization.jsonObject(with: jsonFormat, options: .allowFragments) as? [[String:Any]]
        {
            
            for i in jsonSerilization{
                
               let user = User(dictionary: i )
                
                guard let resultUser = user else {return}
                
                print(resultUser.email)
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



