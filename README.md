# HashDaddy

### *Disclaimer:* 
## Issa 🅱asic Hash File Validation GUI written in Powershell 🤢, what'd you expect?


### How to [Setup](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjoEKB04jm4Eo848g_uKkMO6Dqk3SmSdcaMA&usqp=CAU)

1. Download the `HashDaddy.ps1` file

2. Generate a Self-Signed Certificate and Digitally Sign the `HashDaddy.ps1` file

    See the reference [included here](https://adamtheautomator.com/how-to-sign-powershell-script/) or in the commented section of the code for help performing this step.

3. Done! *Less get it poppin Jimbo*



### How to [Operate](http://www.kushandoj.com/dist/img/oj.png)

1. Download a File from an online source, whether it be commercial, open-sourced, embarrassing as hellll, or otherwise 

2. Copy the Hash value accompanying the file download from your online source

3. Open PowerShell from the directory containing your `HashDaddy.ps1` file and run the following Command:

  ```powershell
  powershell.exe .\HashDaddy.ps1 -hash dddb022f40affd9b0e247e137cb8005bf798ae94f07fa6dcfdcc9ab798389958a179b05d5e147f0a
  ```

  *__NOTE:__ Just be sure to replace the Hash example shown above, after the `-hash`, with your copied Hash Value*

4. Select your Downloaded File from the File Explorer Window

5. From the drop-down menu, Select the Hash Algorithm that's corresponds with your copied Hash Value 

6. Done! Hash comaparison results are shown on the PowerShell console, indicating either confirmation or denial surrounding your downloaded file's data integrity   


<!-- ![sus](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjoEKB04jm4Eo848g_uKkMO6Dqk3SmSdcaMA&usqp=CAU) -->
<!-- ![Cuz I b goin Haard](http://www.kushandoj.com/dist/img/oj.png) -->
