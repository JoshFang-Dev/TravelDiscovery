//
//  RestaurantCarouselView.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-03.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct RestaurantCarouselView:UIViewControllerRepresentable{
    let imageUrlString:[String]
    let selectedIndex:Int
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = RestaurantPVC(imageNames: imageUrlString, selectedIndex: selectedIndex)
        return pvc
    }
    
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

extension RestaurantPVC{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else {return nil}
        if index == 0 {return nil}
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = allControllers.firstIndex(of: viewController) else {return nil}
        if index == allControllers.count - 1 {return nil}
        return allControllers[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        self.selectedIndex
    }
}

class RestaurantPVC:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
   // static let myPVC = CustomPVC(imageNames: ["eiffel_tower","art1","art2"])
    var allControllers:[UIViewController] = []
    var selectedIndex: Int = 0
    
    init(imageNames:[String], selectedIndex:Int){
        self.selectedIndex = selectedIndex
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.orange
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //pages swipe
        allControllers = imageNames.map({ imageName in
            let hostingController =
                UIHostingController(rootView:
                                        ZStack{
                                            Color.black
                                            KFImage(URL(string: imageName))
                                            .resizable()
                                            .scaledToFit()
                                        }
                                        
                    )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        if selectedIndex < allControllers.count{
            setViewControllers([allControllers[selectedIndex]], direction: .forward, animated: true, completion: nil)
        }
        
        self.dataSource = self
        self.delegate = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//struct RestaurantCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantCarouselView()
//    }
//}
