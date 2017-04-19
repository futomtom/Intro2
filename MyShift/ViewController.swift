//
//  ViewController.swift
//  MyShift
//
//  Created by Alex on 4/17/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit
import RazzleDazzle



class ViewController: AnimatedPagingScrollViewController {

    private let minicooper = UIImageView(image: UIImage(named: "mini-cooper"))
    private let porsche = UIImageView(image: UIImage(named: "porsche"))
    private let prius = UIImageView(image: UIImage(named: "prius"))
 /*   private let wheel = UIImageView(image: UIImage(named: "wheel"))
    private let logo = UIImageView(image: UIImage(named: "navigation_bar_logo_white"))
    private let backdrop = UIImageView(image: UIImage(named: "onboarding_backdrop"))
    private let bell = UIImageView(image: UIImage(named: "onboarding_notifications_bell"))
    private let schedule_an_eval = UIImageView(image: UIImage(named: "onboarding_schedule_an_eval"))
    private let your_car_sells = UIImageView(image: UIImage(named: "onboarding_your_car_sells"))
 */
    static var offsetY:CGFloat {
        return min(-30.0, UIScreen.main.bounds.height - 667)
    }


    override func numberOfPages() -> Int {
        // Tell the scroll view how many pages it has
        return 4
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureCars()
        configureAnimations()

    }

    private func configureViews () {
        // Add each of the views to the contentView
        [minicooper,porsche,prius].map( { $0.translatesAutoresizingMaskIntoConstraints = false })

        
        contentView.addSubview(minicooper)
        contentView.addSubview(porsche)
        contentView.addSubview(prius)
  /*      contentView.addSubview(logo)
        contentView.addSubview(wheel)
        contentView.addSubview(backdrop)
        contentView.addSubview(bell)
        contentView.addSubview(schedule_an_eval)
        minicooper.bindFrameToSuperviewBounds()
 */
    }

    override public func viewWillAppear(_ animated: Bool) {

    }

    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

    }



    private func configureAnimations() {
        // Configure all of the animations
        configureScrollView()
    //    configureIFTTTPresents()
        configureCars()
        setupLabels()
        
        animateCurrentFrame()
    }

    private func configureCars() {
        // Keep IFTTTPresents centered on pages 0 and 1, offset 20 pixels down from the top of the view
  //      minicooper.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
   //     minicooper.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -150)
  //      porsche.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
    //    porsche.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
   //     prius.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
     //   prius.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 150)
        
        contentView.layer.borderColor=UIColor.red.cgColor
        contentView.layer.borderWidth=1
        
        
        

        
       
        keepView(minicooper, onPages: [0])
        keepView(porsche, onPages: [0, 1])
        keepView(prius, onPages: [0])

        // Hide IFTTTPresents when we get to page 1
        let cooperPosAnimation = HideAnimation(view: minicooper, hideAt: 1)
        animator.addAnimation(cooperPosAnimation)
        
        
        let porschePosAnimation = TranslationAnimation(view: porsche)
        porschePosAnimation[1] = CGPoint(x: 5, y: 15)
        animator.addAnimation(porschePosAnimation)
        let priusPosAnimation = RotationAnimation(view: prius)
         priusPosAnimation[1] = 90
        animator.addAnimation(priusPosAnimation)
    }
    
    
    func setupLabels() {
        let oneLabel = label(from: "全球精品呈现",
                                  and: "一手掌握全球免税商品动态")
        
        keepView(oneLabel, onPage: 0)
        
        
        let twoLabel = label(from: "航旅带货新体验",
                                  and: "共享行李箱 让出行更有价值")
        
        keepView(twoLabel, onPage: 1)
        
        
        let threeLabel = label(from: "最快物流速度",
                                    and: "72小时全球真人带货 货真价实")
        
        keepView(threeLabel, onPage: 2)
        
        let button = ViewFactory.redButton(title: "一起飞购")
        
        contentView.addSubview(button)
        
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.topAnchor.constraint(equalTo: threeLabel.bottomAnchor, constant: 20)
        button.frame = CGRect(x: 0, y: 0, width: 136, height: 34)
        
        
        keepView(button, onPage: 2)
        
        let bottomLabel = ViewFactory.label(font: .systemFont(ofSize: 12),
                                            textColor: .red)
        
        contentView.addSubview(bottomLabel)
        
        bottomLabel.text = "FlyGO © izhiyou.com"
        bottomLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
    
        
        keepView(bottomLabel, onPages: [-1, 0, 1, 2, 3])
    }


    private func configureScrollView() {
        // Let's change the background color of the scroll view from dark gray to light gray to blue
        let backgroundColorAnimation = BackgroundColorAnimation(view: scrollView)
        backgroundColorAnimation[0] = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        backgroundColorAnimation[0.5] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[0.99] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[1] = UIColor.red //UIColor(red: 0.14, green: 0.8, blue: 1, alpha: 1)
         backgroundColorAnimation[2] = UIColor.gray //UIColor(red: 0.14, green: 0.8, blue: 1, alpha: 1)
         backgroundColorAnimation[3] = UIColor.yellow //UIColor(red: 0.14, green: 0.8, blue: 1, alpha: 1)
        
        animator.addAnimation(backgroundColorAnimation)
    }
    
    
    private func label(from title:String, and subTitle:String) -> UILabel {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.backgroundColor = .white
        
        
        let titleAttributedString = NSMutableAttributedString(string: title + "\n" , font: .systemFont(ofSize: 18),
                                                              textColor: .red,
                                                              lineSpace: 10,
                                                              alignment: .center)
        
        titleAttributedString.append(NSAttributedString(string: subTitle,
                                                        font: .systemFont(ofSize: 12),
                                                        textColor: .gray))
        
        label.attributedText = titleAttributedString
        
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 180 + ViewController.offsetY)
        
        return label
    }


    /*
    private func configureCars() {
        
        NSLayoutConstraint(item: logo, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 20).isActive = true
        keepView(logo, onPages: [0, 1])

        // Hide IFTTTPresents when we get to page 1
        let logoPosAnimation = TranslationAnimation(view: logo)
        animator.addAnimation(logoPosAnimation)
    }
*/

}

