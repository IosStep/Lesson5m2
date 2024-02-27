import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var timer:Timer?
    var maxTime: Float = 30
    var answer: Int = 0
    var complexity = "Easy"
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Math Buster"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .myGreen
        return label
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Easy", "Medium", "Hard"])
        view.selectedSegmentIndex = 0
        view.selectedSegmentTintColor = .myGreen
        view.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], for: .normal)
        view.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        return view
    }()
    
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score:"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .myGreen.withAlphaComponent(0.6)
        return label
    }()
    
    lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🐹"
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.textColor = .myGreen.withAlphaComponent(0.6)
        return label
    }()
    
    lazy var equationLabel: UILabel = {
       let label = UILabel()
        label.text = "equasion"
//        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .myGreen
        return label
    }()
    
    lazy var progressContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .myGreen.withAlphaComponent(0.35)
        return view
    }()
    
    lazy var progressView: UIProgressView = {
       let view = UIProgressView()
        view.progressTintColor = .init(UIColor(red: 79/255, green: 111/255, blue: 82/255, alpha: 1))
        view.setProgress(0.3, animated: true)
        return view
    }()
    
    lazy var restartButton: UIButton = {
       let button = UIButton()
        button.setTitle("Restart", for: .normal)
        button.setTitleColor(.myGreen, for: .normal)
        button.addTarget(self, action: #selector(restartTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myBiege
        startTime()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setUI() {
        view.addSubview(nameLabel)
        view.addSubview(segmentControl)
        view.addSubview(progressContainer)
        view.addSubview(equationLabel)
        view.addSubview(restartButton)
        progressContainer.addSubview(progressView)
        // constraints
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(40)
        }
        
        equationLabel.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(40)
            make.centerX.equalToSuperview().inset(12)
            make.height.equalTo(40)
        }
        
        
        progressContainer.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(90)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.height.equalTo(5)
        }
        
        restartButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(progressContainer.snp.bottom)
            make.height.equalTo(40)
        }

    }
    
    
    func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run), userInfo: nil, repeats: true)
    }
    
    @objc func run() {
        self.maxTime -= 1
//        print(self.maxTime)
        
        if self.maxTime == 1 {
            timer?.invalidate()
        }
        self.progressView.setProgress(Float(self.maxTime/30), animated: true)
    }
    
    @objc func restartTapped() {
        
        if complexity == "easy" {
            let randomSign = ["+", "-", "*", "/"].randomElement()!
            let firstRandom = Int.random(in: 0...9)
            let secondRandom = Int.random(in: 0...9)
            
            equationLabel.text = "\(firstRandom) \(randomSign) \(secondRandom) = "
        }
        
    }
    
    @objc func segmentChanged(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        
        if sender.selectedSegmentIndex == 0 {
            let randomSign = ["+", "-", "*", "/"].randomElement()!
            let firstRandom = Int.random(in: 0...9)
            let secondRandom = Int.random(in: 0...9)
            
            equationLabel.text = "\(firstRandom) \(randomSign) \(secondRandom) = "
        }
        
    }


}


extension UIColor {
    static let myGreen = UIColor(red: 79/255, green: 111/255, blue: 82/255, alpha: 1)
    static let myBiege = UIColor.init(red: 236/255, green: 227/255, blue: 206/255, alpha: 1)
}
