## Apple Silicon Chips

If you bought your computer after late 2020, chances are it has a new Apple silicon chip instead of an Intel processor: let's find out.

Open a new terminal window from Applications > Utilities or search for it with [Spotlight](https://support.apple.com/en-gb/HT204014):

![Open Terminal on macOS](images/macos_open_terminal.png)

Copy-paste the following command in the terminal and hit `Enter` to execute.

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/lewagon/setup/master/utils/macos_list_processor_type.sh)"
```

☝️ The result of the command should indicate whether your computer uses Apple Silicon.

If your computer uses **Apple Silicon**, expand the paragraph below and go through it. Otherwise ignore it.

<details>
  <summary>👉&nbsp;&nbsp;Setup for Apple Silicon 👈</summary>

You want to make sure that you are **not using** Rosetta, which is a way to use your Terminal as if you had an Intel computer.

Open the Finder app (or search for it with [Spotlight](https://support.apple.com/en-gb/HT204014)).

Go to Applications > Utilities.

Locate the Terminal app (select it).

Press `Cmd` + `I` on the Terminal app, then verify that the box "Open using Rosetta" is **unchecked**.
In case you don't see this box, just continue.
</details>

🚨 Keep this in mind. You will need to remember later on in the setup whether your computer uses an Apple Silicon chip or is an Apple Intel version
