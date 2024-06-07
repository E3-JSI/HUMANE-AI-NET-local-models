from typing import List

from langchain_core.output_parsers import JsonOutputParser
from langchain_core.prompts import PromptTemplate
from langchain_core.runnables import Runnable
from langchain_openai import ChatOpenAI

# TODO:
wiki_concept_prompt = PromptTemplate.from_template(
"""You will be given a concept from the domain of {domain} and you will have to match it to the closest the corresponding Wikipedia Concept or Concepts (max 3) from the list below.
The list of Wikipedia Concepts you can choose from are:
{wiki_concepts}

The concept you have to map is: {concept}
Respond in the JSON format, e.g.
{{
    wikipedia_concepts: ["Concept 1", "Concept 2"]
}}
""")


def wiki_concept_mapping( model='gpt-4o') -> Runnable:
    llm = ChatOpenAI(model=model,
                 model_kwargs={"response_format": {"type": "json_object"}})

    chain = (
        wiki_concept_prompt
        | llm
        | JsonOutputParser()
    )

    return chain
