import UIKit

class VieViewController: UIView {

    var listOfViews: [UIView] = []
    var buttonThatChangingParameters: UIButton = UIButton()
    
    let cntViews = 7
    
    func creatingInterfaceElements() {
        listOfViews = []
        for _ in 0..<cntViews {
            listOfViews.append(UIView())
        }
    }
    
    func addParametersForElements() {
        for i in 0..<cntViews {
            listOfViews[i].backgroundColor = .systemRed
        }
                
        buttonThatChangingParameters.setTitle("Press to change color and corner radius", for: .normal)
        buttonThatChangingParameters.backgroundColor = .systemGray
        buttonThatChangingParameters.tag = 1
        buttonThatChangingParameters.layer.cornerRadius = 20
    }
    
    func addConnectForElements() {
        buttonThatChangingParameters.addTarget(
            self,
            action: #selector(buttonAction),
            for: .touchUpInside
        )
    }
    
    func addElementsToView() {
        for i in 0..<cntViews {
            self.addSubview(listOfViews[i])
        }
        
        self.addSubview(buttonThatChangingParameters)
    }
    
    func addConstraintsForElements() {
        for i in 0..<cntViews {
            listOfViews[i].translatesAutoresizingMaskIntoConstraints = false
        }
        
        buttonThatChangingParameters.translatesAutoresizingMaskIntoConstraints = false
        
        listOfViews[0].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        listOfViews[0].topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        listOfViews[0].widthAnchor.constraint(equalToConstant: 125).isActive = true
        listOfViews[0].heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        listOfViews[1].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 170).isActive = true
        listOfViews[1].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        listOfViews[1].topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        listOfViews[1].heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        listOfViews[2].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        listOfViews[2].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        listOfViews[2].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listOfViews[2].heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        listOfViews[3].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        listOfViews[3].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -200).isActive = true
        listOfViews[3].bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -290).isActive = true
        listOfViews[3].heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        listOfViews[4].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 250).isActive = true
        listOfViews[4].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        listOfViews[4].bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        listOfViews[4].heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        listOfViews[5].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        listOfViews[5].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -350).isActive = true
        listOfViews[5].bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        listOfViews[5].heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        listOfViews[6].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100).isActive = true
        listOfViews[6].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -200).isActive = true
        listOfViews[6].bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150).isActive = true
        listOfViews[6].heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonThatChangingParameters.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        buttonThatChangingParameters.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        buttonThatChangingParameters.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        buttonThatChangingParameters.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
       let buttonSendTag: UIButton = sender
    
       if buttonSendTag.tag == 1 {
           for i in 0..<cntViews {
               listOfViews[i].layer.cornerRadius = Double.random(in: 0.0...50.0)
               
               //let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
               let red = Int.random(in: 0...255)
               let green = Int.random(in: 0...255)
               let blue = Int.random(in: 0...255)
               
               let rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8 | (Int)(blue * 255) << 0
               
               [UIView .animate(withDuration: 2.0, animations: { [self] in
                   self.listOfViews[i].backgroundColor = UIColor(rgb: rgb)
               })]
           }
       }
    }
}
