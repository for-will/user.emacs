
(setq linux-c-style

      ((node-is "labeled_statement") column-0 0)

      (c-ts-mode--for-each-tail-body-matcher prev-line c-ts-mode-indent-offset)

      ((parent-is "translation_unit") column-0 0)

      ((query "(ERROR (ERROR)) @indent") column-0 0)

      ((node-is ")") parent 1)

      ((node-is "]") parent-bol 0)

      ((node-is "else") parent-bol 0)

      ((node-is "case") parent-bol 0)

      ((node-is "preproc_arg") no-indent)

      ((and (parent-is "comment") c-ts-common-looking-at-star) c-ts-common-comment-start-after-first-star -1)

      (c-ts-common-comment-2nd-line-matcher c-ts-common-comment-2nd-line-anchor 1)

      ((parent-is "comment") prev-adaptive-prefix 0)

      ((node-is "labeled_statement") standalone-parent 0)

      ((parent-is "labeled_statement") c-ts-mode--standalone-grandparent c-ts-mode-indent-offset)

      ((node-is "preproc") column-0 0)

      ((node-is "#endif") column-0 0)

      ((match "preproc_call" "compound_statement") column-0 0)

      ((n-p-gp nil "preproc" "translation_unit") column-0 0)

      ((and no-node (parent-is "\\(?:
\\|preproc\\)")) c-ts-mode--standalone-parent-skip-preproc c-ts-mode--preproc-offset)

      ((match nil "preproc_\\(?:\\(?:el\\)?if\\)" nil 3 3) c-ts-mode--standalone-parent-skip-preproc c-ts-mode-indent-offset)

      ((match nil "preproc_ifdef" nil 2 2) c-ts-mode--standalone-parent-skip-preproc c-ts-mode-indent-offset)

      ((match nil "preproc_else" nil 1 1) c-ts-mode--standalone-parent-skip-preproc c-ts-mode-indent-offset)

      ((parent-is "preproc") c-ts-mode--anchor-prev-sibling 0)

      ((parent-is "function_definition") parent-bol 0)

      ((parent-is "conditional_expression") first-sibling 0)

      ((parent-is "assignment_expression") parent-bol c-ts-mode-indent-offset)

      ((parent-is "concatenated_string") first-sibling 0)

      ((parent-is "comma_expression") first-sibling 0)

      ((parent-is "init_declarator") parent-bol c-ts-mode-indent-offset)

      ((parent-is "parenthesized_expression") first-sibling 1)

      ((parent-is "argument_list") first-sibling 1)

      ((parent-is "parameter_list") first-sibling 1)

      ((parent-is "binary_expression") parent 0)

      ((query "(for_statement initializer: (_) @indent)") parent-bol 5)

      ((query "(for_statement condition: (_) @indent)") parent-bol 5)

      ((query "(for_statement update: (_) @indent)") parent-bol 5)

      ((query "(call_expression arguments: (_) @indent)") parent c-ts-mode-indent-offset)

      ((parent-is "call_expression") parent 0)

      ((node-is "}") standalone-parent 0)

      ((match nil "initializer_list" nil 1 1) parent-bol c-ts-mode-indent-offset)

      ((parent-is "initializer_list") c-ts-mode--anchor-prev-sibling 0)

      ((match nil "enumerator_list" nil 1 1) standalone-parent c-ts-mode-indent-offset)

      ((parent-is "enumerator_list") c-ts-mode--anchor-prev-sibling 0)

      ((match nil "field_declaration_list" nil 1 1) standalone-parent c-ts-mode-indent-offset)

      ((parent-is "field_declaration_list") c-ts-mode--anchor-prev-sibling 0)

      ((or (match nil "compound_statement" nil 1 1) (match null "compound_statement")) standalone-parent c-ts-mode-indent-offset)

      ((parent-is "compound_statement") c-ts-mode--anchor-prev-sibling 0)

      ((node-is "compound_statement") standalone-parent c-ts-mode-indent-offset)

      ((match "expression_statement" nil "body") standalone-parent c-ts-mode-indent-offset)

      ((parent-is "if_statement") standalone-parent c-ts-mode-indent-offset)

      ((parent-is "for_statement") standalone-parent c-ts-mode-indent-offset)

      ((parent-is "while_statement") standalone-parent c-ts-mode-indent-offset)

      ((parent-is "do_statement") standalone-parent c-ts-mode-indent-offset)

      ((parent-is "case_statement") standalone-parent c-ts-mode-indent-offset)
      )
