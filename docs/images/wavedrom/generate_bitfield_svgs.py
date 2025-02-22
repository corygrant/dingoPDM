import os
import subprocess
    
# Use the full path to wavedrom-cli
WAVEDROM_PATH = r"C:\Users\cgrant\AppData\Roaming\npm\wavedrom-cli.cmd"  # Windows uses .cmd for npm global binaries
INKSCAPE_PATH = r"C:\Program Files\Inkscape\inkscape.com"  # Adjust this path if necessary

def clear_output_directory(output_dir):
    """
    Delete all files in the output directory.
    """
    # Check if the directory exists
    if not os.path.exists(output_dir):
        print(f"Output directory '{output_dir}' does not exist. Skipping cleanup.")
        return

    # Iterate over all files in the directory
    for file_name in os.listdir(output_dir):
        file_path = os.path.join(output_dir, file_name)
        try:
            # Delete the file
            os.remove(file_path)
            print(f"Deleted: {file_path}")
        except Exception as e:
            print(f"Error deleting {file_path}: {e}")
            
def invert_svg_colors(input_svg, output_svg):
    """
    Invert colors in an SVG file using Inkscape CLI.
    """
    # Command to invert colors
    command = [
        "inkscape",
        "--batch-process",
        f"--actions=EditSelectAllInAllLayers;org.inkscape.effect.filter.Invert.noprefs;export-filename:{output_svg};export-do;",
        input_svg
    ]

    # Run the command
    try:
        subprocess.run(command, check=True)
        print(f"Colors inverted successfully! Output saved to {output_svg}")
    except subprocess.CalledProcessError as e:
        print(f"Error inverting colors: {e}")
    except FileNotFoundError:
        print("Inkscape not found. Please ensure Inkscape is installed and added to your PATH.")
        
input_dir = ".\json"
output_dir = ".\waveforms"

clear_output_directory(output_dir)  # Clear the output directory before generating new files
os.makedirs(output_dir, exist_ok=True)

for file in os.listdir(input_dir):
    if file.endswith(".json"):
        input_path = os.path.join(input_dir, file)
        output_path = os.path.join(output_dir, os.path.splitext(file)[0] + ".svg")
        subprocess.run([WAVEDROM_PATH, "-i", input_path, "-s", output_path], capture_output=True)
        print(f"Generated {output_path}")
        
for file in os.listdir(output_dir):
    if file.endswith(".svg"):
        input_path = os.path.join(output_dir, file)
        output_path = os.path.join(output_dir, os.path.splitext(file)[0] + "_inverted.svg")
        invert_svg_colors(input_path, output_path)