Perfekt! Här är en färdig **Markdown-fil på engelska** med tydliga och pedagogiska instruktioner, inklusive mappstruktur, steg-för-steg flöde och hur teamet installerar hooks i sina egna utvecklingsrepo. Den kan sparas som `HOOKS_SETUP.md` i planning-repo.

```markdown
# Git Hooks Installation Guide

This guide explains how to install and use the shared Git hooks from the `planning` repository in your own project repository (backend, frontend, or embedded).

---

## 1. Prerequisites

Before installing hooks, ensure:

- Git is installed.
- You have cloned both your project repository and the `planning` repository.
- Backend: Python environment ready.
- Frontend: Node.js and npm installed (if applicable).
- Embedded: Build environment installed (if applicable).

---

## 2. Planning Repository Structure

Your planning repository should look like this:

```

ChasAdvancePlanning/
├── .githooks/
│   ├── pre-commit
│   └── commit-msg
├── install-hooks.sh
└── HOOKS\_SETUP.md

````

- `.githooks/` contains **only Git hook files**.  
- `install-hooks.sh` is the installer script.  
- `HOOKS_SETUP.md` is this documentation.  

> Note: No changes or `chmod` are needed in the planning repository itself.

---

## 3. Installing Hooks in Your Project Repository

**Before running the hooks, you need to install them in your project repo.** The installation will:

- Create a `.githooks/` folder in your project if it doesn't exist.
- Copy hook files from the planning repository.
- Make the hooks executable.
- Configure Git to use `.githooks/` in your project.

---

### Step-by-Step Instructions

1. **Navigate to your project repository** (backend, frontend, or embedded):

```bash
cd /path/to/your/project
````

2. **Run the install script from the planning repository**:

```bash
/path/to/planningRepository/install-hooks.sh
```

* This installs the hooks into your project automatically.

> Alternatively, you can specify your project explicitly and run it from anywhere:

```bash
/path/to/ChasAdvancePlanning/install-hooks.sh /path/to/your/project
```

---

### Project Repository Structure After Installation

After running the script, your project repository should look like this:

```
ChasAdvanceBackend/   (example)
├── app/
├── requirements.txt
├── README.md
└── .githooks/
    ├── pre-commit
    └── commit-msg
```

* `.githooks/` now contains the active hooks.
* Git is configured to use `.githooks/`.

---

## 4. Verifying Hooks

* Try committing a file with an invalid commit message:

```bash
git commit --allow-empty -m "wrong message"
```

* The commit should be rejected if the `commit-msg` hook is working.
* For backend projects, modify a file in `app/` that violates formatting or lint rules. The `pre-commit` hook should prevent the commit.

---

## 5. Updating Hooks

If hooks are updated in the planning repository:

```bash
cd /path/to/ChasAdvancePlanning
git pull

# Re-run the install script in your project
cd /path/to/your/project
/path/to/ChasAdvancePlanning/install-hooks.sh
```

---

## 6. Notes

* You only need to run the install script **once per project repository**, or whenever hooks are updated.
* Commit messages must follow **Conventional Commits** format:

```
type(optional-scope): description
```

**Allowed types:**

* `feat` → new feature
* `fix` → bug fix
* `docs` → documentation only
* `style` → formatting changes (no code logic)
* `refactor` → code changes that are not new features or fixes
* `test` → adding or updating tests
* `chore` → maintenance tasks (build, CI, dependencies)

**Example commit messages:**

```
feat: add login endpoint
fix(auth): handle expired JWT
docs(readme): update setup instructions
```
