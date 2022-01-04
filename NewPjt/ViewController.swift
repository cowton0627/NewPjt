//
//  ViewController.swift
//  NewPjt
//
//  Created by Chun-Li Cheng on 2022/1/3.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myBtn.tintColor = .white
//        myImageView.image = UIImage(named: "icons8-back-24")
//        myImageView.sizeToFit()

    }

    @IBAction func btnPressed(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "\(SecondViewController.self)") else {
            return
        }
        show(vc, sender: nil)
    }
    
}

