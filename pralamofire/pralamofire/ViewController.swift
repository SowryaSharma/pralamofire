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
        downloadmanager()
    }
    func alamorequest(){
        AF.request("https://httpbin.org//\(self.endpoint)").responseData { data in
            print(data)
            let data = try? data.value
            self.imagev.image = UIImage(data: data!)
        }
    }
    func downloadmanager(){
        let documentDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)[0]
        let imageName = documentDirectory.appendingPathComponent("myImage.png")
        let urlString = "https://httpbin.org//\(self.endpoint)"

        // 2
        if let imageUrl = URL(string: urlString) {
            // 3
            URLSession.shared.downloadTask(with: imageUrl) { (tempFileUrl, response, error) in
                
                // 4
                if let imageTempFileUrl = tempFileUrl {
                    do {
                        print(imageTempFileUrl)
                        let imageData = try Data(contentsOf: imageTempFileUrl)
                        DispatchQueue.main.async {
                            self.imagev.image = UIImage(data: imageData)
                        }
                        try imageData.write(to: imageName)
                    } catch {
                        print("Error")
                    }
                }
            }.resume()
        }
    }
    
}

