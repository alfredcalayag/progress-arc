# Progress-arc
This is a small project involving a progress arc indicator using Angular and D3.

## What is it?
The `<progress-arc>` is an Angular directive to show the difference between an actual measurement compared to an expected measurement. It takes 2 inputs: the `actual` percentage of completion and the `expected` percentage of completion.  Based on these inputs, the widget will animate circular arcs representing the completion statuses (i.e. 50% -> half circle, 100% => full circle) with the actual display on reading out in the center.

The arcs are built with a color mood indicator that behaves as follows:
- Red if the actual is behind 50% or more than the expected
- Orange if the actual is behind 25% of the expected
- Green otherwise.  Green is good.

## Live Demo
Deployed on Heroku. Give it a couple of seconds to load.

[One-time load and display demo](https://enigmatic-bayou-18973.herokuapp.com/#/demo).  See the transitions as the page loads. Hit refresh on your browser to play it again.

[Data-binded demo with live updating](https://enigmatic-bayou-18973.herokuapp.com/#/demo-input).  Input fields provided to change the data values and observe the changing transitions.

[Errors and Response](https://enigmatic-bayou-18973.herokuapp.com/#/demo-errors).  Shows how the widget responds to invalid data at initialization and during live updates, how it survives, and the errors messages created.

### What it looks like
<img align="middle width="673" alt="demo" src="https://cloud.githubusercontent.com/assets/8264059/18431964/6ab0df88-7894-11e6-8f57-8e984f8df603.png">

### What it outputs
<img width="904" alt="markup" src="https://cloud.githubusercontent.com/assets/8264059/18432430/c686edfa-7896-11e6-8ff9-d2c8310c055e.png">

## Try it out
Follow the build & development section below and visit http://localhost:9000/#/ in your browser.
Play around with editing the input values in app/views/templates/demo.html and observe the different behavior based on your inputs.

## Example Usage
`<progress-arc actual="actual-data" expected="expected-data" radius=100 label="Progress"></progress-arc>`

Where `actual-data` and `expected-data` are expected to be float values in the acceptable range of 0 to 1.0 (1.0 representing 100%).

Required inputs are `actual` and `expected` while `radius` and `label` are optional which are supported with fallback values.

### Error Handling
This widget is a tough cookie. As described above, there is an acceptable range of inputs.  An input outside of this range will break it, right?  Throw an exception and call it a day?  Nonsense.  As the input data is intially loaded or updated, it is detected for its validity. If it is invalid, it will be defaulted to either 0 (below range or other nonsense data) or 1 (above the range). 2-way binding is applied to the inputs, so if hooking the directive up to a parent controller's input field, the input defaulting will also apply at the input field.

What does this mean?  It means that the widget will NOT just break and be utterly useless.  It will still render normally, and with any live update will continue to work.  See the demo for Errors and Response that showcase this linked above.

But wait... there's more.

Open the console, and you will find custom errors thrown in these situations.  The message contains information of which input caused the error, what was the attempted input, and what it was defaulted to. So... not just that there was bad data and "something broke", but a more detailed description of the offender.

## Structure
I started with everything written into one directive to get a quick POC, but now I've started re-factoring it for modularity and re-usability, possibly to expanding on this project later.  I have organized it across a few factory services:
- `Arc`: Composes the input data in a format for generating the arcs. Also containing the tween functions for animations
- `Color`: Defines colors and provides the mood color generator
- `Conversion`: Some trivial math conversion
- Then there's the directive itself that composes of the above services and $compiles the widget

These files are located in: [/app/scripts/](https://github.com/alfredcalayag/progress-arc/tree/master/app/scripts)

## Future Enhancements
- Allow an option for auto-scaling the widget for responsive-ness to different browser sizes and resizing.
- Change to a feature-based file structure (e.g. having my directive.js, directive.html, directive.scss all in its own directory).  This is more of a preference rather than a bug.  I learned that I would have to invest more time into a custom scaffolding engine to generate files in my preferred way.  It shouldn't be too difficult, but that's for another project.

## Technologies
- Angular
- D3

## Build & development
To run locally, clone this repo and run: `npm install && bower install && grunt serve`.  A local server will be running on port 9000.

## Testing
Running `grunt karma` will run the unit tests with karma.
