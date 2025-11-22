// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@rails/request.js"
import { shouldPerformTransition, performTransition } from "turbo-view-transitions";

document.addEventListener("turbo:before-frame-render", (event) => {
  if (shouldPerformTransition()) {
    const defaultRender = event.detail.render;

    event.detail.render = (currentFrame, newFrame) => {
       performTransition(
        currentFrame, 
        newFrame,
        async () => {
          await defaultRender(currentFrame, newFrame);
        }
      );
    };
  }
});

// document.addEventListener("turbo:before-frame-render", (event) => {
//     console.log("Old frame:", event.target);
//     console.log("New frame:", event.detail.newFrame);
//     console.log("Old frame elements:", event.target.querySelectorAll('[data-turbo-transition]'));
//     console.log("New frame elements:", event.detail.newFrame.querySelectorAll('[data-turbo-transition]'));

//     if (shouldPerformTransition()) {
//         event.preventDefault();
//         debugger
//         performTransition(
//             event.target,
//             event.detail.newFrame,
//             async () => {
//                 await event.detail.resume();
//             }
//         );
//     }
//   });