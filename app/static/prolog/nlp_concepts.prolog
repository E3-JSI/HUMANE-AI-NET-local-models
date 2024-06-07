% Sections
isSection(regular_expressions).
isSection(text_normalization).
isSection(edit_distance).
isSection(regular_expressions_section).
isSection(words_section).
isSection(corpora_section).
isSection(word_tokenization_section).
isSection(word_normalization_section).
isSection(sentence_segmentation_section).
isSection(minimum_edit_distance_section).
isSection(words).
isSection(word_normalization_lemmatization_stemming).
isSection(sentence_segmentation).
isSection(minimum_edit_distance).

% Concepts
isConcept(regular_expression).
isConcept(concatenation).
isConcept(square_brackets).
isConcept(question_mark).
isConcept(kleene_star).
isConcept(kleene_plus).
isConcept(period).
isConcept(anchors).
isConcept(disjunction).
isConcept(parenthesis).
isConcept(precedence).
isConcept(greedy_matching).
isConcept(non_greedy_matching).
isConcept(word_boundary).
isConcept(substitution).
isConcept(capture_group).
isConcept(lookahead_assertion).
isConcept(text_normalization).
isConcept(tokenization).
isConcept(lemmatization).
isConcept(stemming).
isConcept(sentence_segmentation).
isConcept(edit_distance).
isConcept(minimum_edit_distance_algorithm).
isConcept(basic_regular_expression_patterns).
isConcept(disjunction_grouping_precedence).
isConcept(simple_example).
isConcept(more_operators).
isConcept(more_complex_example).
isConcept(substitution_capture_groups_eliza).
isConcept(lookahead_assertions).
isConcept(words).
isConcept(corpus).
isConcept(word_tokenization).
isConcept(simple_unix_tools_word_tokenization).
isConcept(top_down_tokenization).
isConcept(bottom_up_tokenization).
isConcept(byte_pair_encoding).
isConcept(word_normalization).
isConcept(case_folding).
isConcept(the_porter_stemmer).
isConcept(minimum_edit_distance).
isConcept(dynamic_programming).
isConcept('Basic Regular Expression Patterns').
isConcept('Disjunction, Grouping, and Precedence').
isConcept('A Simple Example').
isConcept('More Operators').
isConcept('A More Complex Example').
isConcept('Substitution, Capture Groups, and ELIZA').
isConcept('Lookahead Assertions').
isConcept('Simple Unix Tools for Word Tokenization').
isConcept('Word Tokenization').
isConcept('Top-down (rule-based) tokenization').
isConcept('Byte-Pair Encoding').
isConcept('Word Normalization').
isConcept('Case Folding').
isConcept('Lemmatization').
isConcept('Stemming').
isConcept('The Porter Stemmer').
isConcept('Minimum Edit Distance').
isConcept('The Minimum Edit Distance Algorithm').
isConcept('Dynamic Programming').


