//
//  ViewController.swift
//  DemoTvOS
//
//  Created by Wlad Dicario on 12/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Interface
    @IBOutlet weak var HeadLabel: UILabel!
    @IBOutlet weak var buttonTouch: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    
    // MARK: - Properties
    let press = UITapGestureRecognizer()
    let SegueID = "ShowList"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setPressGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK: - UISetView -> ViewController Extension
typealias UISetView = ViewController
extension UISetView {
    
    /// set styling
    func setStyle() {
        // label text
        HeadLabel.text = "Hello tvOS!"
        HeadLabel.sizeToFit()
        HeadLabel.textColor = UIColor.darkGray
        // button tag
        buttonTouch.tag = 0
        // navigation title
        self.title = "Apple Tv Demo App"
    }
    /// set gesture recognizer
    func setPressGesture() {
        // define action for `Play/Pause` apple tv remote button
        press.addTarget(self, action: #selector(ViewController.pressed(_:)))
        press.delegate = self

        press.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue)]
        //press.allowedPressTypes = [NSNumber(UIPressType.playPause.rawValue)]
        self.view.addGestureRecognizer(press)
    }
}


//MARK: - UIActions -> ViewController Extension
typealias UIActions = ViewController
extension UIActions {

    /// Change HeadLabel by Button Action
    @IBAction func handleMe(_ sender: AnyObject) {
        if sender.tag == 0 {
            HeadLabel.text = "Ready to go!"
            HeadLabel.textColor = UIColor.green
            HeadLabel.sizeToFit()
            buttonTouch.tag = 1
        }else{
            HeadLabel.text = "Hello tvOS!"
            HeadLabel.textColor = UIColor.darkGray
            HeadLabel.sizeToFit()
            buttonTouch.tag = 0
        }
    }
    /// Segue Navigation -> Show ListTableViewController with Segue identifier
    @IBAction func showTableView(_ sender: AnyObject) {
        self.performSegue(withIdentifier: SegueID, sender: self)
    }
}


//MARK: - UIGestures -> ViewController Extension
typealias UIGestures = ViewController
extension UIGestures : UIGestureRecognizerDelegate {

    /// Simple Press PlayPause action - gesture recognizer
    func pressed(_ recognizer:UITapGestureRecognizer) {
        if recognizer.isEnabled {
            HeadLabel.text = "Play Pause Pressed!"
            HeadLabel.textColor = UIColor.red
            HeadLabel.sizeToFit()
        }
    }
    /// Gestures simultaneous recognizer Delegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
