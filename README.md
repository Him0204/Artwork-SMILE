# Artwork-SMILE

## Concept
"Artwork-SMILE" is an interactive visual representation of Hong Kong people's emotions and experiences during the 4-year pandemic. As we emerge from this challenging period, this artwork conveys an important message: even in adversity, we should face life with optimism and a smile.

## Description
This Processing-based artwork creates an animated scene that progresses through the pandemic timeline (January 23, 2020 to March 1, 2023). Characters transition between walking and standing positions, with their facial expressions evolving from sadness to smiles as the timeline advances - symbolizing Hong Kong's journey through difficult times toward recovery and normalcy.

## Features
- **Dynamic Character Animation**: Characters alternate between walking and standing poses
- **Emotional Progression**: Facial expressions change from sad to smiling as the timeline advances
- **Date Timeline**: Visual representation of the pandemic period with advancing dates
- **Image Integration**: Incorporates images divided into smaller parts, representing fragmented pandemic experiences

## Installation
1. Download and install Processing
2. Clone or download this repository
3. Make sure the following image files are in the sketch's "data" folder:
   - 1.jpg through 9.jpg

## How to Run
1. Open `main.pde` in Processing
2. Click the "Run" button (or press Ctrl+R)
3. Watch as the animation progresses through the pandemic timeline

## Technical Details
- The sketch divides loaded images into a 4×7 grid of smaller images
- Characters alternate between walking and standing positions as they move across the screen
- Facial expressions change based on the animation's progression
- The timeline advances day by day from the start to end dates

## Artist Statement
This work represents our collective experience during the pandemic in Hong Kong. The transition from sad to smiling faces symbolizes resilience and hope. As we return to our daily lives, this artwork reminds us that maintaining optimism during difficult times helps us emerge stronger together.

## Code Overview

### main.pde
The `main.pde` file contains the core logic for the animation. Below is a brief overview of its structure:

- **Global Variables**: Defines constants and variables for image handling, animation, and date progression.
- **setup()**: Initializes the canvas, loads images, and prepares the font and image division.
- **draw()**: Continuously calls the `drawAnimation()` function to render the animation.
- **drawAnimation()**: Handles the background, date display, and character animations.
- **incrementDate()**: Advances the date from the start to the end of the pandemic timeline.
- **drawCharacters()**: Alternates between standing and walking character animations.
- **smileFace() & sadFace()**: Draws smiling and sad facial expressions.
- **moveImg()**: Handles the movement of image fragments.
- **drawHumanStand() & drawHumanWalk()**: Draws standing and walking characters with different expressions.
- **divideImg()**: Divides a large image into smaller fragments for animation.