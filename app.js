/* app.js - entrypoint for client-side behavior
   Currently the main logic is inline in index.html. To move it here:
   1) extract <script> contents from index.html and place them here
   2) wrap initialization in window.onload or DOMContentLoaded
   3) include <script src="app.js"></script> at the end of index.html

Small helper example (kept minimal - migrate logic over when ready):
*/

(function(){
    console.log('app.js loaded - move your inline scripts here for cleaner structure');

    window.initAppFromExternal = function(){
        // call this from index.html after loading app.js to reuse existing initApp()
        if(typeof initApp === 'function') initApp();
    }
})();
