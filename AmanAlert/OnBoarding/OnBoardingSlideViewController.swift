
import Foundation
import UIKit

class OnBoardingSlideViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    public lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "blueButtonColor")
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var pages = [UIViewController]()
    public let pageControl = UIPageControl()
    let initialPage = 0
    
    override func viewDidLoad() {
        setUp()
        style()
        configure()
        setUpConstraints()
        
    }
}

extension OnBoardingSlideViewController {
    
    func setUpConstraints() {
        startButton.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints{
            $0.bottom.equalTo(startButton.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setUp() {
        dataSource = self
        delegate = self
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        let page1 = OnBoardingController(image: "ic_onboarding_1", label: "Приложение создано \nдля защиты женщи", desc: "Кыргызстан признан небезопасным для \nженщин государством")
        
        let page2 = OnBoardingController(image:"ic_onboarding_2" , label: "В борьбе каждый должен начинать с себя", desc: "С начала 2022 года зарегистрировано 7 \nтысяч 665 случаев семейного насилия")
        
        let page3 = OnBoardingController(image: "ic_onboarding_3", label: "Если Вы попали в трудную жизненную ситуацию", desc: "Обратиться в социальные службы или можете заполнить анкету, наши специалисты свяжутся с вами")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
    
    func style() {
        pageControl.currentPageIndicatorTintColor = UIColor(named: "blueButtonColor")
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func configure() {
        view.addSubview(pageControl)
        view.addSubview(startButton)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}
