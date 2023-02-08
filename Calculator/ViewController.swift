//
//  ViewController.swift
//  Calculator
//
//  Created by đào sơn on 08/02/2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var displayContainerView: UIView!
    @IBOutlet private weak var cursorView: UIView!

    @IBOutlet private weak var calculatorStackView: UIStackView!
    @IBOutlet private weak var row1StackView: UIStackView!
    @IBOutlet private weak var row2StackView: UIStackView!
    @IBOutlet private weak var row3StackView: UIStackView!
    @IBOutlet private weak var row4StackView: UIStackView!
    @IBOutlet private weak var screenStackView: UIStackView!

    @IBOutlet private weak var displayLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    // MARK: - Variables
    private var workings = ""

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }

    // MARK: - Config
    private func config() {
        self.configUI()
    }

    private func configUI() {
        self.addKeyboardBorder(color: UIColor.gray.withAlphaComponent(0.1).cgColor, width: 0.5)
        self.addOpacityAnimationForCursorView()
    }

    private func addKeyboardBorder(color: CGColor, width: CGFloat) {
        self.calculatorStackView.layer.borderColor = color
        self.calculatorStackView.layer.borderWidth = width
        self.calculatorStackView.subviews.map { subview in
            subview.layer.borderColor = color
            subview.layer.borderWidth = width
        }

        self.row1StackView.layer.borderColor = color
        self.row1StackView.layer.borderWidth = width
        self.row1StackView.subviews.map { subview in
            subview.layer.borderColor = color
            subview.layer.borderWidth = width
        }

        self.row2StackView.layer.borderColor = color
        self.row2StackView.layer.borderWidth = width
        self.row2StackView.subviews.map { subview in
            subview.layer.borderColor = color
            subview.layer.borderWidth = width
        }

        self.row3StackView.layer.borderColor = color
        self.row3StackView.layer.borderWidth = width
        self.row3StackView.subviews.map { subview in
            subview.layer.borderColor = color
            subview.layer.borderWidth = width
        }

        self.row4StackView.layer.borderColor = color
        self.row4StackView.layer.borderWidth = width
        self.row4StackView.subviews.map { subview in
            subview.layer.borderColor = color
            subview.layer.borderWidth = width
        }
    }

    func addOpacityAnimationForCursorView() {
        let key = "opacity"
        let animation = CABasicAnimation(keyPath: key)
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 0.7
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.autoreverses = true
        animation.repeatCount = Float.greatestFiniteMagnitude
        self.cursorView.layer.add(animation, forKey: key)
    }

    // MARK: - Helper
    private func addSymbolToWorkings(value: String) {
        self.workings += value
        self.displayLabel.text = self.workings
    }

    private func clearAll() {
        self.workings = ""
        self.displayLabel.text = ""
        self.resultLabel.text = ""
    }

    private func formatInput(input: String) -> String {
        return input.replacingOccurrences(of: "x", with: "*").replacingOccurrences(of: "÷", with: "/")
    }

    private func isInputValidToCalculate() -> Bool {
        return true
    }

    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }

    // MARK: - Action
    @IBAction func didTapDeleteAll(_ sender: UIButton) {
        self.clearAll()
    }

    @IBAction func didTapDelete(_ sender: UIButton) {
        if !self.workings.isEmpty {
            self.workings.removeLast()
            self.displayLabel.text = workings
        }
    }

    @IBAction func didTapDivide(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "÷")
    }

    @IBAction func didTapPlus(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "+")
    }

    @IBAction func didTapMinus(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "-")
    }

    @IBAction func didTapMutiply(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "x")
    }

    @IBAction func didTapDot(_ sender: UIButton) {
        self.addSymbolToWorkings(value: ".")
    }

    @IBAction func didTapNumber0(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "0")
    }

    @IBAction func didTapNumber1(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "1")
    }

    @IBAction func didTapNumber2(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "2")
    }

    @IBAction func didTapNumber3(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "3")
    }

    @IBAction func didTapNumber4(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "4")
    }

    @IBAction func didTapNumber5(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "5")
    }

    @IBAction func didTapNumber6(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "6")
    }

    @IBAction func didTapNumber7(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "7")
    }

    @IBAction func didTapNumber8(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "8")
    }

    @IBAction func didTapNumber9(_ sender: UIButton) {
        self.addSymbolToWorkings(value: "9")
    }

    @IBAction func didTapEqual(_ sender: UIButton) {
        let expression = NSExpression(format: formatInput(input: self.workings))
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        self.resultLabel.text = resultString
    }
}
