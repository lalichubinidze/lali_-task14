import UIKit

class Login: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var user: UITextField?
    var pass: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Oops!", message: "Invalid authorization", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }

    @IBAction func signUpButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Registration") as! Registration
        vc.saveUsername = { value in
            self.user = value
        }
        vc.savePassword = { value in
            self.pass = value
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func signInButton(_ sender: Any) {
        if username.text == user?.text && password.text == pass?.text {
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! Detail
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else {
            showAlert()
        }
    }
}

