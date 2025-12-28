//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Bruno Madeira on 24/10/2025.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banking
        case CreditCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        //let balance: Decimal
    }
    
    let viewModel: ViewModel? = nil
    
    //MARK: - First part of the cell
    let typeLabel = UILabel()
    let divider = UIView()
    let nameLabel = UILabel()
    
    //MARK: - Second part of the cell
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    static let dividerHeight: CGFloat = 4
    static let dividerWidht: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AccountSummaryCell {
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        
        //MARK: - Second part of the cell setup
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Some balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.attributedText = makeFormattedBalance(
            dollars: "929,466",
            cents: "43"
        )
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(divider)
        contentView.addSubview(nameLabel)
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate(
[
typeLabel.leadingAnchor.constraint (equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
                                     typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
                                     divider.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
                                     divider.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8),
                                     divider.heightAnchor.constraint(equalToConstant: Self.dividerHeight),
                                     divider.widthAnchor.constraint(equalToConstant: Self.dividerWidht),
                                     nameLabel.leadingAnchor.constraint (equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
                                     nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor,multiplier: 2),
                                     balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 0),
                                     balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
                                     trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),
                                     chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
                                     trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
    }
    
    private func makeFormattedBalance(dollars: String, cents: String) -> NSAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .callout),
            .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .footnote),
            .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSMutableAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSMutableAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

extension AccountSummaryCell {
    func configure(with vm: ViewModel) {

        typeLabel.text = vm.accountType.rawValue
        
        switch vm.accountType {
        case .Banking:
            divider.backgroundColor = appColor
            balanceLabel.text = "Current Balance"
            nameLabel.text = vm.accountName
        case .CreditCard:
            divider.backgroundColor = .systemOrange
            balanceLabel.text = "Balance"
            nameLabel.text = vm.accountName
        case .Investment:
            divider.backgroundColor = .systemPurple
            balanceLabel.text = "Value"
            nameLabel.text = vm.accountName
        }
    }
}