% Concepts part of sections
isPartOf(regular_expression, regular_expressions).
isPartOf(concatenation, regular_expressions).
isPartOf(square_brackets, regular_expressions).
isPartOf(question_mark, regular_expressions).
isPartOf(kleene_star, regular_expressions).
isPartOf(kleene_plus, regular_expressions).
isPartOf(period, regular_expressions).
isPartOf(anchors, regular_expressions).
isPartOf(disjunction, regular_expressions).
isPartOf(parenthesis, regular_expressions).
isPartOf(precedence, regular_expressions).
isPartOf(greedy_matching, regular_expressions).
isPartOf(non_greedy_matching, regular_expressions).
isPartOf(word_boundary, regular_expressions).
isPartOf(substitution, regular_expressions).
isPartOf(capture_group, regular_expressions).
isPartOf(lookahead_assertion, regular_expressions).
isPartOf(text_normalization, text_normalization).
isPartOf(tokenization, text_normalization).
isPartOf(lemmatization, text_normalization).
isPartOf(stemming, text_normalization).
isPartOf(sentence_segmentation, text_normalization).
isPartOf(edit_distance, edit_distance).
isPartOf(minimum_edit_distance_algorithm, edit_distance).
isPartOf(basic_regular_expression_patterns, regular_expressions_section).
isPartOf(disjunction_grouping_precedence, regular_expressions_section).
isPartOf(simple_example, regular_expressions_section).
isPartOf(more_operators, regular_expressions_section).
isPartOf(more_complex_example, regular_expressions_section).
isPartOf(substitution_capture_groups_eliza, regular_expressions_section).
isPartOf(lookahead_assertions, regular_expressions_section).
isPartOf(words, words_section).
isPartOf(corpus, corpora_section).
isPartOf(word_tokenization, word_tokenization_section).
isPartOf(simple_unix_tools_word_tokenization, word_tokenization_section).
isPartOf(top_down_tokenization, word_tokenization_section).
isPartOf(bottom_up_tokenization, word_tokenization_section).
isPartOf(byte_pair_encoding, word_tokenization_section).
isPartOf(word_normalization, word_normalization_section).
isPartOf(lemmatization, word_normalization_section).
isPartOf(stemming, word_normalization_section).
isPartOf(sentence_segmentation, sentence_segmentation_section).
isPartOf(minimum_edit_distance, minimum_edit_distance_section).
isPartOf(minimum_edit_distance_algorithm, minimum_edit_distance_section).
isPartOf(words, words).
isPartOf(corpus, words).
isPartOf(word_tokenization, words).
isPartOf(top_down_tokenization, words).
isPartOf(byte_pair_encoding, words).
isPartOf(word_normalization, word_normalization_lemmatization_stemming).
isPartOf(case_folding, word_normalization_lemmatization_stemming).
isPartOf(lemmatization, word_normalization_lemmatization_stemming).
isPartOf(stemming, word_normalization_lemmatization_stemming).
isPartOf(the_porter_stemmer, word_normalization_lemmatization_stemming).
isPartOf(sentence_segmentation, sentence_segmentation).
isPartOf(minimum_edit_distance, minimum_edit_distance).
isPartOf(minimum_edit_distance_algorithm, minimum_edit_distance).
isPartOf(dynamic_programming, minimum_edit_distance).

