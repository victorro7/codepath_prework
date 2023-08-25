//
//  ViewController.swift
//  ios-prework
//
//  Created by Victor Osunji on 8/19/23.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // make light mode default for switch
        modeIconImageView.image = UIImage(named: "LightMode")
        
    }
    
//    @IBOutlet weak var iconLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var modeIconImageView: UIImageView!
    @IBOutlet weak var modeSwitch: UISwitch!


    //Function to change background color when "Switch Color" button is pressed
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        func changeColor() -> UIColor {

                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)

                return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
            }
        
        let randomColor = changeColor()
        view.backgroundColor = randomColor
    }
    
    

    
    //Function to toggle between light and dark mode using silder
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                modeIconImageView.image = UIImage(named: "DarkMode")
            } else {
                appDelegate?.overrideUserInterfaceStyle = .light
                modeIconImageView.image = UIImage(named: "LightMode")
            }
            
            // Animate the light and dark icons to position change
            UIView.animate(withDuration: 0.1) {
                var newX: CGFloat = 0.0

                if sender.isOn {
                    newX = self.modeSwitch.frame.origin.x + self.modeSwitch.frame.width - 25
                } else {
                    newX = self.modeSwitch.frame.origin.x + 6
                }

                self.modeIconImageView.frame.origin.x = newX
            }

        }
    }

    
    
    //Function to change the text color
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            let selectedColor = viewController.selectedColor
            colorLabel.textColor = selectedColor
            schoolLabel.textColor = selectedColor
            jobLabel.textColor = selectedColor
            dismiss(animated: true, completion: nil)
        }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        colorLabel.textColor = selectedColor
        schoolLabel.textColor = selectedColor
        jobLabel.textColor = selectedColor
    }
    
    @IBAction func changeTextColorButtonTapped(_ sender: UIButton) {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil)
    }
}


