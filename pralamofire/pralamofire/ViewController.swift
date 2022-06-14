//
//  ViewController.swift
//  pralamofire
//
//  Created by cumulations on 14/06/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://httpbin.org/get/image").responseData { data in
           let data = try? data
            print(data)
        }
    }


}

