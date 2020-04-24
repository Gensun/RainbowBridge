//
//  ViewController.swift
//  RainbowBridge
//
//  Created by Genie Sun on 2020/4/23.
//  Copyright © 2020 Lookingedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var btn: UIButton! {
        didSet {
            btn.layer.cornerRadius = 5
            btn.layer.masksToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func install(_ sender: Any) {
        if let url = URL(string: "itms-services://?action=download-manifest&url=https://raw.githubusercontent.com/Gensun/OTA/master/manifest.plist") {
            if UIApplication.shared.canOpenURL(url) {
                btn.isSelected = !btn.isSelected
                UIApplication.shared.open(url, options: [:]) { [weak self] _ in
                    self?.exitApplication()
                }
            }
        }
    }
}

extension ViewController {
    func exitApplication() {
        if let window = UIApplication.shared.delegate?.window as? UIWindow {
            UIView.animate(withDuration: 1.5, animations: {
                window.alpha = 0
                window.frame = CGRect(x: 0, y: window.bounds.size.height / 2, width: window.bounds.size.width, height: 0.5)
            }) { _ in
                exit(0)
            }
        }
    }
}
