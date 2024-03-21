# Incident Response Guide
=======

## What is an incident?

An incident is an issue with a production system where any of
the following is true:

* There may be visible impact for customers
* You need to involve a second team/squad to fix the problem
* The issue is unresolved after an hour of concentrated analysis
* There may be significant financial impact

> It's better to declare an incident early and to find a simple fix, than to
> defer and spin up a larger incident later.

## What is incident response?

Incident response is a broad term which describes the set of processes that we
may (if applicable) follow when something unexpected happens.

In addition to seeking to resolve the symptoms of the issue, these processes
cover:

* Clearly defining roles and responsibilities and bringing the right people
  together
* Communicating internally and externally
* Keeping track of what’s going on during the incident and preserving evidence
  to allow us to follow up
* Creating data and preserving evidence that allows us to understand why
  incidents occur and how we can avoid them in the future

Incidents can be high pressure, our processes ensure we do the right thing
quickly and calmly. Good processes are intuitive and develop muscle memory that
helps make responding become a low stress part of our work that everyone is
happy to contribute to.


## Roles within Incident Response
The following roles can be delegated to others during the life of an incident,
either to handle long-running incidents or to transfer the roles to someone
better placed to respond and to provide continuity of ownership. You may only
let go of a role when the person stepping into the role has acknowledged that
they have taken over.

These roles give full power and autonomy to those performing the roles. If you
are not also working an incident, it is assumed that you will give your support
if called upon by an Incident Commander — declaring an incident grants the
ability to the Incident Commander to commandeer any person within the company at
any level to help contribute towards the resolution of the incident.

### Investigator
An Investigator owns the diagnosis and resolution of the symptoms of the
incident whilst communicating to the incident commander.

An Investigator must:
* Determine degree of impact and the customers and/or systems impacted
* Identify temporary or permanent fixes to stop the bleeding whilst preserving
  evidence for what has occurred
* Identify temporary or permanent fixes to the root cause and deploy the most
  suitable solution
* Contributes to the PIR (Post Incident Review) and follow-up
* Produce one or more hypotheses to isolate a root cause, prove/disprove each
  hypothesis until we have confidence in one

An incident has a single named investigator to ensure clear ownership, but other
engineers may assist as additional investigators if the incident requires it,
this is typically the case where the incident involves more than one squad or
the investigator asks for assistance.


### Incident Commander
An Incident Commander who will guide incident response to ensure that we are
coordinating, communicating, and documenting by shielding and supporting the
Investigator

An Incident Commander must:
* Keeps the incident moving towards a resolution.
* Simplifies the Investigators’ communication to just the incident channel by
  broadcasting important moments when appropriate
* Helps with prioritization of tasks to ensure that we stop the bleeding,
  restore service, and preserve evidence for root-causing
* Provides escalation and resourcing support to ensure that the right people are
  brought together or access to systems is obtained
* Creates an Incident Command Room as a video conference (Zoom or Meet) and
  ensures the Investigator is present and that the video is open and shared
  internally
* Documents progress to facilitate coordination, handover, and a timely PIR
  (Post Incident Review) document
* Writes the internal PIR (Post Incident Review) and notifies the Customer
  Support Engineer when it is ready

An Incident Commander’s job is to keep the incident moving toward resolution.
But an Incident Commander’s job is not to fix the problem, the Investigator is
the one who is working to resolve the incident through a temporary or permanent
solution (whichever brings the incident to a resolution soonest).

## Declaring an incident

Goals:
* Communicate that an incident has begun
* Determine an initial severity (can be adjusted later on)
* Fill the Incident Commander and Investigator roles
* Bring all communication about an incident to a single Slack channel

Steps:

> TODO: DEFINE HOW INCIDENT REPORTING WORKS IN YOUR ORGANIZATION

Steps for the on-call engineer (who now becomes the Investigator):
0. Assign an initial severity by using the following criteria and until you know
   otherwise assume the higher severity if this is unclear:
0. Create the incident using Grafana Incident
0. Assign yourself to the Investigator role within Grafana Incident
0. Identify an Incident Commander and assign that role within Grafana Incident

Steps for the Incident Commander:

The Incident Commander should direct all existing conversation to the new
incident channel. Anyone participating in a conversation about an incident
should also move their conversation to the incident channel at the earliest
opportunity. The Investigator should start sharing what they know at the point.

By default:
* The on-call engineer becomes the Investigator
* If on-call is not available then the secondary becomes the Investigator
* Secondary on-call becomes the Incident Commander
* If the secondary is not available Look for an online member of the appropriate
  squad first

## During an incident
Resolve the incident, whilst communicating to all parties and documenting what
we did and why.

Goals:
* Stop the bleeding, restore service, and preserve evidence for root-causing in
  a PIR (Post Incident Review) document
* Communicate internally and document where we are now
* Communicate externally to provide visibility to customers on something that
  may be affecting them

> Prioritize mitigation of the symptoms of the incident over fixing the issue in
> a permanent way within the handling of the incident. The goal is the shortest
> time to mitigate the impact that the incident produces whilst preserving
> evidence that aids the investigation.

Steps for the Incident Commander:

* First determine the present status, what is known

Then repeat these steps until the incident is resolved:

0. Ensure that the Investigator has whatever they need, make it your priority to
   get them whatever they need
0. Offer support to the Investigator to assist in prioritizing tasks, proposing
   hypotheses and debugging steps if appropriate
0. Insulate the Investigator from others, give them space

Steps for the Investigator:

0. Identify and engage an Incident Commander if you have not already done so
0. Follow a runbook if one exists, if not use your experience to debug or ask
   for help if you feel stuck.
0. Communicate to the Incident Commander via the incident channel any actions
   taken, dashboards that show the problem, what you’re working on now and why.
   Listen for direction, and feel free to change direction
0. Periodically introspect on your emotional state; if you feel panicky or
   overwhelmed, ask the Incident Commander for more support

When the impact has been mitigated and we have “stopped the bleeding” then the
incident in Grafana Incident should be marked as resolved. It is likely that you
still need to do a little work to tidy up any actions that you were working on.

An Investigator can delegate tasks to other individuals, however the
Investigator remains the owner of the investigation and other involved
individuals should work to support the Investigator.
## After an incident
Determine whether the root cause was fully identified, plan follow-up tasks that
will ensure that this incident won’t recur. Communicate internally and
externally as needed

Goals:
* Incidents happen, did we understand what happened and what steps are we taking
  to ensure it doesn’t happen again?
* If we learned something, did we communicate it to others?
* If a customer was impacted, have we communicated the impact to them?

Steps for the Incident Commander:
* Ensure the PIR (Post Incident Review) document is complete and accurate within
  1 working day of the incident
  > TODO LINK YOUR TEMPLATE HERE
* Ensure follow up actions have been identified and have been added to
  appropriate systems (Trello, Github, etc) and linked from the PIR (Post
  Incident Review) document
* Good follow up actions should address the root cause identified and in complex
  incidents may also address other factors that contributed to the incident.
* If an incident warrants it (non-trivial) then schedule a PIR meeting to review
  the PIR document and dive into the root cause and follow up actions

Steps for the Investigator:
* Support the Incident Commander in producing the incident report (they write
  most of it, but will need lots of input from yourself to complete their
  understanding)

Responsibility for the incident report is with the Incident Commander who should
know, at a high level, what happened and when.
