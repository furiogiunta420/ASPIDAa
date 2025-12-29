import tkinter as tk
from tkinter import ttk

FILE_PATH = "sys.txt"

def load_info():
    try:
        with open(FILE_PATH, "r", encoding="utf-8") as file:
            return file.read()
    except FileNotFoundError:
        return "System info file not found."

# Main window
root = tk.Tk()
root.title("AspidaSysInfo")
root.geometry("600x400")
root.configure(bg="#0A0A0A")

# Style
style = ttk.Style()
style.theme_use("default")
style.configure(
    "TLabel",
    background="#0A0A0A",
    foreground="#81198D",
    font=("Segoe UI", 11)
)

style.configure(
    "Header.TLabel",
    font=("Segoe UI", 18, "bold")
)

# Header
header = ttk.Label(root, text="System Information", style="Header.TLabel")
header.pack(pady=15)

# Frame for text + scrollbar
frame = tk.Frame(root, bg="#81198D")
frame.pack(fill="both", expand=True, padx=20, pady=10)

scrollbar = tk.Scrollbar(frame)
scrollbar.pack(side="right", fill="y")

text = tk.Text(
    frame,
    wrap="word",
    bg="#0A0A0A",
    fg="#81198D",
    font=("Consolas", 11),
    relief="flat",
    yscrollcommand=scrollbar.set
)
text.pack(fill="both", expand=True)

scrollbar.config(command=text.yview)

# Insert data
info = load_info()
text.insert("1.0", info)
text.config(state="disabled")  # Read-only

# Run app
root.mainloop()
