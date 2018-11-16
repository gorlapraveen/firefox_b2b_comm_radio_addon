## Addon design flexibility with Hardware : User Interface

**On one client side(No internet Connection)** : Who initiates the process and want to connect the other client (/end With Inteternt) side for information transreceiveing.

1. _*[Addon Configuration]*_  Addon must have user flexibility - option to choose the Software Defined Radio(Hardware part of it).

>_*[SDR - Configuration]*_ : Some of the SDRs available that can be used are, high cost [USRP](https://www.ettus.com/usrp-product-selector)( Which is  closed source , prefered not to be used) and medium cost[Adalm-Pluto](https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/adalm-pluto.html)(Medium cost, Open Source,easy to use for other applications), even lesser cost includes [RTL-SDR](https://www.rtl-sdr.com) . These hardware are tested to have feasiblity, but full implementation is under development.

>> _*[SDR - Configuration]*_  Explicit information about the product is provided shortly, but as far as concerned with the open source SDR(Hardware) which operates between in the range of 900MHz - 3GHz works fine, even leser or higher ranges are also suitable, but they should have same operting frequency as that of other client side of SDR.

2. _*[Addon Configuration]*_  Option to **initiate the request** to connect the other end.

    1. Invoke the system scripts(which will be installed in the local system during installation or user will have flexibility to manually install) to inform the other client-side.
    
3. _*[Addon Configuration]*_  Then **Option to Provide input**(i, ii) : _*[SDR Configuration]*_ to Communiate Text/text-file and Short Voice(for now), For now direct phrasing of HTMl page is not supported.
    1. For **Text** : Should **provide input method** and store them locally in the sytem.
    2. For **Voice(Short)** : Should **provide input method** and store them locally in the sytem.
    
 4. _*[Addon Configuration]*_ Finally send button  to invoke : _*[SDR Configuration]*_ SDR hardware and its related files. 
    
