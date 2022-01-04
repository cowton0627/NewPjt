//
//  SecondViewController.swift
//  NewPjt
//
//  Created by Chun-Li Cheng on 2022/1/3.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var myView: UIView!
    
    let topLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 22, y: 60, width: 200, height: 44))
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 22, y: 90, width: 200, height: 44))
        return label
    }()
    
    var statusBarFrame: CGRect!
    var statusBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        setupStatusBar()
        setupNavBar()
        setupLabel()
        setupBottomView()
    }
    
    private func setupStatusBar() {
        if #available(iOS 13.0, *) {
            statusBarFrame = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        
         statusBarView = UIView(frame: statusBarFrame)
         view.addSubview(statusBarView)
    }
    
    private func setupNavBar() {
        navigationItem.title = "果思設計"
        let image = UIImage(named: "icons8-back-24")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(buttonTapped))
    }
    
    @objc func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupLabel() {
        myImgView.addSubview(topLabel)
        myImgView.addSubview(bottomLabel)
        
        topLabel.attributedText = NSAttributedString(
            string: "果思設計",
            attributes: [
                .font : UIFont.systemFont(ofSize: 30, weight: .medium),
                .foregroundColor : UIColor.white
        ])

        bottomLabel.attributedText = NSAttributedString(
            string: "iOS APP",
            attributes: [
                .font : UIFont.systemFont(ofSize: 20, weight: .regular),
                .foregroundColor : UIColor.white,
        ])
    }
    
    private func setupBottomView() {
        myView.layer.maskedCorners = [.layerMaxXMinYCorner]
        myView.layer.cornerRadius = 24
        myView.backgroundColor = .red
    }


}

extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y / 180
        
        if offset <= 1 {
            statusBarView.backgroundColor = .clear
        } else {
            offset = 1
            statusBarView.backgroundColor = .white
        }
        
        let whiteColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: offset)
//        let blackColor = UIColor (red: 1.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: offsetY)
        navigationController?.navigationBar.alpha = offset
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backgroundColor = whiteColor
//        navigationController?.navigationBar.titleTextAttributes =
//            [NSAttributedString.Key.foregroundColor: blackColor]

    }
}
