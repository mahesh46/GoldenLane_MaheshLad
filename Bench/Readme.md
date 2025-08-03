

### Core Flow:

1. Tap `Start` to begin the workout
2. Enter `Kg` and `Reps` for each set
3. Tap to complete a set and start a rest timer
4. Finish all sets to see a summary scree

You will get pill, timer with finish -which times your work out
Then you get rest timer picker
followed by rest countdown

If all the sets marked complete, you will get the done button and summary screen
otherwise you get the pill buttons,the stages recycle. these are the stages - timer workout, rest picker, rest countdown


### Key Component — 🔥 Pill Animation

- The pill-shaped button at the bottom ("Start") should **fluidly animate** to become the keyboard, timer etc (This is important and a key factor we're looking at).

I have not added a custom keyboard to match your design, as I could not get NumberPadView to work in the WorkOutView correctly.
I have added a done buttom to the default number pad, to allow user to dismiss the keyboard

#### Rethink

Normally, for this kind of app. You would have an empty table. with a add button where you would get a sheet pop up to enter the wieght and reps, start time on rest countdon and a button to mark done, then this would be addes to the table.
There would be a setting button to should a sheet to pick and set the default rest time
A complete button to copy table to  history record table. Which you could access from botton tab bar. Then on selecting the history record you could view the summary sheet.
the two bottom tabs would be workout and history.






