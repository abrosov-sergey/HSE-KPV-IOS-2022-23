import UIKit

class VieViewController: UIView {

    var listOfViews: [UIView] = []
    var buttonThatChangingParameters: UIButton = UIButton()
    var listOf
    
    let cntViews = 7
    
    func creatingInterfaceElements() {
        listOfViews = []
        for i in 0..<cntViews {
            listOfViews.append(UIView())
            listOfViews[i].tag = i
        }
    }
    
    func addParametersForElements() {
        buttonThatChangingParameters.setTitle("Press to change color and corner radius", for: .normal)
        buttonThatChangingParameters.backgroundColor = .systemGray
        buttonThatChangingParameters.tag = 1
        buttonThatChangingParameters.layer.cornerRadius = 20
    }
    
    func addConnectForElements() {
        let zeroViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        listOfViews[0].addGestureRecognizer(zeroViewTapGesture)
        zeroViewTapGesture.view?.tag = 0
        
        buttonThatChangingParameters.addTarget(
            self,
            action: #selector(buttonAction),
            for: .touchUpInside
        )
        
        buttonAction(buttonSendTag: buttonThatChangingParameters)
    }
    
    func addElementsToView() {
        for element in listOfViews {
            self.addSubview(element)
        }
        
        self.addSubview(buttonThatChangingParameters)
    }
    
    func addConstraintsForElements() {
        for i in 0..<cntViews {
            listOfViews[i].translatesAutoresizingMaskIntoConstraints = false
        }
        
        buttonThatChangingParameters.translatesAutoresizingMaskIntoConstraints = false
        
        let leftRightConstraint = 1 / 40 * self.bounds.width
        let mainWidth = self.bounds.width
        let mainHeight = self.bounds.height
        
        listOfViews[0].leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftRightConstraint).isActive = true
        listOfViews[0].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2 / 3 * mainWidth).isActive = true
        listOfViews[0].topAnchor.constraint(equalTo: self.topAnchor, constant: 1 / 15 * mainHeight).isActive = true
        listOfViews[0].heightAnchor.constraint(equalToConstant: 1 / 3 * mainHeight).isActive = true
        
        listOfViews[1].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2 / 5 * mainWidth).isActive = true
        listOfViews[1].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -leftRightConstraint).isActive = true
        listOfViews[1].topAnchor.constraint(equalTo: self.topAnchor, constant: 1 / 15 * mainHeight).isActive = true
        listOfViews[1].heightAnchor.constraint(equalToConstant: 1 / 3 * mainHeight).isActive = true
        
        listOfViews[2].leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftRightConstraint).isActive = true
        listOfViews[2].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -leftRightConstraint).isActive = true
        listOfViews[2].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listOfViews[2].heightAnchor.constraint(equalToConstant: 1 / 10 * mainHeight).isActive = true
        
        listOfViews[3].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2 / 3 * mainWidth).isActive = true
        listOfViews[3].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -leftRightConstraint).isActive = true
        listOfViews[3].topAnchor.constraint(equalTo: self.topAnchor, constant: 4.2 / 7 * mainHeight).isActive = true
        listOfViews[3].heightAnchor.constraint(equalToConstant: 1 / 4 * mainHeight).isActive = true
        
        listOfViews[4].leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftRightConstraint).isActive = true
        listOfViews[4].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2 / 5 * mainWidth).isActive = true
        listOfViews[4].topAnchor.constraint(equalTo: self.topAnchor, constant: 4.2 / 7 * mainHeight).isActive = true
        listOfViews[4].heightAnchor.constraint(equalToConstant: 1 / 8 * mainHeight).isActive = true

        listOfViews[5].leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftRightConstraint).isActive = true
        listOfViews[5].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3.5 / 5 * mainWidth).isActive = true
        listOfViews[5].topAnchor.constraint(equalTo: self.topAnchor, constant: 5.2 / 7 * mainHeight).isActive = true
        listOfViews[5].heightAnchor.constraint(equalToConstant: 1 / 8 * mainHeight).isActive = true

        listOfViews[6].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2 / 5 * mainWidth).isActive = true
        listOfViews[6].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2 / 5 * mainWidth).isActive = true
        listOfViews[6].topAnchor.constraint(equalTo: self.topAnchor, constant: 5.2 / 7 * mainHeight).isActive = true
        listOfViews[6].heightAnchor.constraint(equalToConstant: 1 / 8 * mainHeight).isActive = true
        
        buttonThatChangingParameters.leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftRightConstraint).isActive = true
        buttonThatChangingParameters.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -leftRightConstraint).isActive = true
        buttonThatChangingParameters.topAnchor.constraint(equalTo: self.topAnchor, constant: 10 / 11 * mainHeight).isActive = true
        buttonThatChangingParameters.heightAnchor.constraint(equalToConstant: 1 / 15 * mainHeight).isActive = true
    }
    
    @objc func buttonAction(buttonSendTag: UIButton?) {
        buttonThatChangingParameters.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.buttonThatChangingParameters.isUserInteractionEnabled = true
        }
        
        if buttonSendTag?.tag == 1 {
            UIView.animate(withDuration: 2.0) { [weak self] in
                guard let self = self else { return }
                for i in 0..<self.cntViews {
                    self.listOfViews[i].layer.cornerRadius = Double.random(in: 0.0...50.0)
                    self.listOfViews[i].backgroundColor = getHEXColor()
                }
            }
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
            self.listOfViews[sender.view?.tag].layer.cornerRadius = Double.random(in: 0.0...50.0)
            self.listOfViews[sender.view?.tag].backgroundColor = getHEXColor()
    }
}
