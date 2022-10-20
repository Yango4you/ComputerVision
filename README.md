# Automatic Analyser of Satellite Pictures

<img width="616" alt="image" src="https://user-images.githubusercontent.com/64792442/197028742-990cff22-3fa4-49d8-a1a3-d1bdd43e889b.png">
<img width="594" alt="image" src="https://user-images.githubusercontent.com/64792442/197028840-e14cf53d-e205-4e8e-93b6-fd512f77033f.png">


The following README file gives a general description of the Matlab app created for the Computer Vision Challenge 2021, as well as a brief explanation of its functionality and how to make use of the user interface.

## Toolbox
   Computer Vision Toolbox  
   
   Signal Processing Toolbox  
 
   Image Processing Toolbox  

## Functionality

The app allows the user to analyse datasets of satellite pictures retrieved from software such as Google Earth. After being imported, the GUI allows for different kinds of visualization, as well as analysis of differences, highligh detection, etc.

## How to Use the App

### Image Preparation

The first step to use the program is to import the dataset and select the correct settings so it can be optimally analysed. Before the user can access any of the functionality, the pictures must be imported by using the "Import Dataset" button. A new window will open, allowing the user to select the exact folder where the images are saved.

After they are imported, the slider on the top of the screen will show the timestamps of the imported pictures. By moving the slide, we can select which image will be chosen as reference to perform the preprocessing of the whole batch, as well as to define the orientation of all the other images. The user can see a preview on the right side of the screen, and a picture can be selected with the button directly below.

After this button is pushed, the program will apply the preprocessing routine to all the images in the background, and the result will be displayed on the centre of the image. The user can then advance through the pictures to make sure that they were all correctly preprocessed.

#### Manual Calibration

Sometimes, due of the specific nature of some images, the program cannot correctly preprocess and orient them. When this happens, the user can press the button "Manual Calibration". In this case, a new window will open, allowing the user to select several points in both images so the program can correctly match that particular picture with the reference one. Here are some tricks on how to do so:

* At least 4 points must be chosen in order to match the two images, but it works better when more points are chosen. The user must make sure that the points correctly match (this means, point 1 of the left image must be point 1 on the right image)
* When the points are chosen on the actual surface of the Earth, rather than at the tip of man-made structures like buildings, it's somewhat easier for the matching algorithm to fund the correct transformation

Once this is done, the user can close this window and continue. Once closed, the picture in the centre of the image will be updated. In case the results are not satisfactury, this process can be repeated as many times as desired.

After all pictures have been correctly calibrated, the user can press the "Finish" button and proceed to use the rest of the functionality of the program.

More details regarding the functionality of each analysis mode can be found in the documentation of the project.

