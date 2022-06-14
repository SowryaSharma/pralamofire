//
//  ViewController.swift
//  pralamofire
//
//  Created by cumulations on 14/06/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var imagev: UIImageView!
    var endpoint = "image/jpeg"
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://httpbin.org//\(endpoint)").responseData { data in
            print(data)
            let data = try? data.value
            self.imagev.image = UIImage(data: data!)
        }
    }


}

