//
//  ViewController.swift
//  API
//
//  Created by Darya on 25.01.24.
//

import UIKit
struct User: Codable {
    let id : Int
    let name: String
    let email: String

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.email, forKey: .email)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case email
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
    }
}


    class ViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            let urlRequest = URLRequest(url: url)
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                let dict = try! JSONSerialization.jsonObject(with: data!)
                let users = try! JSONDecoder().decode([User].self, from: data!)
                print(users)
                print(dict)
                
            }.resume()
        }
        
        
    }
    

