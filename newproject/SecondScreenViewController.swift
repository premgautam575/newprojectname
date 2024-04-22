//
//  SecondScreenViewController.swift
//  newproject
//
//  Created by prem  on 22/04/24.
//

import UIKit
import FirebaseAuth

class SecondScreenViewController: UIViewController {
    
    @IBOutlet weak var fullnametext: UITextField!
    
    @IBOutlet weak var emailidtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var errorlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorlbl.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupbtn(_ sender: Any) {
        Auth.auth().createUser(withEmail: (emailidtxt.text ?? ""), password: (passwordtxt.text ?? "")) { (result, error) in
            if let _eror = error {
                //something bad happning
                print(_eror.localizedDescription )
                self.errorlbl.isHidden = false
                self.errorlbl.text = _eror.localizedDescription
            }
            else{
                let controller = FirstScreenViewController()
                self.navigationController?.pushViewController(controller, animated: true)
                //user registered successfully
                print(result)
            }
        }
    }
            
            
            @IBAction func SignInbtn(_ sender: Any) {
                let controller = FirstScreenViewController()
                self.navigationController?.pushViewController(controller, animated: true)
                
            }
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
        }


