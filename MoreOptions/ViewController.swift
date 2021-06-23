//
//  ViewController.swift
//  MoreOptions
//
//  Created by Jaldeep Patel on 2021-05-17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getNavigationBarGradient()
    }
}

extension ViewController {
    
    func getNavigationBarGradient() {
        
        if let navigationBar = self.navigationController?.navigationBar {
            
            let gradient = CAGradientLayer()
            
            var bounds = navigationBar.bounds
            
            bounds.size.height += view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            
            gradient.frame = bounds
           
            gradient.colors = [UIColor.init(red: 78, green: 114, blue: 186).cgColor, UIColor.init(red: 62, green:178, blue: 174).cgColor]
            
            gradient.startPoint = CGPoint(x: 0, y: 0)
            
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }
    }
    
    
    func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        
        UIGraphicsEndImageContext()
        return gradientImage
    }
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        }
    }