% Prerequisites among concepts
isPrerequisiteOf(regular_expression, concatenation).
isPrerequisiteOf(regular_expression, square_brackets).
isPrerequisiteOf(square_brackets, question_mark).
isPrerequisiteOf(regular_expression, kleene_star).
isPrerequisiteOf(kleene_star, kleene_plus).
isPrerequisiteOf(regular_expression, period).
isPrerequisiteOf(regular_expression, anchors).
isPrerequisiteOf(regular_expression, disjunction).
isPrerequisiteOf(disjunction, parenthesis).
isPrerequisiteOf(regular_expression, precedence).
isPrerequisiteOf(precedence, greedy_matching).
isPrerequisiteOf(greedy_matching, non_greedy_matching).
isPrerequisiteOf(regular_expression, word_boundary).
isPrerequisiteOf(regular_expression, substitution).
isPrerequisiteOf(substitution, capture_group).
isPrerequisiteOf(capture_group, lookahead_assertion).
isPrerequisiteOf(text_normalization, tokenization).
isPrerequisiteOf(tokenization, lemmatization).
isPrerequisiteOf(lemmatization, stemming).
isPrerequisiteOf(text_normalization, sentence_segmentation).
isPrerequisiteOf(edit_distance, minimum_edit_distance_algorithm).
isPrerequisiteOf(basic_regular_expression_patterns, disjunction_grouping_precedence).
isPrerequisiteOf(disjunction_grouping_precedence, simple_example).
isPrerequisiteOf(simple_example, more_operators).
isPrerequisiteOf(more_operators, more_complex_example).
isPrerequisiteOf(more_complex_example, substitution_capture_groups_eliza).
isPrerequisiteOf(substitution_capture_groups_eliza, lookahead_assertions).
isPrerequisiteOf(words, corpus).
isPrerequisiteOf(simple_unix_tools_word_tokenization, word_tokenization).
isPrerequisiteOf(word_tokenization, top_down_tokenization).
isPrerequisiteOf(word_tokenization, bottom_up_tokenization).
isPrerequisiteOf(bottom_up_tokenization, byte_pair_encoding).
isPrerequisiteOf(word_normalization, lemmatization).
isPrerequisiteOf(word_normalization, stemming).
isPrerequisiteOf(minimum_edit_distance, minimum_edit_distance_algorithm).
isPrerequisiteOf('Basic Regular Expression Patterns', 'Disjunction, Grouping, and Precedence').
isPrerequisiteOf('Disjunction, Grouping, and Precedence', 'A Simple Example').
isPrerequisiteOf('Basic Regular Expression Patterns', 'More Operators').
isPrerequisiteOf('Disjunction, Grouping, and Precedence', 'More Operators').
isPrerequisiteOf('Basic Regular Expression Patterns', 'A More Complex Example').
isPrerequisiteOf('Disjunction, Grouping, and Precedence', 'A More Complex Example').
isPrerequisiteOf('More Operators', 'A More Complex Example').
isPrerequisiteOf('A Simple Example', 'A More Complex Example').
isPrerequisiteOf('Substitution, Capture Groups, and ELIZA', 'Lookahead Assertions').
isPrerequisiteOf('Basic Regular Expression Patterns', 'Substitution, Capture Groups, and ELIZA').
isPrerequisiteOf('Disjunction, Grouping, and Precedence', 'Substitution, Capture Groups, and ELIZA').
isPrerequisiteOf('More Operators', 'Substitution, Capture Groups, and ELIZA').
isPrerequisiteOf('A More Complex Example', 'Substitution, Capture Groups, and ELIZA').
isPrerequisiteOf('Simple Unix Tools for Word Tokenization', 'Word Tokenization').
isPrerequisiteOf('Word Tokenization', 'Top-down (rule-based) tokenization').
isPrerequisiteOf('Simple Unix Tools for Word Tokenization', 'Top-down (rule-based) tokenization').
isPrerequisiteOf('Word Tokenization', 'Byte-Pair Encoding').
isPrerequisiteOf('Top-down (rule-based) tokenization', 'Byte-Pair Encoding').
isPrerequisiteOf('Word Tokenization', 'Word Normalization').
isPrerequisiteOf('Top-down (rule-based) tokenization', 'Word Normalization').
isPrerequisiteOf('Case Folding', 'Word Normalization').
isPrerequisiteOf('Word Normalization', 'Lemmatization').
isPrerequisiteOf('Case Folding', 'Lemmatization').
isPrerequisiteOf('Word Normalization', 'Stemming').
isPrerequisiteOf('Case Folding', 'Stemming').
isPrerequisiteOf('Stemming', 'The Porter Stemmer').
isPrerequisiteOf('Minimum Edit Distance', 'The Minimum Edit Distance Algorithm').
isPrerequisiteOf('Dynamic Programming', 'The Minimum Edit Distance Algorithm').

% Prerequisites among sections
isSectionPrerequisiteOf(none, regular_expression).
isSectionPrerequisiteOf(regular_expressions, text_normalization).
isSectionPrerequisiteOf(text_normalization, edit_distance).
isSectionPrerequisiteOf(regular_expressions_section, words_section).
isSectionPrerequisiteOf(words_section, corpora_section).
isSectionPrerequisiteOf(corpora_section, word_tokenization_section).
isSectionPrerequisiteOf(word_tokenization_section, word_normalization_section).
isSectionPrerequisiteOf(word_normalization_section, sentence_segmentation_section).
isSectionPrerequisiteOf(sentence_segmentation_section, minimum_edit_distance_section).
isSectionPrerequisiteOf('Regular Expressions', 'Words').
isSectionPrerequisiteOf('Words', 'Word Normalization, Lemmatization, and Stemming').
isSectionPrerequisiteOf('Word Normalization, Lemmatization, and Stemming', 'Sentence Segmentation').
isSectionPrerequisiteOf('Sentence Segmentation', 'Minimum Edit Distance').