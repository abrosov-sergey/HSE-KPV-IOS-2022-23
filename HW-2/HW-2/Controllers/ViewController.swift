import UIKit
import SnapKit

final class ViewController: UIViewController {

    private let commentLabel = UILabel()
    private let valueLabel = UILabel()

    private let incrementButton = UIButton()

    private var value: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupIncrementButton()
        setupValueLabel()
        setupCommentView()
        setupMenuButtons()

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

        // incrementButton.layer.applyShadow()

        self.view.addSubview(incrementButton)

        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.centerY.equalToSuperview()
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
            make.bottom.equalTo(incrementButton.snp.top).inset(-16)
            make.centerX.equalToSuperview().inset(20)
        }
    }

    private func setupView() {
        view.backgroundColor = .systemGray6

        setupIncrementButton()
        setupValueLabel()
    }

    private func updateUI() {
        valueLabel.text = "\(value)"
    }

    private func setupCommentView() /*-> UIView*/ {
        let commentView = UIView()

        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12

        view.addSubview(commentView)

        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(24)
        }

        commentLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
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
        switch value {
        case 0...10:
            commentLabel.text = "1 🔥"

        case 10...20:
            commentLabel.text = "2 💥"

        case 20...30:
            commentLabel.text = "3 ✨"

        case 30...40:
            commentLabel.text = "4 🦦"

        case 40...50:
            commentLabel.text = "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"

        case 50...60:
            commentLabel.text = "big boy"

        case 60...70:
            commentLabel.text = "70 70 70 moreeeee"

        case 70...80:
            commentLabel.text = "⭐⭐⭐⭐⭐⭐⭐⭐⭐"

        case 80...100:
            commentLabel.text = "80+\n go higher!"

        default:
            break
        }
    }

    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()

        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true

        return button
    }

    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        let notesButton = makeMenuButton(title: "📝")
        let newsButton = makeMenuButton(title: "📰")

        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])

        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually

        self.view.addSubview(buttonsSV)

        buttonsSV.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }

    @objc
    private func incrementButtonPressed() {
        value += 1
        
        incrementButton.isUserInteractionEnabled = false
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

        UIView.animate(withDuration: 500) {
            self.updateUI()
            self.updateCommentLabel()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.incrementButton.isUserInteractionEnabled = true
            }
        }
    }
}
