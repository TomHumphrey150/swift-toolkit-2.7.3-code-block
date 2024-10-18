//
//  Copyright 2024 Readium Foundation. All rights reserved.
//  Use of this source code is governed by the BSD-style license
//  available in the top-level LICENSE file of the project.
//

@testable import R2Shared
import XCTest

class HTMLResourceContentIteratorTest: XCTestCase {
    private let link = Link(href: "/dir/res.xhtml", type: "application/xhtml+xml")
    private let locator = Locator(href: "/dir/res.xhtml", type: "application/xhtml+xml")

    private let html = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops" lang="en">
        <head>
            <title>Section IV: FAIRY STORIES—MODERN FANTASTIC TALES</title>
            <link href="css/epub.css" type="text/css" rel="stylesheet" />
        </head>
        <body>
             <section id="pgepubid00498">
                 <div class="center"><span epub:type="pagebreak" title="171" id="Page_171">171</span></div>
                 <h3>INTRODUCTORY</h3>

                 <p>The difficulties of classification are very apparent here, and once more it must be noted that illustrative and practical purposes rather than logical ones are served by the arrangement adopted. The modern fanciful story is here placed next to the real folk story instead of after all the groups of folk products. The Hebrew stories at the beginning belong quite as well, perhaps even better, in Section V, while the stories at the end of Section VI shade off into the more modern types of short tales.</p>
                 <p><span>The child's natural literature.</span> The world has lost certain secrets as the price of an advancing civilization.</p>
                 <p>Without discussing the limits of the culture-epoch theory of human development as a complete guide in education, it is clear that the young child passes through a period when his mind looks out upon the world in a manner analogous to that of the folk as expressed in their literature.</p>
            </section>
        </body>
    </html>
    """

    private lazy var elements: [AnyEquatableContentElement] = [
        TextContentElement(
            locator: locator(
                progression: 0.0,
                selector: "#pgepubid00498 > div.center",
                before: nil,
                highlight: "171"
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.0,
                        selector: "#pgepubid00498 > div.center",
                        before: nil,
                        highlight: "171"
                    ),
                    text: "171",
                    attributes: [ContentAttribute(key: .language, value: Language("en"))]
                ),
            ]
        ).equatable(),
        TextContentElement(
            locator: locator(
                progression: 0.2,
                selector: "#pgepubid00498 > h3",
                before: "171",
                highlight: "INTRODUCTORY"
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.2,
                        selector: "#pgepubid00498 > h3",
                        before: "171",
                        highlight: "INTRODUCTORY"
                    ),
                    text: "INTRODUCTORY",
                    attributes: [ContentAttribute(key: .language, value: Language("en"))]
                ),
            ]
        ).equatable(),
        TextContentElement(
            locator: locator(
                progression: 0.4,
                selector: "#pgepubid00498 > p:nth-child(3)",
                before: "171INTRODUCTORY",
                highlight: "The difficulties of classification are very apparent here, and once more it must be noted that illustrative and practical purposes rather than logical ones are served by the arrangement adopted. The modern fanciful story is here placed next to the real folk story instead of after all the groups of folk products. The Hebrew stories at the beginning belong quite as well, perhaps even better, in Section V, while the stories at the end of Section VI shade off into the more modern types of short tales."
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.4,
                        selector: "#pgepubid00498 > p:nth-child(3)",
                        before: "171INTRODUCTORY",
                        highlight: "The difficulties of classification are very apparent here, and once more it must be noted that illustrative and practical purposes rather than logical ones are served by the arrangement adopted. The modern fanciful story is here placed next to the real folk story instead of after all the groups of folk products. The Hebrew stories at the beginning belong quite as well, perhaps even better, in Section V, while the stories at the end of Section VI shade off into the more modern types of short tales."
                    ),
                    text: "The difficulties of classification are very apparent here, and once more it must be noted that illustrative and practical purposes rather than logical ones are served by the arrangement adopted. The modern fanciful story is here placed next to the real folk story instead of after all the groups of folk products. The Hebrew stories at the beginning belong quite as well, perhaps even better, in Section V, while the stories at the end of Section VI shade off into the more modern types of short tales.",
                    attributes: [ContentAttribute(key: .language, value: Language("en"))]
                ),
            ]
        ).equatable(),
        TextContentElement(
            locator: locator(
                progression: 0.6,
                selector: "#pgepubid00498 > p:nth-child(4)",
                before: "ade off into the more modern types of short tales.",
                highlight: "The child's natural literature. The world has lost certain secrets as the price of an advancing civilization."
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.6,
                        selector: "#pgepubid00498 > p:nth-child(4)",
                        before: "ade off into the more modern types of short tales.",
                        highlight: "The child's natural literature. The world has lost certain secrets as the price of an advancing civilization."
                    ),
                    text: "The child's natural literature. The world has lost certain secrets as the price of an advancing civilization.",
                    attributes: [ContentAttribute(key: .language, value: Language("en"))]
                ),
            ]
        ).equatable(),
        TextContentElement(
            locator: locator(
                progression: 0.8,
                selector: "#pgepubid00498 > p:nth-child(5)",
                before: "secrets as the price of an advancing civilization.",
                highlight: "Without discussing the limits of the culture-epoch theory of human development as a complete guide in education, it is clear that the young child passes through a period when his mind looks out upon the world in a manner analogous to that of the folk as expressed in their literature."
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.8,
                        selector: "#pgepubid00498 > p:nth-child(5)",
                        before: "secrets as the price of an advancing civilization.",
                        highlight: "Without discussing the limits of the culture-epoch theory of human development as a complete guide in education, it is clear that the young child passes through a period when his mind looks out upon the world in a manner analogous to that of the folk as expressed in their literature."
                    ),
                    text: "Without discussing the limits of the culture-epoch theory of human development as a complete guide in education, it is clear that the young child passes through a period when his mind looks out upon the world in a manner analogous to that of the folk as expressed in their literature.",
                    attributes: [ContentAttribute(key: .language, value: Language("en"))]
                ),
            ]
        ).equatable(),
    ]

    private func locator(
        progression: Double? = nil,
        selector: String? = nil,
        before: String? = nil,
        highlight: String? = nil,
        after: String? = nil
    ) -> Locator {
        locator.copy(
            locations: {
                $0.progression = progression
                if let selector = selector {
                    $0.otherLocations = ["cssSelector": selector]
                }
            },
            text: {
                $0.after = after
                $0.before = before
                $0.highlight = highlight
            }
        )
    }

    private func iterator(
        _ html: String,
        start startLocator: Locator? = nil,
        totalProgressionRange: ClosedRange<Double>? = nil
    ) -> HTMLResourceContentIterator {
        HTMLResourceContentIterator(
            resource: DataResource(link: link, string: html),
            totalProgressionRange: totalProgressionRange,
            locator: startLocator ?? locator()
        )
    }
    
    // MARK: - New Test Method for Code Elements Preserving Whitespace
    
    private let codeHtml = """
        <div class="code"><div class="line" style="padding-left:0.0em;margin-left:1.5em;text-indent:-1.5em;"><span class="kd">extension</span> <span class="nc">GPSTrack</span> <span class="p">{</span>
        </div><div class="line" style="padding-left:1.5em;margin-left:1.5em;text-indent:-1.5em;"><span class="c1">/// Returns all the timestamps for the GPS track.</span>
        </div><div class="line" style="padding-left:1.5em;margin-left:1.5em;text-indent:-1.5em;"><span class="c1">/// - Complexity: O(*n*), where *n* is the number of points recorded.</span>
        </div><div class="line" style="padding-left:1.5em;margin-left:1.5em;text-indent:-1.5em;"><span class="kd">var</span> <span class="nv">timestamps</span><span class="p">:</span> <span class="p">[</span><span class="n">Date</span><span class="p">]</span> <span class="p">{</span>
        </div><div class="line" style="padding-left:3.0em;margin-left:1.5em;text-indent:-1.5em;"><span class="k">return</span> <span class="n">record</span><span class="p">.</span><span class="bp">map</span> <span class="p">{</span> <span class="nv">$0</span><span class="p">.</span><span class="mi">1</span> <span class="p">}</span>
        </div><div class="line" style="padding-left:1.5em;margin-left:1.5em;text-indent:-1.5em;"><span class="p">}</span>
        </div><div class="line" style="padding-left:0.0em;margin-left:1.5em;text-indent:-1.5em;"><span class="p">}</span>
        </div></div>
        """
    
    private let codeEdgeCase2Html = """
        <p>And: </p>
        <pre><code><span class="token keyword">struct</span> <span class="token builtin">MenuItem</span><span class="token punctuation">:</span> <span class="token builtin">Codable</span><span class="token punctuation">,</span> <span class="token builtin">Equatable</span><span class="token punctuation">,</span> <span class="token builtin">Identifiable</span> <span class="token punctuation">{</span></code></pre>
        <p>If you run the code now you’ll see twelve rows containing “Hello World” – something you might not have expected.</p>
        """
    
    private let chapterSectionEdgeCaseHtml = """
        <?xml version='1.0' encoding='utf-8'?>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
          <head>
            <title>Preface</title>
            <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
            <meta content="" name="description"/>
            <meta content="GitBook 3.2.3" name="generator"/>
            <meta content="" name="keywords"/>
            <meta content="https://www.appcoda.com/swift" property="og:url"/>
            <meta content="website" property="og:type"/>
            <meta content="Mastering SwiftUI for iOS 18 and Xcode 16" property="og:title"/>
            <meta content="Deep dive into SwiftUI and Build fluid UI with it" property="og:description"/>
            <meta content="https://www.appcoda.com/learnswift/images/preface/swift-book-hand.png" property="og:image"/>
            <meta content="Simon Ng" name="author"/>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
          <link href="stylesheet.css" rel="stylesheet" type="text/css"/>
        <link href="page_styles.css" rel="stylesheet" type="text/css"/>
        </head>
          <body class="calibre">
                
        <div class="page">
            
                <h1 class="book-chapter" id="calibre_toc_1">Preface</h1>
                <div class="section" id="README.md">
                    <p class="calibre7"><img src="preface-cover.png" alt="" class="calibre8"/></p>
                    <p class="calibre7"></p><div class="calibre9"></div>
                    Copyright ©2024 by AppCoda Limited<p class="calibre7"></p>
                    <p class="calibre7">All right reserved. No part of this book may be used or reproduced, stored or transmitted in any manner whatsoever without written permission from the publisher.</p>
                    <p class="calibre7">Published by AppCoda Limited</p>
                    <p class="calibre7"></p><div class="calibre9"></div><p class="calibre7"></p>
                    <h1 id="preface" class="calibre10">Preface</h1>
                    <p class="calibre7">Frankly, I didn't expect Apple would announce anything big in WWDC 2019 that would completely change the way we build UI for Apple platforms. A couple years ago, Apple released a brand new framework called <em class="calibre11">SwiftUI</em>, along with the release of Xcode 11. The debut of SwiftUI was huge, really huge for existing iOS developers or someone who is going to learn iOS app building. It was unarguably the biggest change in iOS app development in recent years. </p>
                    <p class="calibre7">I have been doing iOS programming for over 10 years and already get used to developing UIs with UIKit. I love to use a mix of storyboards and Swift code for building UIs. However, whether you prefer to use Interface Builder or create UI entirely using code, the approach of UI development on iOS doesn't change much. Everything is still relying on the UIKit framework. </p>
                    <p class="calibre7">To me, SwiftUI is not merely a new framework. It's a paradigm shift that fundamentally changes the way you think about UI development on iOS and other Apple platforms. Instead of using the imperative programming style, Apple now advocates the declarative/functional programming style. Instead of specifying exactly how a UI component should be laid out and function, you focus on describing what elements you need in building the UI and what the actions should perform when programming in declarative style. </p>
                    <p class="calibre7">If you have worked with React Native or Flutter before, you will find some similarities between the programming styles and probably find it easier to build UIs in SwiftUI. That said, even if you haven't developed in any functional programming languages before, it would just take you some time to get used to the syntax. Once you manage the basics, you will love the simplicity of coding complex layouts and animations in SwiftUI.</p>
                    <p class="calibre7">SwiftUI has evolved so much in these five years. Apple has packed even more features and brought more UI components to the SwiftUI framework, which comes alongside with Xcode 16. It just takes UI development on iOS, iPadOS, and macOS to the next level. You can develop some fancy animations with way less code, as compared to UIKit. Most importantly, the latest version of the SwiftUI framework makes it easier for developers to develop apps for Apple platforms. You will understand what I mean after you go through the book.</p>
                    <p class="calibre7">The release of SwiftUI doesn't mean that Interface Builder and UIKit are deprecated right away. They will still stay for many years to come. However, SwiftUI is the future of app development on Apple's platforms. To stay at the forefront of technological innovations, it's time to prepare yourself for this new way of UI development. And I hope this book will help you get started with SwiftUI development and build some amazing UIs.</p>
                    <p class="calibre7">Simon Ng<br class="calibre12"/>
                    Founder of AppCoda</p>
                    <p class="calibre7"></p><div class="calibre9"></div><p class="calibre7"></p>
                    <h2 id="what-you-will-learn-in-this-book" class="calibre13">What You Will Learn in This Book</h2>
                    <p class="calibre7">We will dive deep into the SwiftUI framework, teaching you how to work with various UI elements, and build different types of UIs. After going through the basics and understanding the usage of common components, we will put together with all the materials you've learned and build a complete app.</p>
                    <p class="calibre7">As always, we will explore SwiftUI with you by using the "Learn by doing" approach. This new book features a lot of hands-on exercises and projects. Don't expect you can just read the book and understand everything. You need to get prepared to write code and debug.</p>
                    <h3 id="audience" class="calibre14">Audience</h3>
                    <p class="calibre7">This book is written for both beginners and developers with some iOS programming experience. Even if you have developed an iOS app before, this book will help you understand this brand-new framework and the new way to develop UI. You will also learn how to integrate UIKit with SwiftUI.</p>
                    <p class="calibre7"></p><div class="calibre9"></div><p class="calibre7"></p>
                    <h2 id="what-you-need-to-develop-apps-with-swiftui" class="calibre13">What You Need to Develop Apps with SwiftUI</h2>
                    <p class="calibre7">Having a Mac is the basic requirement for iOS development. To use SwiftUI, you need to have a Mac installed with macOS Catalina and Xcode 11 (or up). That said, to properly follow the content of this book, you are required to have Xcode 16 installed.</p>
                    <p class="calibre7">If you are new to iOS app development, Xcode is an integrated development environment (IDE) provided by Apple. Xcode provides everything you need to kick start your app development. It already bundles the latest version of the iOS SDK (short for Software Development Kit), a built-in source code editor, graphic user interface (UI) editor, debugging tools and much more. Most importantly, Xcode comes with an iPhone (and iPad) simulator so you can test your app without the real devices. With Xcode 16, you can instantly preview the result of your SwiftUI code and test it on the fly.</p>
                    <h4 id="installing-xcode" class="calibre14">Installing Xcode</h4>
                    <p class="calibre7">To install Xcode, go up to the Mac App Store and download it. Simply search "Xcode" and click the "Get" button to download it. At the time of this writing, the latest official version of Xcode is 16.0. Once you complete the installation process, you will find Xcode in the Launchpad.</p>
                    <p class="calibre7"><img src="preface-1.png" alt="" class="calibre8"/></p>
                    <p class="calibre7"></p><div class="calibre9"></div><p class="calibre7"></p>
                    <h3 id="frequestly-asked-questions-about-swiftui" class="calibre14">Frequestly Asked Questions about SwiftUI</h3>
                    <p class="calibre7">I got quite a lot of questions from new comers when the SwiftUI framework was first announced. These questions are some of the common ones that I want to share with you. And I hope the answers will give you a better idea about SwiftUI.</p>
                    <ol class="calibre2">
                    <li class="calibre15"><p class="calibre7"><strong class="calibre16"><em class="calibre11">Do I need to learn Swift before learning SwiftUI?</em></strong></p>
                    <p class="calibre7">Yes, you still need to know the Swift programming language before using SwiftUI. SwiftUI is just a UI framework written in Swift. Here, the keyword is UI, meaning that the framework is designed for building user interfaces. However, for a complete application, other than UI, there are many other components such as network components for connecting to remote server, data components for loading data from internal database, business logic component for handling the flow of data, etc. All these components are not built using SwiftUI. So, you should be knowledgeable about Swift and SwiftUI, as well as, other built-in frameworks (e.g. Map) in order to build an app. </p>
                    </li>
                    <li class="calibre15"><p class="calibre7"><strong class="calibre16"><em class="calibre11">Should I learn SwiftUI or UIKit?</em></strong></p>
                    <p class="calibre7">The short answer is Both. That said, it all depends on your goals. If you target to become a professional iOS developer and apply for a job in iOS development, you better equip yourself with knowledge of SwiftUI and UIKit. Over 90% of the apps published on the App Store were built using UIKit. To be considered for hire, you should be very knowledgeable with UIKit because most companies are still using the framework to build the app UI. However, like any technological advancement, companies will gradually adopt SwiftUI in new projects. This is why you need to learn both to increase your employment opportunities. </p>
                    <p class="calibre7">On the other hand, if you just want to develop an app for your personal or side project, you can develop it entirely using SwiftUI. However, since SwiftUI is very new, it doesn't cover all the UI components that you can find in UIKit. In some cases, you may also need to integrate UIKit with SwiftUI.</p>
                    </li>
                    <li class="calibre15"><p class="calibre7"><strong class="calibre16"><em class="calibre11">Do I need to learn auto layout?</em></strong></p>
                    <p class="calibre7">This may be a good news to some of you. Many beginners find it hard to work with auto layout. With SwiftUI, you no longer need to define layout constraints. Instead, you use stacks, spacers, and padding to arrange the layout.</p>
                    </li>
                    </ol>

                </div>
            
        </div>
        </body></html>
        """
    
    private lazy var expectedCodeElements: [AnyEquatableContentElement] = [AnyEquatableContentElement]()
    
    func testIteratingOverCodeElementsPreservingWhitespace() throws {
        // Initialize the iterator with the code HTML
        let iter = iterator(chapterSectionEdgeCaseHtml)
        
        var miniTextElements = [ContentElement]()
        
        while let element = try iter.next() {
            
            guard let textElement = element as? TextContentElement else {
                continue
            }
            let text = textElement.text
            let role = textElement.role
            miniTextElements.append(textElement)
        }
        
        print(miniTextElements)
        
        // Iterate through the expected elements and verify each one
        for expectedElement in expectedCodeElements {
            let actualElement = try iter.next()
            XCTAssertNotNil(actualElement, "Expected an element but got nil")
            XCTAssertEqual(expectedElement, actualElement?.equatable(), "Elements do not match")
        }
        
        // Ensure that there are no additional elements
        XCTAssertNil(try iter.next(), "Expected no more elements, but found some")
    }
    
    func testIterateFromStartToFinish() throws {
        let iter = iterator(html)
        XCTAssertEqual(elements[0], try iter.next()?.equatable())
        XCTAssertEqual(elements[1], try iter.next()?.equatable())
        XCTAssertEqual(elements[2], try iter.next()?.equatable())
        XCTAssertEqual(elements[3], try iter.next()?.equatable())
        XCTAssertEqual(elements[4], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testPreviousIsNullFromTheBeginning() {
        let iter = iterator(html)
        XCTAssertNil(try iter.previous())
    }

    func testNextReturnsTheFirstElementFromTheBeginning() {
        let iter = iterator(html)
        XCTAssertEqual(elements[0], try iter.next()?.equatable())
    }

    func testNextThenPreviousReturnsNull() {
        let iter = iterator(html)
        XCTAssertEqual(elements[0], try iter.next()?.equatable())
        XCTAssertNil(try iter.previous())
    }

    func testNextTwiceThenPreviousReturnsTheFirstElement() {
        let iter = iterator(html)
        XCTAssertEqual(elements[0], try iter.next()?.equatable())
        XCTAssertEqual(elements[1], try iter.next()?.equatable())
        XCTAssertEqual(elements[0], try iter.previous()?.equatable())
    }

    func testStartingFromCSSSelector() {
        let iter = iterator(html, start: locator(selector: "#pgepubid00498 > p:nth-child(3)"))
        XCTAssertEqual(elements[2], try iter.next()?.equatable())
        XCTAssertEqual(elements[3], try iter.next()?.equatable())
        XCTAssertEqual(elements[4], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testCallingPreviousWhenStartingFromCSSSelector() {
        let iter = iterator(html, start: locator(selector: "#pgepubid00498 > p:nth-child(3)"))
        XCTAssertEqual(elements[1], try iter.previous()?.equatable())
    }

    func testStartingFromCSSSelectorToBlockElementContainingInlineElement() {
        let nbspHtml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
        <body>
            <p>Tout au loin sur la chaussée, aussi loin qu’on pouvait voir</p>
            <p>Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient <span>[...]</span> On buvait de la bière sucrée.</p>
        </body>
        </html>
        """

        let iter = iterator(nbspHtml, start: locator(selector: ":root > :nth-child(2) > :nth-child(2)"))

        let expectedElement = TextContentElement(
            locator: locator(
                progression: 0.5,
                selector: "html > body > p:nth-child(2)",
                before: "oin sur la chaussée, aussi loin qu’on pouvait voir",
                highlight: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée."
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.5,
                        selector: "html > body > p:nth-child(2)",
                        before: "oin sur la chaussée, aussi loin qu’on pouvait voir",
                        highlight: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée."
                    ),
                    text: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée.",
                    attributes: [ContentAttribute(key: .language, value: Language("fr"))]
                ),
            ]
        )

        XCTAssertEqual(expectedElement.equatable(), try iter.next()?.equatable())
    }

    func testStartingFromCSSSelectorUsingRootSelector() {
        let nbspHtml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
        <head></head>
        <body>
            <p>Tout au loin sur la chaussée, aussi loin qu’on pouvait voir</p>
            <p>Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient <span>[...]</span> On buvait de la bière sucrée.</p>
        </body>
        </html>
        """

        let iter = iterator(nbspHtml, start: locator(selector: ":root > :nth-child(2) > :nth-child(2)"))

        let expectedElement = TextContentElement(
            locator: locator(
                progression: 0.5,
                selector: "html > body > p:nth-child(2)",
                before: "oin sur la chaussée, aussi loin qu’on pouvait voir",
                highlight: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée."
            ),
            role: .body,
            segments: [
                TextContentElement.Segment(
                    locator: locator(
                        progression: 0.5,
                        selector: "html > body > p:nth-child(2)",
                        before: "oin sur la chaussée, aussi loin qu’on pouvait voir",
                        highlight: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée."
                    ),
                    text: "Lui, notre colonel, savait peut-être pourquoi ces deux gens-là tiraient [...] On buvait de la bière sucrée.",
                    attributes: [ContentAttribute(key: .language, value: Language("fr"))]
                ),
            ]
        )

        XCTAssertEqual(expectedElement.equatable(), try iter.next()?.equatable())
    }

    func testIteratingOverImageElements() {
        let html = """
            <?xml version="1.0" encoding="UTF-8"?>
            <html xmlns="http://www.w3.org/1999/xhtml">
            <body>
                <img src="image.png"/>
                <img src="../cover.jpg" alt="Accessibility description" />
            </body>
            </html>
        """

        let expectedElements: [AnyEquatableContentElement] = [
            ImageContentElement(
                locator: locator(progression: 0.0, selector: "html > body > img:nth-child(1)"),
                embeddedLink: Link(href: "/dir/image.png"),
                caption: nil,
                attributes: []
            ).equatable(),
            ImageContentElement(
                locator: locator(progression: 0.5, selector: "html > body > img:nth-child(2)"),
                embeddedLink: Link(href: "/cover.jpg"),
                caption: nil,
                attributes: [ContentAttribute(key: .accessibilityLabel, value: "Accessibility description")]
            ).equatable(),
        ]

        let iter = iterator(html)
        XCTAssertEqual(expectedElements[0], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[1], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testIteratingOverAudioElements() {
        let html = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <audio src="audio.mp3" />
            <audio>
                <source src="audio.mp3" type="audio/mp3" />
                <source src="audio.ogg" type="audio/ogg" />
            </audio>
        </body>
        </html>
        """

        let expectedElements: [AnyEquatableContentElement] = [
            AudioContentElement(
                locator: locator(progression: 0.0, selector: "html > body > audio:nth-child(1)"),
                embeddedLink: Link(href: "/dir/audio.mp3"),
                attributes: []
            ).equatable(),
            AudioContentElement(
                locator: locator(progression: 0.5, selector: "html > body > audio:nth-child(2)"),
                embeddedLink: Link(
                    href: "/dir/audio.mp3",
                    type: "audio/mp3",
                    alternates: [Link(href: "/dir/audio.ogg", type: "audio/ogg")]
                ),
                attributes: []
            ).equatable(),
        ]

        let iter = iterator(html)
        XCTAssertEqual(expectedElements[0], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[1], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testIteratingOverVideoElements() {
        let html = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <video src="video.mp4" />
            <video>
                <source src="video.mp4" type="video/mp4" />
                <source src="video.m4v" type="video/x-m4v" />
            </video>
        </body>
        </html>
        """

        let expectedElements: [AnyEquatableContentElement] = [
            VideoContentElement(
                locator: locator(progression: 0.0, selector: "html > body > video:nth-child(1)"),
                embeddedLink: Link(href: "/dir/video.mp4"),
                attributes: []
            ).equatable(),
            VideoContentElement(
                locator: locator(progression: 0.5, selector: "html > body > video:nth-child(2)"),
                embeddedLink: Link(
                    href: "/dir/video.mp4",
                    type: "video/mp4",
                    alternates: [Link(href: "/dir/video.m4v", type: "video/x-m4v")]
                ),
                attributes: []
            ).equatable(),
        ]

        let iter = iterator(html)
        XCTAssertEqual(expectedElements[0], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[1], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testIteratingOverElementContainingBothATextNodeAndChildElements() {
        let html = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <ol class="decimal" id="c06-list-0001">
                <li id="c06-li-0001">Let&#39;s start at the top&#8212;the <i>source of ideas</i>.
                    <aside><div class="top hr"><hr/></div>
                    <section class="feature1">
                        <p id="c06-para-0019"><i>While almost everyone today claims to be Agile, what I&#39;ve just described is very much a <i>waterfall</i> process.</i></p>
                    </section>
                    Trailing text
                </li>
            </ol>
        </body>
        </html>
        """

        let expectedElements: [AnyEquatableContentElement] = [
            TextContentElement(
                locator: locator(
                    progression: 0.0,
                    selector: "#c06-li-0001",
                    highlight: "Let's start at the top—the source of ideas."
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 0.0,
                            selector: "#c06-li-0001",
                            highlight: "Let's start at the top—the source of ideas."
                        ),
                        text: "Let's start at the top—the source of ideas.",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
            TextContentElement(
                locator: locator(
                    progression: 1 / 3.0,
                    selector: "#c06-para-0019",
                    before: "start at the top—the source of ideas.\n            ",
                    highlight: "While almost everyone today claims to be Agile, what I've just described is very much a waterfall process."
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 1 / 3.0,
                            selector: "#c06-para-0019",
                            before: "start at the top—the source of ideas.\n            ",
                            highlight: "While almost everyone today claims to be Agile, what I've just described is very much a waterfall process."
                        ),
                        text: "While almost everyone today claims to be Agile, what I've just described is very much a waterfall process.",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
            TextContentElement(
                locator: locator(
                    progression: 2 / 3.0,
                    selector: "#c06-li-0001 > aside",
                    before: "e just described is very much a waterfall process.\n            \n            ",
                    highlight: "Trailing text"
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 2 / 3.0,
                            selector: "#c06-li-0001 > aside",
                            before: "e just described is very much a waterfall process.\n            ",
                            highlight: "Trailing text"
                        ),
                        text: "Trailing text",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
        ]

        let iter = iterator(html)
        XCTAssertEqual(expectedElements[0], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[1], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[2], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }

    func testIteratingOverTextNodesLocatedAroundANestedBlockElement() {
        let html = """
        <?xml version="1.0" encoding="UTF-8"?>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <div id="a">begin a <div id="b">in b</div> end a</div>
            <div id="c">in c</div>
        </body>
        </html>
        """
        let expectedElements: [AnyEquatableContentElement] = [
            TextContentElement(
                locator: locator(
                    progression: 0.0,
                    selector: "#a",
                    highlight: "begin a"
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 0.0,
                            selector: "#a",
                            highlight: "begin a"
                        ),
                        text: "begin a",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
            TextContentElement(
                locator: locator(
                    progression: 0.25,
                    selector: "#b",
                    before: "begin a ",
                    highlight: "in b"
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 0.25,
                            selector: "#b",
                            before: "begin a ",
                            highlight: "in b"
                        ),
                        text: "in b",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
            TextContentElement(
                locator: locator(
                    progression: 0.5,
                    selector: "#a",
                    before: "begin a in b  ",
                    highlight: "end a"
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 0.5,
                            selector: "#a",
                            before: "begin a in b ",
                            highlight: "end a"
                        ),
                        text: "end a",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
            TextContentElement(
                locator: locator(
                    progression: 0.75,
                    selector: "#c",
                    before: "begin a in b end a",
                    highlight: "in c"
                ),
                role: .body,
                segments: [
                    TextContentElement.Segment(
                        locator: locator(
                            progression: 0.75,
                            selector: "#c",
                            before: "begin a in b end a",
                            highlight: "in c"
                        ),
                        text: "in c",
                        attributes: []
                    ),
                ],
                attributes: []
            ).equatable(),
        ]

        let iter = iterator(html)
        XCTAssertEqual(expectedElements[0], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[1], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[2], try iter.next()?.equatable())
        XCTAssertEqual(expectedElements[3], try iter.next()?.equatable())
        XCTAssertNil(try iter.next())
    }
}

private extension ContentElement {
    func equatable() -> AnyEquatableContentElement {
        AnyEquatableContentElement(self)
    }
}
