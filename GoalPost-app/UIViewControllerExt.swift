//
//  UIViewControllerExt.swift
//  GoalPost-app
//
//  Created by Ahmed Waheed on 8/30/18.
//  Copyright © 2018 Ahmed Waheed. All rights reserved.
//  we need an animation to push VC between them so we made that
//  we made two function to make the first VC push right and the second push left

import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) { // to swip the VC1 from the right to the left
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) { // when we finished the last VC take us to the VC1
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedViewController = presentedViewController else { return }
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() { // when we press on the back button swip from the left to the right
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
