---
title: "Rubric for homework grades"
subtitle: "[Math 4450, Fall 2025](index.html)"
output: html_document

---

-----------

Each homework report receives a numerical score for Contribution (9 points) and Academic Integrity (1 points).

## Rationale

This semester, Math 4450 permits and encourages students to take full advantage of all sources, including collaboration, for homework assignments. 
We follow the same principles of transparency and citation of sources that apply in scientific research. 
In extreme cases, failure to credit sources can amount to plagiarism. 

You can use as many or as few sources as you like, but you are responsible for making clear what sources you used for each part of your homework report (or being explicit if you used none).
The grading scheme is intended to reward homework reports which demonstrate both good scholarship and demonstration that thought was applied beyond the sources used.

------------

## Academic Integretiy (1 points)

A **source** is anything or anyone you consulted (including classmates or office hours or any website you visited) to help you write or check your answers.

(1 points). The homework is explicit about what sources were and were not used. The reader can easily tell which parts of the homework relate to which of the listed sources. This is usually done by citing the source at each point it was used, and listing the full reference at the beginning of of the assignment. Collaborations can also be mentioned in an acknowledgment section at the end of the report.

(0 points). Failure to list sources explicitly, even if just to say that none were used. Since credit is assigned for being explicit about sources it is necessary also to be explicit about lack of sources. Otherwise, the grader cannot tell the difference between failure to list sources and the possibility that the work was done entirely independently of the notes, the internet and all colleagues.

In addition, failure to list any resources / collaborations that were used will be considered a direct violation of ISU's academic integrity policy:

> "The Idaho State University academic dishonesty policy allows an instructor to impose one of several penalties for cheating that range from a warning up to assigning a failing grade for the course or dismissal from the University."

### Notes


1. If you choose to carry out your homework independently and then check it against your colleagues or internet sources, you should do the following: (i) explain that this was your approach; (ii) explain where you got to by yourself; (iii) explain what changes you made after consulting sources. If done well, this can be a good strategy for homework. **If you are transparent about the extent of your own engagement with the problems, and that contribution is small, you may lose points**. However, if a major discrepancy is identified between what you say you did and what you actually did, that is an academic integrity issue.

1. A good report needs to show evidence of contributing beyond the sources used.  It should be clear that a good homework report demonstrates a reasonable level of thought and effort concerning the topic under investigation. It is your responsibility to demonstrate to the reader, in a transparent and unambiguous way, evidence that you thought carefully about the problem at hand. The simplest way to do that is (i) think about the problem; (ii) write about what you thought; (iii) include in your writing an explanation of what you have learned from what others have thought and written.

1. You are permitted to comment on sources (including previous solutions) in your own solutions. This is one way to show an independent contribution.

1. Directly copied text must be in quotation marks. Directly copied equations must be explicitly referenced to the source. Adapted or paraphrased material take from a source should be referenced.

1. If it becomes clear that your homework or project has benefited substantially from undisclosed sources, that is a serious academic integrity issue. Consequences can be severe. You will not necessarily receive any other warning, beyond this one. 

1. Scholarship points may be removed retroactively if at some later point it becomes clear that unattributed sources were being used.

1. For your own protection, you are advised to be careful to acknowledge any interaction with online sources (even a brief read, if you subsequently edit your report). Similarly, acknowledge any discussion with other people which contributes to your report.

1. If the grader has to carry out detective work to figure out which parts of your report come from what source, then you can expect to lose points. Your acknowledgement of sources should be transparent and easy to read. This is usually carried out by listing sources at the end of the homework report and citing them where relevant in the main text.

-----------

## Contribution (9 points)

This is standard homework grading except for an additional requirement to demonstrate contribution of original effort beyond any source you use.

(9 points). All solutions are correct. If checked against a source, the homework is explicit about how the individual solution differs from the source and what (if anything) was learned from the source. The student has found a way to show that they contributed beyond any source used. In particular, the two should not look too similar---by consulting a source, you acquire an obligation to differentiate your own work, which could be by adding original material relevant to the question and going beyond the source.

Points are subtracted for each error or omission or failure to explain a contribution beyond the sources used. 

------------

## Example 1: No sources used

If you did not use any sources (outside of the lecture slides and textbook), you should include a statement like the following in your homework submission:

> "For this homework assignment, I did not consult any outside sources to help me obtain my homework solutions. All responses reflect my own work and academic contribution."

------------

## Example 2: Used outside sources (friend, internet, or AI)

**Remember that before using any outside sources, you are asked to work on each problem for at least one hour.**

Now suppose you were working on the following problem:

1. Show that $p(k) = \frac{\lambda^ke^{-\lambda}}{k!}, k \geq 0$ is a valid probability mass function.

As you're solving this problem, you will likely run into a calculus problem:
$$
\sum_{k = 0}^\infty p(k) = e^{-\lambda} \sum^{\infty}_{k = 0} \frac{\lambda^k}{k!}.
$$
In this particular instance, there are a few things you could do to solve this problem, some are acceptable and some are unacceptable.
For instance,

1. **Not acceptable**: You might recognize that $p(k)$ is the pmf of a Poisson random variable. **You cannot** search (or ask AI): "how to show that the Poisson random variable integrates to one", or "how to show that the Poisson distribution has valid pmf?". If you do this, you may loose **contribution** points, even if you include an appropriate academic integrity statement.

1. **Acceptable**: You remember that the sum of all pmf's over their support must be equal to $1$. Hence, you deduce that 
$$
e^{-\lambda} \sum^{\infty}_{k = 0} \frac{\lambda^k}{k!} = 1,
$$
or that 
$$
\sum^{\infty}_{k = 0} \frac{\lambda^k}{k!} = e^{\lambda}.
$$
Fundamentally, the latter fact is a calculus problem, not statistics. In this case, you might search: "What is the Taylor Series expansion for $e^x$?", and then the response can help you solve the original problem.

If you did the **Acceptable** option, then you should something similar to the following academic integrity statement in your homework: 

> "I worked on problem (1) for at least one hour, but got stuck because I couldn't figure out how to show the infinite sum had value $e^{-\lambda}$. I eventually (went to office hours / asked a friend / searched the internet) for help, which reminded me about this particular expansion."

If a website was used, **you also need to include a link to the website**. If generative AI is used (e.g. ChatGPT), **you need to include the prompt that you submitted, and the output**.

------------

## Bonus points: LaTeX submissions

I will give 0.5 bonus points on each assignment if you meet the following conditions:

1. A response to all homework questions has been given
1. You have an appropriate Academic Integrity statement
1. You have typed all of your responses in LaTeX 

For each homework assignment, I'll provide a simple template that you can use as a starting point for your homework submission.
You can use generative-AI to help with formatting your LaTeX responses.



