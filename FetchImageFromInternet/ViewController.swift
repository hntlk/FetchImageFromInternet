//
//  ViewController.swift
//  FetchImageFromInternet
//
//  Created by Zwart on 7/4/17.
//  Copyright © 2017 Zwart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var urlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    func fetchImage(_url : String)
    {
        let url = URL(string: _url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    self.imageView.image = downloadedImage
                    self.spinner.stopAnimating()
                }
            })
            
        }).resume()

    }
    @IBAction func loadImage(_ sender: Any) {
        fetchImage(_url: urlTextField.text!)
        spinner.startAnimating()
    }
}

