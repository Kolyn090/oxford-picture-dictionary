# Introduction

The Oxford Picture Dictionary was made based on 
[The New Oxford Picture Dictionary: Monolingual English Edition](https://homepage.ntu.edu.tw/~karchung/OxfordPictureDictionary.pdf)
by Parnwell et al. at Oxford University Press. In the first paragraph
of the Preface, the authors have described the book as:

> The *New Oxford Picture Dictionary* contextually illustrates over
2,400 words. The book is a unique language learning tool for
students of English. It provides students a glance at American
lifestyle, as well as compendium of useful vocabulary.

### In this project, I have:
* Greatly improved image resolution by utilizing [AI Image enhancement](https://letsenhance.io/boost)
* Made numbered tags interactive
* Implemented pan and pinch
* Made vocabulary audible
* Implemented multilingual feature

### Using Oxford Picture Dictionary
The Oxford Picture Dictionary is designed for easy use. 
Simply click a numbered tag on the image to display the vocabulary, 
along with its pronunciation.

![pic1](./readme_images/pic1.png)

### Other controls
<p align="center">
    <img alt="pic2" src="readme_images/pic2.png" width="200" />
</p>

# Download

### Development
Requirement: MacOS system with XCode downloaded.
Minimal Deployments requirement: iOS 17.0

Clone this repository and open it in XCode. Trust the project,
build and run with a device of your choice. 
### App Store
Not yet available.

### TestFlight
Not yet available.

# Adding new content
### New scenario (English)
1. Go to `Assets`, add your new image to `pages` folder. Rename
   the image to `p104` if it's not already existing. Otherwise,
   use `p105` and so on. Make sure the numbers are consecutive.
2. Go to `ContentView.swift`, change the field `isUsingDrag` to `1`.
3. In `ContentView.swift`, change the field `langManager`'s
   `defaultPage` to the number of the page you just added. Ex.
   `defaultPage: 104` if your image is named `p104`.
4. Choose a simulator (highly recommend iPads for higher precision)
   and run the project.
5. You should now see something like below after everything has been
   fully loaded. Next, drag the red dot located in the 
   left-upper corner of the image to anywhere you like.
![pic3](./readme_images/pic3.png)
6. Check the XCode console, you should see a position being
   printed whenever you finish dragging. Ex. 
   `0.5954198473282443,0.10178117048346055`
7. Find the `WordsPosition` folder in the project. Add a new file
   with exact the same name as the image you just added. (i.e.
   name your file `p104` if your image is named `p104`)
8. In the newly created file, add `XPosition,YPosition` as the
   first line of the file.
9. Copy the position from the console and paste it to the next
   line of the file. If you are uncertain, you can inspect the
   existing files in `WordsPosition`. After you finish this step,
   the position of the new word is completed.
10. Now add the actual word. To do so, locate folder `Words-en`
    in the project, add a new file in it ang give it name
    `p104-en` if your image is named `p104`.
11. Within the newly created file, enter the title of the scenario
    in the first line. (ex. People and Relationships)
12. In the next line, enter the actual word. (ex. husband)
13. Repeat steps 5-12 to add more words to the scenario. Again,
    if you are uncertain, you can inspect the existing files in
    `Words-en`.
14. Congratulations! You have just added an English Scenario. Now
    go back to `ContentView.swift` and change field `isUsingDrag`
    to `0`.
15. Run the project. Since in step 3, you have changed the default
    page to `104`(...or some other number), the first page you will see should be the
    scenario you just added. Now you can try to play it with
    `en-US` or `en-UK` to see if it actually works.
16. If you want the default page to start from `2`, change it in
    the field `langManager`, like you did in step 3.
* You might be wondering why the pages starts from `2`, this is
  because I was following the book, and it was designed this way.

### Translate to (existing) languages
1. Read and follow the above section 'New scenario (English)'. 
2. Using Chinese as example, locate folder `Words-zh-Hans` (Simplified Chinese) or 
   `Words-zh-Hant` (Traditional Chinese). 
3. Similar to the step 10 in the last section. If your
   image is named `p104`, add a new file
   and name it `p104-zh-Hans` (inside `Words-zh-Hans`) or
   name it `p104-zh-Hant` (inside `Words-zh-Hant`).
4. Similar to the step 11 and 12 in the last section. Add a title.
   (ex. 人际关系) and words in the next lines (ex. 丈夫)
5. It's done! Now run the project and switch to Chinese to see
   if it works.

### Adding a new language
1. Locate file `enum/Lang.swift`, inside enum `Lang`, 
   add a new case. The case should be the abbreviation
   of your language, and you should also assign a string
   value to it. This value will be the name of the icon
   of your new language. (ex. `ja-JP` for Japanese)
2. That being said, go to `Assets` and add the icon
   under folder `lang`. Give it the same name as the 
   string value.
3. Locate `Language/LangManager.swift` and find the private
   function `csvNameSuffix`. Next, find the inner function
   `getSuffix`, add the new case to the switch statement.
   The case should be the abbreviation of your language
   (which was added by you) and the case should return
   the suffix of the word folder. (That is, where the words
   are stored. ex. If it returns `"en"`, the folder it associates
   should be named `Words-en`, If it returns `"ja"`, 
   the folder it associates should be named `Words-ja`) 
4. That being said, create a new folder to store the words
   for your language. You should name it `Words-[abbr. of
   your language]` (ex. `Words-ja` for Japanese).
5. Now your new language should be added. Remember, if you
   are uncertain, you can inspect and mimic the existing 
   languages to see how things should be done.
* This project is using Swift's [built-in Speech system](https://gist.github.com/Koze/d1de49c24fc28375a9e314c72f7fdae4),
  which means only the supported languages will have speech
  feature available. Moreover, you should name the string value
  and image according to this [gist](https://gist.github.com/Koze/d1de49c24fc28375a9e314c72f7fdae4)
  to enable speech for your language. 

# Share the app
This app is offered entirely free as an English learning tool, 
in recognition of Oxford University Press's generosity in sharing 
educational resources. In that spirit, **I encourage all derivative 
works based on this app to also be made freely available and open 
to the public.** Beyond that, you are welcome to build upon and expand 
this project with your own ideas.

# Helping with Translation
To help, please go to [this google sheet](https://docs.google.com/spreadsheets/d/1_eBhGagpQ7aI7Gpe-YDquEc05Ku1f8Eoi5rRgc3CAz4/edit?usp=sharing).
If you contribute high-quality translations, your name will be 
proudly featured on the Credits page.

If you wish to add a new language or if you have found a translation error, 
please contact me via email:
kolynlin@protonmail.com
