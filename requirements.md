HTTP, Yeah You Know Me Project
==============================
Project Requirements
--------------------
* Iteration 0 - Build a web application/server that...
** ~Listens on port 9292~
** ~Responds to HTTP requests~
** ~responds with a valid HTML response that...~
*** ~Displays `Hello, World! (0)`~
*** ~`(0)` incerments on each request until the server is restarted~
* Iteration 1 - Output Diagnostics
** Include a block of HTML (code like) that includes information about the actual request, includoing...
*** Verb (HTTP verb like GET, POST, etc.)
*** Path (URL)
*** Protocol (HTTP/1.1)
*** Host (Host/Client IP Address, in this case the loopback IP, 127.0.0.1)
*** Port (Port number, in this case 9292)
*** Origin (Origin/Server IP Address, in this case also the loopback IP 17.0.0.1)
*** Accept (Type of data the request can contain, see spec for example
** Keep this block of HTML at the bottom of all of your further outputs
* Iteration 2 - Supporting Paths (react to the path that the user specifies)
** If root `/`, respond with just the Iteration 1 debug info
** If `/hello`, respons with `Hello, World! (0)` where the zero increments each time the path is requested, but not when any other path is requested.
** If `datetime`, respond with the current day's date and time like so `11:07AM, on Sunday, November 1, 2015`
** If `shutdown`, respond with the total number of requests `Total Requests: 12` where `12` is the aggregate of all requests, and exit/stop the server.
* Iteration 3 - Supporting Parameters `http://host:port/path?param=value&param2=value2`
