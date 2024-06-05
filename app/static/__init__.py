import os
from pathlib import Path

# export the absolute path to the static folder
STATIC_PATH = Path(os.path.abspath(os.path.dirname(__file__)))
