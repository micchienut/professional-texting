# tact

> **Write it yourself. Understand why. Make it better.**

tact is an iOS app that helps users improve their professional messages through **feedback and suggestions**, rather than automatically rewriting their messages.

The goal is simple:

> Instead of giving people the “perfect” message, help them learn how to write one themselves.

---

## The Problem

Texting a professor, mentor, coworker, client, or someone in a higher position can be surprisingly difficult.

For example:

> “Dear Professor, can you send the document ASAP?”

The message is understandable, but:

- Is it polite enough?
- Is “ASAP” appropriate?
- Is the request clear?
- Is the message written professionally?

Many people become dependent on others—or AI tools—to rewrite their messages for them.

tact explores a different approach: **give users feedback on their own writing so they can improve it themselves.**

---

## What is tact?

Tact evaluates a user's message across four competencies:

| Competency | What tact evaluates |
|---|---|
| **Clarity** | Is the intended meaning clear and unambiguous? |
| **Conciseness** | Is the message direct without unnecessary or repetitive wording? |
| **Politeness** | Is the tone appropriate for professional communication? |
| **Capitalization & Punctuation** | Does the message follow standard writing conventions? |

For each competency, tact provides:

- An evaluation
- An explanation of the issue
- Suggestions for improvement

The user can then improve their original message and evaluate it again.

**tact does not automatically rewrite the entire message.**

---

## ✨ Features

### 📝 Message Evaluation

Write or paste a message and receive feedback based on four professional communication competencies.

### 💡 Actionable Suggestions

Instead of simply saying that something is wrong, tact explains **why** it could be improved and suggests what the user can change.

### 🔄 Learn Through Iteration

Users can modify their own message and evaluate it again, encouraging active learning rather than passive acceptance of an AI-generated rewrite.

### ⚡ App Intents & App Shortcuts

tact can be accessed through App Intents and App Shortcuts, allowing users to evaluate messages without having to open the app first.

The Shortcut experience provides a compact result, while the main app provides the full evaluation and detailed feedback.

---

# 🤖 AI & Foundation Models

tact is currently powered by **Apple's Foundation Models**, allowing the evaluation to run locally on-device.

This project has also been a hands-on exploration of how to integrate language models into an iOS application.

## Learning Journey

### 1. Raw Text Generation

The first implementation used a `LanguageModelSession` and asked the model to evaluate a message using a plain `String` response.

Conceptually:

```text
User message
     ↓
LanguageModelSession
     ↓
Model raw response
     ↓
Display result
```
This worked, but it introduced several problems:
- Inconsistent output
- Missing evaluations (not all competencies are returned)
- Unstable scoring
- Difficulty reliably parsing model responses
- Occasional rewriting despite instructions

This led to the next step.

### 2. Structured Generation with `@Generable`
tact was then migrated to structured generation using `@Generable`.
The model now generates a predefined structure containing:
```
EvaluationStructure
│
├── Overall assessment
│
└── Competencies
    ├── Clarity
    ├── Conciseness
    ├── Politeness
    └── Capitalization & Punctuation
```
Each competency contains:
- Status
- Competency
- Summary
- Suggestions

This makes the model output much easier for the SwiftUI application to consume and display.

### 3. 🧠 Prompt Engineering Experiments
Because structured output alone did not completely solve the evaluation consistency problem, different prompting strategies were tested.
#### Zero-shot
The model receives instructions without examples.
```
Instructions
     +
User message
     ↓
Model
     ↓
Evaluation
```
##### Observation
Zero-shot prompting can work, but the model may have too little task-specific guidance, especially for consistently returning all four competencies.

#### One-shot
The model receives the instructions plus one complete example.
```
Instructions
     +
One example
     +
User message
     ↓
Model
     ↓
Evaluation
```
##### Observation
**One-shot prompting currently provides the best balance for tact.**\
It gives the model a concrete example of the expected behavior without making the prompt excessively dependent on examples.

#### Few-shot
The model receives multiple complete examples.
```
Instructions
     +
Example 1
     +
Example 2
     +
Example 3
     +
User message
     ↓
Model
     ↓
Evaluation
```
##### Observation
Few-shot prompting provides more guidance, but can become more dependent on the specific examples provided.
For this use case, additional examples did not necessarily produce better results.

#### Prompting Experiment Summary
| Strategy  | Guidance | Main Observation                    |
| --------- | -------- | ----------------------------------- |
| Zero-shot | Low      | Can lack task-specific guidance     |
| One-shot  | Medium   | **Best balance in current testing** |
| Few-shot  | High     | Can become more example-dependent   |

> **Current finding**: One-shot prompting achieved the best balance in my manual QA testing for tact.
_This is a project-specific finding rather than a claim that one-shot prompting is universally better._

### 4. 🧪 Evaluation & Manual QA
Since language model output is not always deterministic, tact is evaluated through manual QA.

The evaluation focuses on:
- **Completeness**\
Does the model return all four competencies?
- **Classification Accuracy**\
Does the model correctly identify whether a competency:
  - Needs improvement
  - Is already good
- **Explanation Quality**\
Does the explanation accurately describe the issue?
- **Suggestion Quality**\
Are suggestions:
  - Relevant?
  - Actionable?
  - Based on the original message?
  - Free from invented information?
- **Instruction Following**\
Does the model follow constraints such as:
  - Not rewriting the entire message
  - Not introducing information that wasn't provided
  - Evaluating all four competencies

### 5. ⚡ App Intents & Shortcuts
tact also explores Apple's App Intents framework.\
The architecture is designed so that the AI evaluation logic is shared between the main app and the Shortcut:
```
                 ┌──────────────────┐
                 │ FoundationModel  │
                 │    Service       │
                 └────────┬─────────┘
                          │
                  EvaluationStructure
                          │
             ┌────────────┴────────────┐
             │                         │
             ▼                         ▼
        SwiftUI App              App Intent
             │                         │
             ▼                         ▼
       Detailed result          Quick feedback
```
The main app provides the full learning experience, while the Shortcut provides a faster way to access the evaluation.\
This follows a progressive disclosure approach:
> Shortcut → quick feedback\
App → detailed learning

### 🛠 Tech Stack
Swift\
SwiftUI\
Foundation Models\
App Intents\
App Shortcuts\
Xcode\
Git & GitHub

### 🔬 Future Experiments
The current implementation uses Apple's Foundation Models, but the project will be extended to compare different language models.
Planned comparison:
```
Foundation Models
        │
        ├─────────────┐
        │             │
       GPT          Gemini
        │             │
        └──────┬──────┘
               ▼
        Same test cases
               │
               ▼
       Evaluation results
```
The comparison will consider:
- Completeness
- Evaluation accuracy
- Consistency
- Feedback quality
- Suggestion quality
- Instruction following
- Latency
- Privacy / on-device capabilities
  
The goal is not simply to determine which model is “best”, but to understand which model is most suitable for this particular use case.

# 🚀 Current Status
Tact currently:\
✅ Evaluates professional messages\
✅ Uses four communication competencies\
✅ Uses structured Foundation Models output\
✅ Supports one-shot prompting\
✅ Runs locally using Apple's Foundation Models\
🔄 Supports App Intents (can be improved)\
🔄 Supports App Shortcuts (can be improved)\
🔄 Experimenting with prompt strategies\
🔄 Comparing different language models\
🔄 Improving evaluation consistency and feedback quality
