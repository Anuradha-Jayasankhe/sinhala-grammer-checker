% Subjects (pronouns)
subject([ma]).   % I (singular)
subject([ohe]).  % You (singular)
subject([ape]).  % We (plural)
subject([oya]).  % He or She (singular)
subject([eka]).  % It (singular)
subject([eha]).  % They (plural)

% Objects
object([pothe]).   % book
object([kaame]).   % food
object([balla]).   % dog
object([gasa]).    % tree

% Verbs (present tense)
verb([yanava]).      % go
verb([karanava]).    % do
verb([gannava]).     % take
verb([balanava]).    % look
verb([kiyanava]).    % say

% Verbs (past tense)
verb_past([giya]).      % went
verb_past([kalaya]).    % did
verb_past([gaththa]).   % took
verb_past([baluwa]).    % looked
verb_past([kiwwa]).     % said

% Singular subject with singular verb
singular_subject([ma]).
singular_subject([ohe]).
singular_subject([oya]).
singular_subject([eka]).

singular_verb([yanava]).
singular_verb([karanava]).
singular_verb([gannava]).
singular_verb([balanava]).
singular_verb([kiyanava]).

% Plural subject with plural verb
plural_subject([ape]).
plural_subject([eha]).

plural_verb([yamu]).   % go (plural)
plural_verb([karamu]). % do (plural)
plural_verb([gannamu]). % take (plural)
plural_verb([balamu]).  % look (plural)
plural_verb([kiyamu]).  % say (plural)

% Sentence structure: Subject + Verb
sentence(Sentence) :-
    subject(Subject),
    verb(Verb),
    append(Subject, Verb, Sentence).

% Sentence structure: Subject + Verb + Object
sentence(Sentence) :-
    subject(Subject),
    verb(Verb),
    object(Object),
    append(Subject, VerbPart, Sentence),
    append(Verb, Object, VerbPart).

% Past tense sentence structure: Subject + Verb (past tense)
sentence(Sentence) :-
    subject(Subject),
    verb_past(VerbPast),
    append(Subject, VerbPast, Sentence).

% Past tense sentence structure: Subject + Verb (past tense) + Object
sentence(Sentence) :-
    subject(Subject),
    verb_past(VerbPast),
    object(Object),
    append(Subject, VerbPart, Sentence),
    append(VerbPast, Object, VerbPart).


% Check singular subject-verb agreement
subject_verb_agreement(Sentence) :-
    singular_subject(Subject),
    singular_verb(Verb),
    append(Subject, Verb, Sentence).

% Check plural subject-verb agreement
subject_verb_agreement(Sentence) :-
    plural_subject(Subject),
    plural_verb(Verb),
    append(Subject, Verb, Sentence).

% Check if the sentence is grammatically correct (SVO structure)
check_grammar(Sentence) :-
    sentence(Sentence),
    subject_verb_agreement(Sentence),
    write('Sentence is grammatically correct.'), !, nl.

% Invalid sentence
check_grammar(_) :-
    write('Sentence is grammatically incorrect.'), nl.
