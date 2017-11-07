# AC-iOS-LifecycleAndControlsExercise

## Love Songs Lifecycle and Controls

### Step 1

We're going to create a settings menu for our love songs tableview from yesterday. If you already created that tableview, move on to step 2, if not...
a. Fork and clone this repo.
b. Create a tableview and populate it with the static array loveSongs in Song

#### Love Songs TableView

<img width="317" alt="screen shot 2017-11-07 at 10 51 18 am" src="https://user-images.githubusercontent.com/20875592/32502820-c35ae546-c3a9-11e7-8b5c-f8844c897641.png">


### Step 2

Create a SettingsViewcontroller and hook it up to its own ViewController class.
Create outlets and actions for the controls and get them working and updating their corresponding labels.

#### Settings Menu

<img width="313" alt="screen shot 2017-11-07 at 10 51 03 am" src="https://user-images.githubusercontent.com/20875592/32502824-c5549b1c-c3a9-11e7-9973-b3d292c36949.png">


### Step 3 

Create a Settings class with static variables to hold all the settings options values. You need to be able to store...
a. The maximum number or rows in the tableview
b. The case of the text, whether it be lowercase, uppercase or capitalized... maybe use an enum for this??
c. The background color of the tableViewCell, this could be a tuple of RGB. You'll get thos values from the sliders.
d. Whether or not the backgroundColor of the tableViewCells should alternate.

e. In your SettingsViewController, hook up your controls to manipulate the Settings.

#### Changing Rows

![](https://media.giphy.com/media/l2QDPPoG31zlaofWU/giphy.gif)



#### Changing Case

![](https://media.giphy.com/media/26u409FvcHo3Q78nC/giphy.gif)


#### Changing Cell Background Color

![](https://media.giphy.com/media/l2QE06HoonGr93gYw/giphy.gif)


#### Alternating Cells

![](https://media.giphy.com/media/26u4ehO091lp0J1QI/giphy.gif)


