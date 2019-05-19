import UIKit

class ViewController: UITableViewController {
  
  // MARK: - Properties
  private var headerView: UIView!
  private var headerMaskLayer: CAShapeLayer!
  private let items = NewsItem.mockedItems()
  
  // MARK: View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupMaskLayer()
    updateHeaderView()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  // MARK: - UITableView
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?  NewsItemTableViewCell else { return UITableViewCell() }
    cell.configure(with: item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  // MARK: - ScrollView Delegate
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
  
  // MARK: Helpers
  private func setupTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    headerView = tableView.tableHeaderView
    tableView.tableHeaderView = nil
    tableView.addSubview(headerView)
    tableView.contentInset = UIEdgeInsets(top: .kContentInset, left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: -.kContentInset)
  }
  
  private func setupMaskLayer() {
    headerMaskLayer = CAShapeLayer()
    headerMaskLayer.fillColor = UIColor.black.cgColor
    headerView.layer.mask = headerMaskLayer
    
  }
  
  private func updateHeaderView() {
    var headerRect = CGRect(x: 0,
                            y: -.kContentInset,
                            width: tableView.bounds.width,
                            height: .kTableHeaderHeight)
    if tableView.contentOffset.y < -.kContentInset {
      headerRect.origin.y = tableView.contentOffset.y
      headerRect.size.height = -tableView.contentOffset.y + .kTableHeaderCutAwayHeight / 2
    }
    headerView.frame = headerRect
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: headerRect.width, y: 0))
    path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
    path.addLine(to: CGPoint(x: 0, y: headerRect.height - .kTableHeaderCutAwayHeight))
    headerMaskLayer?.path = path.cgPath
  }
}

private extension CGFloat {
  static let kTableHeaderHeight: CGFloat = 300.0
  static let kTableHeaderCutAwayHeight: CGFloat = 40.0
  static var kContentInset: CGFloat {
    return kTableHeaderHeight - kTableHeaderCutAwayHeight / 2
  }
}

