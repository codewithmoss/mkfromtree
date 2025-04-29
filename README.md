<p align="center">
  <h1 align="center">mkfromtree</h1>
  <p align="center">Create complete folder and file structure from a tree text file.</p>
  
  <p align="center">
    <a href="LICENSE">
      <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License">
    </a>
    <img src="https://img.shields.io/badge/Build-Passing-brightgreen.svg" alt="Build">
    <img src="https://img.shields.io/badge/Platform-Linux-blue.svg" alt="Platform">
    <img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg" alt="Bash">
    <img src="https://img.shields.io/github/stars/codewithmoss/mkfromtree?style=social" alt="GitHub stars">
  </p>
</p>

## 📸 Screenshots

<p align="center">
  <img src="img/1.png" alt="Using command `mkfromtree /home/moss/Downloads/Backup` created Directories" width="600"/>
  <br><em>Using command <code>mkfromtree /home/moss/Downloads/Backup</code> created Directories</em>
</p>

<p align="center">
  <img src="img/2.png" alt="Created `TREE.txt` file inside the root directory" width="600"/>
  <br><em>Created <code>TREE.txt</code> file inside the root directory</em>
</p>

<p align="center">
  <img src="img/3.png" alt="`TREE.txt` file contains the same structure that we input" width="600"/>
  <br><em> <code>TREE.txt</code> file contains the same structure that we input</em>
</p>

---

# mkfromtree

**mkfromtree** is a simple Bash script that **creates a full directory and file structure** from a human-readable tree format.

---

## 🚀 Features

- 📂 Create complex folder and file structures **instantly** from a tree text.
- 🏠 Create structure in the **current directory** or **any custom path**.
- 📄 Save a **copy of the tree structure** inside the top directory for reference.
- 🖋️ Supports both **manual typing** and **file input** (`tree.txt`).
- 🛡️ Smart detection: 
  - If no tree structure is entered, **it does nothing safely**.
  - Skips empty or invalid lines automatically.
- 🔥 Fully written in **pure Bash** — no external dependencies needed!

---

## 📦 Usage

#### ➤ Paste manually (interactive)


```bash
mkfromtree
```

You will be prompted to paste the tree structure manually:

## Example: 

```tree
Directory structure:
└── tree-test/
    ├── README.md
    ├── LICENSE
    └── script.js
```

Then press `Ctrl+D` to end input.
or Save and exit your EDITOR.

---

#### ➤ Create from a tree text file

```bash
mkfromtree /path/to/tree.txt
```

Example:

```bash
mkfromtree ~/Downloads/mytree.txt
```

---

#### ➤ Create in a specific target directory

```bash
mkfromtree /target/directory/ /path/to/tree.txt
```

Example:

```bash
mkfromtree ~/Projects/ ~/Downloads/mytree.txt
```

It will create the structure **inside** `~/Projects/`.


## 🧩 Commands List

| Command | Description |
|:---|:---|
| `mkfromtree` | Start manual mode — paste the tree structure manually. |
| `mkfromtree /path/to/tree.txt` | Create structure by reading the tree from a file. |
| `mkfromtree /target/directory/ /path/to/tree.txt` | Create structure inside a specific target directory. |
| `mkfromtree /target/directory/` | Start manual mode but save the result into a specific directory. |


---

## ⚙️ How It Works

- Parses your **tree structure** line-by-line.
- Detects folder names (ending with `/`) and creates them.
- Detects file names and creates **empty files**.
- Automatically handles **nested directories**.
- Also saves a copy of your original tree structure text inside the top folder (`tree-structure.txt`) for your reference.

---

## 🧰 Installation

Clone the repository:

```bash
git clone https://github.com/codewithmoss/mkfromtree.git
cd mkfromtree
chmod +x mkfromtree.sh
```

Add it to your PATH:

```bash
sudo cp mkfromtree.sh /usr/local/bin/mkfromtree
```

✅ Now you can use `mkfromtree` anywhere.


## 📥 Install from AUR (Arch Linux)

You can install **mkfromtree** easily using any AUR helper like `yay`:

```bash
yay -S mkfromtree
```

Or manually clone and build:

```bash
git clone https://aur.archlinux.org/mkfromtree.git
cd mkfromtree
makepkg -si
```
✅ Now you can use mkfromtree anywhere!

## 📥 Install using `install.sh` CURL

✅ Users can install directly with:

```bash
curl -fsSL https://raw.githubusercontent.com/codewithmoss/mkfromtree/main/install.sh | bash
```

✅ This will download and install `mkfromtree` automatically to `/usr/local/bin/`.


# 📜 **How it works now:**

| Step | What happens |
|:---|:---|
| 1 | Downloads the file to a temp location you have access to. |
| 2 | Uses `sudo` to move it to `/usr/local/bin/`. |
| 3 | Sets executable permissions. |
| 4 | Done! |


---

## 🪪 License

Released under the [MIT License](LICENSE).

---
