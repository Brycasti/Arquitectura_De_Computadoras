# Librerias
import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox

# Definir los opcodes y registros
INSTRUCTION_SET = {
    'ADD': '100000',
    'SUB': '100010',
    'SLT': '101010',
    'AND': '100100',
    'OR': '100101',
    'XOR': '100110',
    'NOR': '100111',
}

REGISTERS = {
    '$0': '00000',
    '$1': '00001',
    '$2': '00010',
    '$3': '00011',
    '$4': '00100',
    '$5': '00101',
    '$6': '00110',
    '$7': '00111',
    '$8': '01000',
    '$9': '01001',
    '$10': '01010',
    '$11': '01011',
    '$12': '01100',
    '$13': '01101',
    '$14': '01110',
}

# Interfaz
def create_gui():
    window = tk.Tk()
    window.title("Decoder")
    window.geometry("300x400")

    # Button1 - Importar Archivo
    button1 = tk.Button(window, text="Import File", command=select_file)
    button1.pack(pady=10)

    # Button2 - Guardar Archivo
    button2 = tk.Button(window, text="Save File", command=save_file)
    button2.pack(pady=10)

    # Button3 - Convertir
    button3 = tk.Button(window, text="Analyze", command=analyze_text)
    button3.pack(pady=10)

    # Button4 - Exit
    button4 = tk.Button(window, text="Exit", command=window.quit)
    button4.pack(pady=10)

    global text_area
    text_area = tk.Text(window)
    text_area.pack(pady=10)

    window.mainloop()

# Guardar el Contenido
file_content = ""

# Seleccionar Archivo
def select_file():
    global file_content
    file = filedialog.askopenfilename(
        filetypes=[("Text File", "*.txt")],
        title="Select File"
    )
    if file:
        with open(file, 'r', encoding='utf-8') as f:
            # Leer
            file_content = f.readlines()

        # Mostrar 
        text_area.delete('1.0', tk.END)
        for line_num, line in enumerate(file_content, start=1):
            text_area.insert(tk.END, f"Line {line_num}: {line}")

    else:
        messagebox.showerror("Error", "No file selected.")

# Convertir a binario
def convert_to_machine_language(line):
    parts = line.split()
    if len(parts) == 4:  # Instrucciones tipo R
        op = "000000"  # Siempre 000000 para tipo R
        shamt = "00000"  # Siempre 00000 para tipo R
        funct = INSTRUCTION_SET.get(parts[0], '??????')
        rs = REGISTERS.get(parts[2], '?????')
        rt = REGISTERS.get(parts[3], '?????')
        rd = REGISTERS.get(parts[1], '?????')
        return f"{op}_{rs}_{rt}_{rd}_{shamt}_{funct}"
    else:
        return "Invalid instruction format"

# Guardar Convertido
converted_text = ""

# Analizar Archivo
def analyze_text():
    global file_content, converted_text
    if file_content:
        # Clear
        text_area.delete('1.0', tk.END)
        converted_text = ""

        # Convertir por linea
        for line_num, line in enumerate(file_content, start=1):
            machine_code = convert_to_machine_language(line.strip())
            converted_text += f"{machine_code}\n"
            text_area.insert(tk.END, f"{machine_code}\n")
    else:
        messagebox.showerror("Error", "No file loaded to analyze.")

# Guardar Archivo
def save_file():
    global converted_text
    if converted_text:
        save_path = filedialog.asksaveasfilename(defaultextension=".txt", filetypes=[("Text File", "*.txt")])
        if save_path:
            with open(save_path, 'w', encoding='utf-8') as f:
                f.write(converted_text)
            messagebox.showinfo("Success", f"File saved as {save_path}")
    else:
        messagebox.showerror("Error", "No content to save.")

if __name__ == "__main__":
    create_gui()


