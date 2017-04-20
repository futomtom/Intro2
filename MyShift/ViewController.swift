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
    private let wheel1 = UIImageView(image: UIImage(named: "wheel"))
    private let wheel2 = UIImageView(image: UIImage(named: "wheel"))
    private let logo = UIImageView(image: UIImage(named: "navigation_bar_logo_white"))
    private let logo2 = UIImageView(image: UIImage(named: "navigation_bar_logo_white"))
    private let house = UIImageView(image: UIImage(named: "onboarding_backdrop"))
 /*   private let bell = UIImageView(image: UIImage(named: "onboarding_notifications_bell"))
    private let schedule_an_eval = UIImageView(image: UIImage(named: "onboarding_schedule_an_eval"))
    private let your_car_sells = UIImageView(image: UIImage(named: "onboarding_your_car_sells"))
 */
    var screenHigh = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    static var offsetY: CGFloat {
        return min(-30.0, UIScreen.main.bounds.height - 667)
    }


    override func numberOfPages() -> Int {
        // Tell the scroll view how many pages it has
        return 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        LaunchScreenAnimation()
        configureViews()

        configureAnimations()

    }
    
    func LaunchScreenAnimation() {
        let launchViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "launchScreenStoryboardID")
        if let launchView = launchViewController.view {
            self.view.addSubview(launchView)
            
            UIView.animate(withDuration: 1, delay: 0.0, options: [.curveLinear], animations: {
                
                
                launchView.transform = launchView.transform.translatedBy(x: self.screenWidth, y: 0)
                
            }) { (finished) in
                launchView.removeFromSuperview()
            }
            
        } else {
            print("Cannot get launch screen.")
        }
    }


    private func configureViews () {
        // Add each of the views to the contentView
        [minicooper, porsche, prius].map( { $0.translatesAutoresizingMaskIntoConstraints = false })


        contentView.addSubview(minicooper)
        contentView.addSubview(porsche)
        contentView.addSubview(prius)
        contentView.addSubview(wheel1)
        contentView.addSubview(wheel2)
        contentView.addSubview(logo)
        contentView.addSubview(logo2)
        contentView.addSubview(house)
        setupLabels()

        /*
         contentView.addSubview(backdrop)
        contentView.addSubview(bell)
        contentView.addSubview(schedule_an_eval)
        minicooper.bindFrameToSuperviewBounds()
 */
    }

    private func configureAnimations() {
        // Configure all of the animations
        configureScrollView()
        //    configureIFTTTPresents()
        configurePage0()
        configurePage1()
        configurePage2()

        animateCurrentFrame()
    }

    private func configureScrollView() {
        // Let's change the background color of the scroll view from dark gray to light gray to blue
        let backgroundColorAnimation = BackgroundColorAnimation(view: scrollView)
        backgroundColorAnimation[0] = UIColor.black
        backgroundColorAnimation[0.3] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[0.8] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[1] = UIColor.black
        backgroundColorAnimation[1.3] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[1.8] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[2] = UIColor.black //UIColor(red: 0.14, green: 0.8, blue: 1, alpha: 1)
        backgroundColorAnimation[2.3] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        backgroundColorAnimation[2.8] = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
     

        animator.addAnimation(backgroundColorAnimation)
    }

    private func configurePage0() {
        logo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        logo2.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        keepView(logo, onPages: [0, 1])
        keepView(logo2, onPages: [1,2, 3])
     
        let logoHideAnimation = HideAnimation(view: logo,hideAt: 1)
        
        animator.addAnimation(logoHideAnimation)
        let logo2ShowAnimation = HideAnimation(view: logo2, showAt: 1)
        animator.addAnimation(logo2ShowAnimation)

        let logoScaleAnimation = ScaleAnimation(view: logo)
        logoScaleAnimation.addKeyframe(0, value: 2, easing: EasingFunctionEaseInQuad)
        logoScaleAnimation[1] = 1
        animator.addAnimation(logoScaleAnimation)

        let logoMoveAnimation = TranslationAnimation(view: logo)
        logoMoveAnimation[0] = CGPoint(x: 0, y: 0)
        let yPos = screenHigh/2  - 50
        logoMoveAnimation[1] = CGPoint(x: 0, y: -yPos)
        //    logoMoveAnimation[1] = .zero
        animator.addAnimation(logoMoveAnimation)


    }


    private func configurePage1() {
        // Keep IFTTTPresents centered on pages 0 and 1, offset 20 pixels down from the top of the view

        minicooper.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -150).isActive = true

        porsche.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true

        wheel1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 35).isActive = true

        wheel2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 35).isActive = true
        prius.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 150).isActive = true

        keepView(minicooper, onPages: [1])
        keepView(porsche, onPages: [1])
        keepView(prius, onPages: [1])
        keepView(wheel1, onPages: [1.1])
        keepView(wheel2, onPages: [0.9])

        // Hide IFTTTPresents when we get to page 1
        let cooperPosAnimation = AlphaAnimation(view: minicooper)
        cooperPosAnimation[1] = 1
        cooperPosAnimation[1.3] = 0
        animator.addAnimation(cooperPosAnimation)

        let porschePosAnimation = TranslationAnimation(view: porsche)
        porschePosAnimation[1] = CGPoint(x: 0, y: 0)
        porschePosAnimation[1.8] = CGPoint(x: 260, y: 0)
        animator.addAnimation(porschePosAnimation)


        let wheel1PosAnimation = TranslationAnimation(view: wheel1)
        wheel1PosAnimation[1] = CGPoint(x: 0, y: 0)
        wheel1PosAnimation[1.8] = CGPoint(x: 260, y: 0)
        animator.addAnimation(wheel1PosAnimation)

        let wheel1RotateAnimation = RotationAnimation(view: wheel1)
        wheel1RotateAnimation[1] = 0
        wheel1RotateAnimation[1.8] = 360
        animator.addAnimation(wheel1RotateAnimation)

        let wheel2PosAnimation = TranslationAnimation(view: wheel2)
        wheel2PosAnimation[1] = CGPoint(x: 0, y: 0)
        wheel2PosAnimation[1.8] = CGPoint(x: 260, y: 0)
        animator.addAnimation(wheel2PosAnimation)

        let wheel2RotateAnimation = RotationAnimation(view: wheel2)
        wheel2RotateAnimation[1] = 0
        wheel2RotateAnimation[1.8] = 360
        animator.addAnimation(wheel2RotateAnimation)

        let priusPosAnimation = AlphaAnimation(view: prius)
        priusPosAnimation[1] = 1
        priusPosAnimation[1.4] = 0
        animator.addAnimation(priusPosAnimation)
    }
    
    func configurePage2() {
        
         house.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
         keepView(house, onPages: [2])
    }





    func setupLabels() {
        let oneLabel = label(from: "The new way",and: "to buy and sell cars")
        keepView(oneLabel, onPage: 0)

        let twoLabel = label(from: "Browse great cars near you",and: "")
        keepView(twoLabel, onPage: 1)

        let threeLabel = label(from: "You find the car,", and: "we'll diliver the test driver")
        keepView(threeLabel, onPage: 2)
        
        let button = ViewFactory.grayButton(title: "Start")
        
        button.frame = CGRect(x: 0, y: 0, width: 136, height: 34)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        contentView.addSubview(button)
        button.topAnchor.constraint(equalTo: threeLabel.bottomAnchor, constant: 120).isActive = true
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let buttonAnimation = AlphaAnimation(view: button)
        buttonAnimation[1.5] = 0
        buttonAnimation[2] = 1
        animator.addAnimation(buttonAnimation)
        
        let buttonPosAnimation = TranslationAnimation(view: button)
        buttonPosAnimation[1] = CGPoint(x: 0, y: 0)
        buttonPosAnimation[2] = CGPoint(x: 0, y: -100)
        animator.addAnimation(buttonPosAnimation)


        
        
        keepView(button, onPage: 2)
 

        let bottomLabel = ViewFactory.label(font: .systemFont(ofSize: 12),
                                            textColor: .yellow)

        contentView.addSubview(bottomLabel)

        bottomLabel.text = "Demo©shihHua.com"
        bottomLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true


        keepView(bottomLabel, onPages: [-1, 0, 1, 2])
    }




    private func label(from title: String, and subTitle: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 2
        label.backgroundColor = .clear


        let titleAttributedString = NSMutableAttributedString(string: title + "\n", font: .systemFont(ofSize: 18),
                                                              textColor: .white,
                                                              lineSpace: 10,
                                                              alignment: .center)

        titleAttributedString.append(NSAttributedString(string: subTitle,
                                                        font: .systemFont(ofSize: 12),
                                                        textColor: .white))

        label.attributedText = titleAttributedString

        contentView.addSubview(label)

        label.topAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 90 ).isActive = true

        return label
    }



}

