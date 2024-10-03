from os import open, close, dup, O_WRONLY

from pyswip import Prolog

from es.data import getdata

prolog = Prolog()
prolog.consult('es/kb.pl')


def translate_to_prolog_query(verbal_query):
    return "check_grammar([" + verbal_query + "])."


def remove_special_chars(input_str: str) -> str:
    input_str = input_str.replace('\n', '') 
    input_str = input_str.replace('.', '') 
    input_str = input_str.replace(',', ' ') 
    input_str = input_str.replace('?', ' ') 
    return input_str


def process_user_query(query: str):
    prolog_query = translate_to_prolog_query(query)

    old = dup(1)
    close(1)
    open("es/data.txt", O_WRONLY)

    results = list(prolog.query(prolog_query))

    close(1)
    dup(old)  # should dup to 1
    close(old)  # get rid of leftovers

    results.append(getdata())

    # Apply remove_special_chars to each result
    for i in range(len(results)):
        if isinstance(results[i], dict):
            for key in results[i]:
                results[i][key] = remove_special_chars(results[i][key])
        elif isinstance(results[i], list):
            results[i] = [remove_special_chars(item) for item in results[i]]
        else:
            results[i] = remove_special_chars(results[i])

    return results
