//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Yilei Huang on 2020-12-01.
//  Copyright © 2020 Joshua Fang. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct DestinationHeaderContainer:UIViewControllerRepresentable{
    let imageUrlString:[String]
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPVC(imageNames: imageUrlString)
        return pvc
    }
    
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

extension CustomPVC{
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
        0
    }
}

class CustomPVC:UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
   // static let myPVC = CustomPVC(imageNames: ["eiffel_tower","art1","art2"])
    var allControllers:[UIViewController] = []
    
    init(imageNames:[String]){
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.orange
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //pages swipe
        allControllers = imageNames.map({ imageName in
            let hostingController =
                UIHostingController(rootView:
                                        KFImage(URL(string: imageName))
                                        .resizable()
                                        .scaledToFill()
                    )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        
        if let first = allControllers.first{
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        
        self.dataSource = self
        self.delegate = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static let imageUrlString = ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5",
                                 "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
                                 "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
                                 "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"]
    static var previews: some View {
        DestinationHeaderContainer(imageUrlString: imageUrlString)
            .frame(height:HEIGHTSPACE*10)
        NavigationView{
            PopularDestinationDetailsView(destination: .init(name: "Parius", country: "France", imageName: "eiffel_tower", info: "", latitude:48.86064473141706, longitude:2.297619224300003, attraction: [Attraction]()))
        }
        
    }
}
