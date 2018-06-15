# iOS MVVM Exploration in Swift

This is my first attempt at applying the **Model-View-ViewModel (MVVM)** architectural pattern for iOS development:

* The binding between the View and the ViewModel is done through the use of property observer `didSet` and closures.
* Unlike most - if not all - of the MVVM tutorial projects out there, I create the View programmatically (no storyboard).

In this project, I also ...

* parse JSON data from a local file `all_movies.json`
* embed UICollectionView inside UITableView

## Application Overview

iOS application that displays "movies" (you will know why after running the application) based on their categories / genres.

## Code Structure Overview

While iOS MVVM architecture usually combines View and ViewController to be the View component of MVVM, I make a slight distinction
between the two of them:

* View takes care of the UI elements' appearances (attributes and layouts).
* ViewController (Controller) acts as the data source and delegate to UITableView and UICollectionView.
* ViewController (Controller) takes care of user interaction.
* ViewController (Controller) has reference to both View and ViewModel.
* View does not have reference to ViewController.

## Reflection

The application includes UICollectionView that is embedded inside UITableView. Without storyboard, I need to set the height of the
UITableView and UICollectionView programmatically through their respective **delegate methods**. This causes some problem when I attempt
to bind UITableView and UICollectionView to their respective delegates and data sources (`AllMoviesViewController`) **reactively**
using RxSwift.

While the data source and delegate binding is taken care of by RxSwift, `.bind()` method does not take into consideration the width
and height of the UITableView and UICollectionView. Hence, I am not able to set the height of UITableView and UICollectionView.
This is, however, not a problem if storyboard is used for the layouts of UI elements are specified there.

Even though I do experiment with RxSwift and RxCocoa a little bit in this project, I do not focus too much on them. I am sure that
there is a way / workaround to solve this issue, but I will leave that research for another project.
