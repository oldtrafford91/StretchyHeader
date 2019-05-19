import UIKit

class NewsItemTableViewCell: UITableViewCell {
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  
  func configure(with item: NewsItem) {
    categoryLabel.text = item.category.toString()
    categoryLabel.textColor = item.category.toColor()
    summaryLabel.text = item.summary
  }
  
  
}
