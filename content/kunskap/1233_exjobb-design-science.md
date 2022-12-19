---
author: efo
revision:
    "2022-12-19": "(A, efo) Första utgåvan."
...
Design Science
==================================

I denna övning tittar vi på metoden _Design Science_ och hur den kan vara ett bra sätt att strukturera en studie där vi samtidigt utvecklar programvara.



<!--more-->



Metoden Design Science {#metod}
--------------------------------------




Metod best practices {#best-practices}
--------------------------------------

Vi lyfter ett antal _guidelines_ för att genomföra en _design science_ studie från [1]. Först beskrivs Guideline och sedan vart man kan hitta rekommendationen i artikeln.


| Guideline | Del av artikel |
|================|===============|
| [G1] Distinguish practical problems from knowledge questions | Section 2. In practical problems stakeholders desire to change the world, in knowledge questions the researcher desires to change his/her knowledge of the world. |
| [G2] Solve practical problems by the regulative cycle | Figure 1. |
| [G3] Distinguish problem investigation from design validation | Section 3. In problem investigation existing phenomena are investigated, in design validation the effects of an unimplemented design are predicted |
| [G4] Problem investigation may be problem-driven, solution-driven, goal-driven, or impact-driven | Section 3.1. In problem investigation, one or more of these tasks needs to be done: diagnose a problem, operationalize goals, check the validity of the design argument, or investigate the impact of realized implementations. |
| [G5] When designing a solution, maintain the design argument | Section 3.3. The causation part of the design argument says that the solution in a context will have certain effects, the valuation part says that these effects satisfy stakeholder criteria |
| [G6] When validating a design, consider trade-offs and sensitivity | Section 3.1. In trade-offs we vary the solution, in sensitivity analysis we vary the environment. |
| [G7] When validating a design, aim to incorporate conditions of practice | Section 5.3. Scale up from controlled conditions to realistic conditions. |
| [G8] When solving a knowledge question in the regulative cycle by means of research, no research method is banned. | Section 5.3. Research design must be justified, as anywhere else, in terms of research questions, the investigated domain and available resources to do the research. |



Och för att utvärdera de olika delar av vår design eller lösningen på problemet kan vi använda dessa metoder enligt [2].


| Del av studie | Sätt att utvärdera delen |
|================|===============|
| 1. Observational | **Case Study:** Study artifact in depth in business environment<br>**Field Study:** Monitor use of artifact in multiple projects |
| 2. Analytical | **Static Analysis:** Examine structure of artifact for static qualities (e.g., complexity)<br>**Architecture Analysis:** Study fit of artifact into technical IS architecture<br>**Optimization:** Demonstrate inherent optimal properties of artifact or provide optimality bounds on artifact behavior<br>**Dynamic Analysis:** Study artifact in use for dynamic qualities (e.g., performance) |
| 3. Experimental | **Controlled Experiment:** Study artifact in controlled environment for qualities (e.g., usability)<br>**Simulation:** Execute artifact with artificial data |
| 4. Testing | **Functional (Black Box) Testing:** Execute artifact interfaces to discover failures and identify defects<br>**Structural (White Box) Testing:** Perform coverage testing of some metric (e.g., execution paths) in the artifact implementation |
| 5. Descriptive | **Informed Argument:** Use information from the knowledge base (e.g., relevant research) to build a convincing argument for the artifact's utility<br>**Scenarios:** Construct detailed scenarios around the artifact to demonstrate its utility |



Metod referenser {#references}
--------------------------------------

[1] Wieringa, Roel. "Design science as nested problem solving." In Proceedings of the 4th international conference on design science research in information systems and technology, pp. 1-12. 2009.

[2] Hevner, Alan R., Salvatore T. March, Jinsoo Park, and Sudha Ram. "Design science in information systems research." MIS quarterly (2004): 75-105.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har tittat på metoden Design Science och hur vi strukturerat kan utvärdera programvara.
