//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Jason Lobo on 12/28/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBAction func morePetsStepper(_ sender: UIStepper) {
        numberOfPetsLabel.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    
    @IBOutlet weak var schoolNameTextfield: UITextField!
    
    @IBOutlet weak var schoolYearSegmentedControl: UISegmentedControl!
    
    //Create intro function
    @IBAction func createButtonPressed(_ sender: UIButton) {
        let year = schoolYearSegmentedControl.titleForSegment(at: schoolYearSegmentedControl.selectedSegmentIndex)
        
        let introduction = "My name is \(firstNameTextfield.text!) \(lastNameTextfield.text!) and I attend \(schoolNameTextfield.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
        
        print(introduction)
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
                
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
                
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
                
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        firstNameTextfield.text = nil
        lastNameTextfield.text = nil
        schoolNameTextfield.text = nil
        schoolYearSegmentedControl.selectedSegmentIndex = 0
        numberOfPetsLabel.text = "0"
        morePetsSwitch.setOn(true, animated: true)
        
        
        imageView.image = UIImage(named: "defaultSchool")
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Image Picker function
    @IBAction func btnImagePicker(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        
        picker.delegate = self
        
        present(picker, animated: true)
        
    }
    
    //Image picker controller
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else {return}
        
        imageView.image = image
        
        dismiss(animated: true)
    }
    

}

