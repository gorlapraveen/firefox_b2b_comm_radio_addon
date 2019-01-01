. ## Addon design flexibility with Hardware : User Interface 



<p align ="center">First Client</p>
<p align="center">
<img src="https://github.com/gorlapraveen/firefox_b2b_comm_radio_addon/blob/master/icon/noun_double%20arrow_236718_1.png" text="Logo" width="10%" />
</p>
<p align ="center">Second Client</p>



**Note:** :   In the documentation,

1. _*[**Addon Configuration**]*_ :is used to describe about  implementation as an **Addon Part**.
2. _*[**SDR Configuration**]*_ : is used to describe about  implementation as an **SDR Part**.

------------------------------------------------------------------------------------------------------------------------------

## On First client side(with no internet Connection)

Who initiates the process and want to connect the **other(second) client (/end With Internet)** side for information transreceiving.

1. _*[**Addon Configuration**]*_  Addon must have user flexibility - Option to choose the Software Defined Radio(Hardware part of SDR).

>_*[**SDR Configuration**]*_ : Some of the SDRs available that can be used are, high cost [USRP](https://www.ettus.com/usrp-product-selector)( Which is  closed source , prefered not to be used) and medium cost[Adalm-Pluto](https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/adalm-pluto.html)(Medium cost, Open Source,easy to use for other applications), even lesser cost includes [RTL-SDR](https://www.rtl-sdr.com) . These hardware are tested to have feasiblity, but full implementation is under development.

>> _*[**SDR Configuration**]*_  Explicit information about the product is provided shortly, but as far as concerned with the open source SDR(Hardware) which operates between in the range of 900MHz - 3GHz works fine, even leser or higher ranges are also suitable, but they should have same operting frequency as that of other client side of SDR.

2. _*[**Addon Configuration**]*_  Option to **initiate the request** to connect the other end.

    1. Invoke the system scripts(which will be installed in the local system during installation or user will have flexibility to manually install) to inform the other client-side.
    
3. _*[**Addon Configuration**]*_  Then **Option to Provide input**(i, ii) : _*[**SDR Configuration**]*_ to Communiate Text/text-file and Short Voice(for now), For now direct phrasing of HTMl page is not supported.
    1. For **Text** : Should **provide input method** and store them locally in the sytem.
    2. For **Voice(Short)** : Should **provide input method** and store them locally in the sytem.
    
 4. _*[**Addon Configuration**]*_ Finally send button  to invoke : _*[**SDR Configuration**]*_ SDR hardware and its related files to send the locally stored file(i.e the file or text in (3)). 
 
 5.  **Receiving the information:** Showing the received information.
 
     1. _*[**SDR Configuration**]*_ At SDR part, the received text/file will be stored as single file - _*[**Addon Configuration**]*_ will be able to show up that file
    
    
 ----------------------------------------------------------------------------------------------------------------------------------
 
 
 
 ## On Second client side(With Internet Connection) : 
 
 Who accepts the connection from the **other(First) client (/end Without -Internet)** side for information transreceiving.

1. _*[**Addon Configuration**]*_  Addon must have user flexibility - Option to choose the Software Defined Radio(Hardware part of SDR).

>_*[**SDR Configuration**]*_ : Some of the SDRs available that can be used are, high cost [USRP](https://www.ettus.com/usrp-product-selector)( Which is  closed source , prefered not to be used) and medium cost[Adalm-Pluto](https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/adalm-pluto.html)(Medium cost, Open Source,easy to use for other applications), even lesser cost includes [RTL-SDR](https://www.rtl-sdr.com) . These hardware are tested to have feasiblity, but full implementation is under development.

>> _*[**SDR Configuration**]*_  Explicit information about the product is provided shortly, but as far as concerned with the open source SDR(Hardware) which operates between in the range of 900MHz - 3GHz works fine, even leser or higher ranges are also suitable, but they should have same operting frequency as that of other client side SDR.


2. _*[**Addon Configuratio**]*_  Option button "ON" to invoke - _*[**SDR Configuration**]*_ SDR to be in transreceiving() mode.
      1. ON Button : will invokes installed SDR scripts and place SDR from non-operating(off) mode to transreceiving mode.
      2. Note: SDR should always be in tranreceiving (at least receiving mode) for accepting requests.
3.  **Receiving the information:** Showing the received information.
 
     1. _*[**SDR Configuration**]*_ At SDR part, the received text/file will be stored as single file - _*[**Addon Configuration**]*_ will be able to show up that file.
     
4. _*[**Addon Configuration**]*_  Option to **initiate the confirm** to connect the other end.

    1. Invoke the system scripts(which will be installed in the local system during installation or user will have flexibility to manually install) to inform the other client-side.
    

    
5. _*[**Addon Configuration**]*_  Then **Option to Provide input**(i, ii) : _*[**SDR Configuration**]*_ to Communiate Text/text-file or Short Voice(for now), For now direct phrasing of HTMl page is not supported.
    1. For **Text** : Should **provide input method** and store them locally in the sytem.
    2. For **Voice(Short)** : Should **provide input method** and store them locally in the sytem.
    
 6. _*[**Addon Configuration**]*_ Finally send button  to invoke : _*[**SDR Configuration**]*_ SDR hardware and its related files to send the locally stored file(i.e the file or text in (3)). 
 

    
    
 ----------------------------------------------------------------------------------------------------------------------------
 
 `A Partial Documentation`by [gorlapraveen](https://github.com/gorlapraveen)
