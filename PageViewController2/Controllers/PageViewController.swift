//
//  PageViewController.swift
//  PageViewController2
//
//  Created by aluno on 13/09/19.
//  Copyright © 2019 aluno. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    // MARK - controllers declaration
    lazy var subViewControllers: [UIViewController] = {
        return[
            UIStoryboard(name: "welcome", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController,
            UIStoryboard(name: "welcome", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2,
            UIStoryboard(name: "welcome", bundle: nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        ]
    }()
    // MARK - Setup Page view control
    func nextPageWithIndex(index: Int) {
        setViewControllers([subViewControllers[index]], direction: .forward, animated: true, completion: nil)
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    var pageControl = UIPageControl()
    var buttonControl = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        configurePageControl()
        configureButtonPage()
        
    }
    required init?(coder: NSCoder) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.firstIndex(of: pageContentViewController)!
        
    }
    
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 200,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.action
        self.pageControl.pageIndicatorTintColor = UIColor.second_color
        self.pageControl.currentPageIndicatorTintColor = UIColor.action
        self.view.addSubview(pageControl)
    }
    
    func configureButtonPage() {
        buttonControl = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        view.addSubview(buttonControl)
    }

}

extension UIColor {
    static let action = #colorLiteral(red: 0.3490196078, green: 0.6980392157, blue: 0.8980392157, alpha: 1)
    static let second_color = #colorLiteral(red: 0.6352941176, green: 0.8352941176, blue: 0.9490196078, alpha: 1)
}
