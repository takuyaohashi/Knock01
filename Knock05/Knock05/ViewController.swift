//
//  ViewController.swift
//  Knock05
//
//  Created by Takuya OHASHI on 2017/09/19.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds

class ViewController: UIViewController {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupAd()
    }

    @IBAction func submitEmail(sender:UIButton) {
        guard let email = emailText.text, !email.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let validError = error {
                print("\(validError.localizedDescription)")
            } else {
                self.performSegue(withIdentifier: "successLogin",sender: nil)
            }
        }
    }

    private func setupUI() {
        passwordText.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: GADBannerViewDelegate {
    private func setupAd() {
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        bannerView.adUnitID = unitId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints([
            NSLayoutConstraint(item: bannerView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),
            NSLayoutConstraint(item: bannerView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0),
        ])
    }

    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
        print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}

