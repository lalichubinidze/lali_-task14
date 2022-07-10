import UIKit

class Detail: UIViewController {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }

    @IBAction func presentSheet(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Sheet") as! Sheet
        present(vc, animated: true)
    }

    func updateLabels() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Registration") as? Registration
        guard let vc = vc else { return }
        vc.saveUsername = { value in
            self.username.text = value?.text
        }
        vc.saveEmail = { value in
            self.email.text = value?.text
        }
    }
}
