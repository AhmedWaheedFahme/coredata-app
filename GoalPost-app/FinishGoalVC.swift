//
//  FinishGoalVC.swift
//  GoalPost-app
//
//  Created by Ahmed Waheed on 8/30/18.
//  Copyright © 2018 Ahmed Waheed. All rights reserved.
//
import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) { // to pass the data
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard() // to show the keyboard when we press
        pointsTextField.delegate = self
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != "" { // to make sure it is not nil
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail() // to back to the previous VC
    }
    
    func save(completion: (_ finished: Bool) -> ()) { // to the save all the data
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Successfully saved data.")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}

