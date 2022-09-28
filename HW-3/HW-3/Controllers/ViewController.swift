import UIKit
import SnapKit

final class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    private let commentView = UIView()
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()

    private let incrementButton = UIButton()
    
    private var sliders: [UISlider] = []
    
    private var colorButtonPressedCounter: Int = 0

    private var value: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()

        self.view.backgroundColor = .systemGray
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

        self.view.addSubview(incrementButton)

        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.centerY.equalTo(self.view.snp.centerY)
            make.left.right.equalToSuperview().inset(30)
        }

        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }

    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"

        self.view.addSubview(valueLabel)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.snp.makeConstraints { make in
            make.bottom.equalTo(incrementButton.snp.top).inset(-5)
            make.centerX.equalToSuperview().inset(20)
        }
    }

    private func setupView() {
        view.backgroundColor = .systemGray6

        setupIncrementButton()
        setupValueLabel()
    }

    private func updateUI() {
        self.valueLabel.text = "\(self.value)"
    }

    private func setupCommentView() /*-> UIView*/ {
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12

        view.addSubview(commentView)

        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(24)
        }

        commentLabel.font = .systemFont(ofSize: 30.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center

        commentView.addSubview(commentLabel)

        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(commentView).inset(16)
        }

        // return commentView
    }

    func updateCommentLabel() {
        UIView.transition(with: commentLabel,
                          duration: 4,
                          options: .transitionCrossDissolve,
                          animations: { [self] in
            switch self.value {
            case 0...5:
                self.commentLabel.text = "hello, dude, hit him 😂"
            case 5...7:
                self.commentLabel.text = "YOU KILLED HOMER 😵"
            case 7...12:
                self.commentLabel.text = "HE'S ALIVE, hooray!!!!!"
            case 12...21:
                self.commentLabel.text = "stop doing that 👿"
            case 21...40:
                self.commentLabel.text = "just kidding, keep going))"
            case 40...50:
                self.commentLabel.text = "🎉🎉🎉🎉🎉🎉🎉🎉"
            case 50...60:
                self.commentLabel.text = "big boy"
            case 60...70:
                self.commentLabel.text = "70 70 70 moreeeee"
            case 70...80:
                self.commentLabel.text = "⭐⭐⭐⭐⭐⭐⭐⭐⭐"
            case 80...100:
                self.commentLabel.text = "80+\n go higher!"
            default:
                break
            }
        }, completion: nil)
    }

    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()

        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true

        return button
    }

    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        let smartColorButton = makeMenuButton(title: "Smart🎨")
        let notesButton = makeMenuButton(title: "📝")
        let newsButton = makeMenuButton(title: "📰")

        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, smartColorButton, notesButton, newsButton])

        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually

        self.view.addSubview(buttonsSV)

        buttonsSV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
        
        colorsButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        smartColorButton.addTarget(self, action: #selector(smartColorButtonPressed), for: .touchUpInside)
    }

    private func setupSliders() {
        for iterator in 0..<3 {
            sliders.append(UISlider())
            self.view.addSubview(sliders[iterator])
            sliders[iterator].tag = iterator
        }
        
        sliders[0].snp.makeConstraints { make in
            make.top.equalTo(incrementButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        sliders[0].thumbTintColor = .systemRed
        sliders[0].tintColor = .systemRed
        
        sliders[1].snp.makeConstraints { make in
            make.top.equalTo(sliders[0].snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        sliders[1].thumbTintColor = .systemGreen
        sliders[1].tintColor = .systemGreen
        
        sliders[2].snp.makeConstraints { make in
            make.top.equalTo(sliders[1].snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        sliders[2].thumbTintColor = .systemBlue
        sliders[2].tintColor = .systemBlue
        
        for iterator in 0..<3 {
            sliders[iterator].addTarget(self, action: #selector(slidersSlided), for: .allEvents)
        }
    }

    @objc
    private func incrementButtonPressed () {
        value += 1
        incrementButton.isEnabled = false
        incrementButton.alpha = 0.7
        updateUI()

        UIView.animate(withDuration: 0.2, animations: {
            self.incrementButton.layer.shadowPath = UIBezierPath(rect: self.incrementButton.layer.bounds).cgPath
            self.incrementButton.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            self.incrementButton.alpha = 1

            
            self.updateCommentLabel()
        }) { _ in
            self.incrementButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.incrementButton.isEnabled = true
        }

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

    }
    
    @objc func colorButtonPressed() {
        if (colorButtonPressedCounter == 0) {
            setupSliders()
        } else if (colorButtonPressedCounter % 2 == 1) {
            for iterator in 0..<3 {
                sliders[iterator].isHidden = true
            }
        } else if (colorButtonPressedCounter % 2 == 0) {
            for iterator in 0..<3 {
                sliders[iterator].isHidden = false
            }
        }
        
        colorButtonPressedCounter += 1
    }
    
    @objc func smartColorButtonPressed() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }
    
    @objc func slidersSlided(_ sender: UISlider) {
        let finishColor: UIColor = UIColor(red: Int(255 * sliders[0].value),
                                           green: Int(255 * sliders[1].value),
                                           blue: Int(255 * sliders[2].value))
        
        self.view.backgroundColor = finishColor
    }
}
