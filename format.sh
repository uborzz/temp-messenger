LINEWIDTH=88

FILEPATH=$1

if [ -f "$FILEPATH" ] || [ -d "$FILEPATH" ]; then
    echo Formating path: $FILEPATH
    python -m black $FILEPATH
    python -m flake8 --max-line-length $LINEWIDTH $FILEPATH
    python -m isort -rc $FILEPATH
else
    echo $FILEPATH not found
fi
