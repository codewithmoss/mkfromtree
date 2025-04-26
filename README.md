# mktree

**mktree** is a simple Bash script that **creates a full directory and file structure** from a human-readable tree format.

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
mktree
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
mktree /path/to/tree.txt
```

Example:

```bash
mktree ~/Downloads/mytree.txt
```

---

#### ➤ Create in a specific target directory

```bash
mktree /target/directory/ /path/to/tree.txt
```

Example:

```bash
mktree ~/Projects/ ~/Downloads/mytree.txt
```

It will create the structure **inside** `~/Projects/`.


## 🧩 Commands List

| Command | Description |
|:---|:---|
| `mktree` | Start manual mode — paste the tree structure manually. |
| `mktree /path/to/tree.txt` | Create structure by reading the tree from a file. |
| `mktree /target/directory/ /path/to/tree.txt` | Create structure inside a specific target directory. |
| `mktree /target/directory/` | Start manual mode but save the result into a specific directory. |


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
git clone https://github.com/YOURUSERNAME/mktree.git
cd mktree
chmod +x mktree.sh
```

Add it to your PATH:

```bash
sudo cp mktree.sh /usr/local/bin/mktree
```

✅ Now you can use `mktree` anywhere.


## 📥 Install from AUR (Arch Linux)

You can install **mktree** easily using any AUR helper like `yay`:

```bash
yay -S mktree
```

Or manually clone and build:

```bash
git clone https://aur.archlinux.org/mktree.git
cd mktree
makepkg -si
```
✅ Now you can use mktree anywhere!

## 📥 Install using `install.sh` CURL

✅ Users can install directly with:

```bash
curl -fsSL https://raw.githubusercontent.com/codewithmoss/mktree/main/install.sh | bash
```

✅ This will download and install `mktree` automatically to `/usr/local/bin/`.


# 📜 **How it works now:**

| Step | What happens |
|:---|:---|
| 1 | Downloads the file to a temp location you have access to. |
| 2 | Uses `sudo` to move it to `/usr/local/bin/`. |
| 3 | Sets executable permissions. |
| 4 | Done! |

✅ **No permission issues anymore**  
✅ **Safer and professional**


---

## 🪪 License

Released under the [MIT License](LICENSE).

---
