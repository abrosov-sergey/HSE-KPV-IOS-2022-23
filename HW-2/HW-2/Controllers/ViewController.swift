import UIKit

final class ViewController: UIViewController {
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    
    private let incrementButton = UIButton()
    
    private let value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
    }

}

extension ViewController {
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize:
        16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        
        incrementButton.layer.applyShadow()
        
        self.view.addSubview(incrementButton)
        
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pin(to: self.view,
                                [
                                    .left: 24,
                                    .right:
                                        
                                        incrementButton.addTarget(self,
                                                                  action: #selector(incrementButtonPressed),
                                                                  for: .touchUpInside
                                                                 )
    }
                                            
    private func setupValueLabel() {
    valueLabel.font = .systemFont(ofSize: 40.0,
    weight: .bold)
    valueLabel.textColor = .black
    valueLabel.text = "\(value)"
    self.view.addSubview(valueLabel)
    valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
    valueLabel.pinCenter(to: self.view.centerXAnchor)
    }
                                            
                                            
    private func setupView() {
    view.backgroundColor = .systemGray6
    setupIncrementButton()
    setupValueLabel()
    }
                                            
    @objc
    private func incrementButtonPressed() {
        value += 1
        updateUI()
    }
}
