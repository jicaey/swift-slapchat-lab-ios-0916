//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Michael Young on 11/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class AddMessageViewController: UIViewController {
  
  let store = DataStore.sharedInstance
  
  @IBOutlet weak var addMessageTextField: UITextField!
  
  
  
  
  
  @IBAction func saveButtonTouched(_ sender: AnyObject) {
    
    let context = store.persistentContainer.viewContext
    
    guard let textInput = addMessageTextField.text else { return }
    let newMessage = Message(context: context)
    newMessage.content = textInput
    
    store.saveContext()
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
