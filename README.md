# lookingForRest

**Description of the « LookingForRest » 4D component**

This component is a tool to visualise REST exchanges between 4D Server and 4D Client

This component is intended to be used with 4D v18
This component is provided in a 4D project form (lookingForRest.4DProject) with all sources available.


**Purpose of this component**

This component is given as a kind of user interface for the new members methods introduced with 4D v17 R6 for the dataStore object. 

According to the documentation, the dataStore.*startRequestLog* new member method allows you to log ORDA requests on the client side. It is designed for debugging purposes in client/Server configurations.
By default the component uses this command to store the ORDA requests in memory and shows you the latest 100 requests.
Via the component, you can start and stop the debugging process, visualize ORDA requests exchanged between the client and the server, as well as copy those requests to analyse them in details later.

Please keep in mind that the component will show you nothing if you don’t use it in client/server mode.

Additional informations about the new member methods of the dataStore object can be found in 4D documentation at the following place:
https://doc.4d.com/4Dv18/4D/18/dataStorestartRequestLog.305-4505929.en.html


**How to call the component ?**

The component is called by calling the single component method « LOGsView »


**How to use the component ?**

All actions available with the components are accessible through a single dialog, which will appear when calling the component « LOGsView » method.
The « Capture » button in this dialog will start the debugging process while the « Stop » button will abort it.
During the debugging process, the incoming exchanges between client and serveur will be displayed in the main listbox of the interface, allowing you to check for the following informations:
Unique sequence number of the ORDA request, duration of the request, request url sent to the serveur and status response from the serveur.

The dataStore.*getRequestLog* member method is used every second to refresh the content of the ListBox displaying the ORDA requests.

The « Copy » button will copy in the clipboard all the « urls » informations loaded in the ListBox during the latest or current recording of ORDA requests.

For the « Clear » button to be used, the logging process needs to be stopped. The « Clear » button will erase all informations previously loaded in the ListBox.

Additional features:
When a row is selected in the component’s listbox, a contextual menu will allow you to copy in the clipboard either the url associated to the ORDA request or the whole content of the request (including the server response) in json format.
The whole content of an ORDA request (or at least a part of it) is also displayed as a tip when the mouse is above the Sequence number part of a row.
