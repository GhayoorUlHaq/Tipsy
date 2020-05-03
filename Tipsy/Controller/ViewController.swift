
import UIKit

class ViewController: UIViewController {

    var calculation = Calculation()
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var valueText: UITextField!
    @IBOutlet weak var totalPersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculation.setPersons(value: "2")
        calculation.setTip(value: "0")
        
    }
    
    @IBAction func tipPercetPressed(_ sender: UIButton) {
        valueText.endEditing(true)
        var selectedTip = sender.currentTitle
        switch(selectedTip){
            case zeroButton.currentTitle:
                tenButton.isSelected = false
                twentyButton.isSelected = false
                zeroButton.isSelected = true
                break
            case tenButton.currentTitle:
                tenButton.isSelected = true
                twentyButton.isSelected = false
                zeroButton.isSelected = false
                break
            case twentyButton.currentTitle:
                tenButton.isSelected = false
                twentyButton.isSelected = true
                zeroButton.isSelected = false
                break
            default:
                tenButton.isSelected = false
                twentyButton.isSelected = false
                zeroButton.isSelected = false
        }
        
        selectedTip = selectedTip?.replacingOccurrences(of: "%", with: "")
        
        calculation.setTip(value: selectedTip ?? "")
        
    }
    
    @IBAction func valueEntered(_ sender: UITextField) {
        calculation.setTotalBill(value: valueText.text ?? "")
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        totalPersonLabel.text = String(format: "%.0f" ,sender.value)
        calculation.setPersons(value: totalPersonLabel.text ?? "2")
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
       performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.perPerson = calculation.getResult()
            destinationVC.message = calculation.getMessage()
        }
    }
}

