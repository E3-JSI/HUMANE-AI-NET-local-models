from typing import List
from langchain_openai import OpenAI


def wiki_concept_mapping( model='gpt-4o'):
    llm = OpenAI(model=model,
                 model_kwargs={"response_format": {"type": "json_object"}})
    prompt = PromptTemplate.from_template()