# Lectures

Weekly lecture materials organized by week.

## Structure
```
lectures/weekXX/
├── README.md      # Learning objectives
├── slides/        # LaTeX presentations
├── notebooks/     # Jupyter tutorials
└── quizzes/       # ExamGPT (.json) + Moodle (.xml)
```

## Notebook Requirements

**Purpose**: Educational tutorials with hands-on coding practice.

**Must Include**:
1. Learning objectives
2. Concept explanations with examples
3. Step-by-step code tutorials
4. Coding exercises (fill-in-the-blank or build a function)
5. Test cells to verify solutions

**Must NOT Include**: Quiz questions (use ExamGPT/Moodle)

**Placeholder Convention**: Use `None` for student fill-ins:
```python
def calculate_average(df):
    result = None  # TODO: Replace None with df['age'].mean()
    return result
```

## Naming Convention
- Slides: `SE446_W0XY_topic.tex`
- Notebooks: `SE446_W0XY_topic.ipynb`
- ExamGPT: `SE446_W0X_quiz.json`
- Moodle: `SE446_W0X_quiz.xml`
