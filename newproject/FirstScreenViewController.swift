//
//  FirstScreenViewController.swift
//  newproject
//
//  Created by prem  on 21/04/24.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

class FirstScreenViewController: UIViewController {
    
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorlbl.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func googlebtn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                // ...
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // ...
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // ...
            
            Auth.auth().signIn(with: credential) { result, error in
                let controller = ThirdScreenViewController()
                self.navigationController?.pushViewController(controller, animated: true)
                print("sign in")
                // At this point, our user is signed in
            }
        }
    }
    
    @IBAction func applebtn(_ sender: Any) {
    }
    
    

    
    @IBAction func signInbtn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: (emailId.text ?? ""), password: (password.text ?? "")) { (result, error) in
            if let _eror = error{
                print(_eror.localizedDescription)
                self.errorlbl.text = _eror.localizedDescription
                self.errorlbl.isHidden = false
            }else{
                let controller = ThirdScreenViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    
    @IBAction func Signupbtn(_ sender: Any) {
        let controller = SecondScreenViewController()
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
