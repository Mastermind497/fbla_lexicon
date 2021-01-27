import 'dart:math';

import '../models/question.dart';
import 'utils.dart';

// https://www.fbla-pbl.org/media/accounting_i_online_ref_guide.pdf
final List<QuestionData> questionList = [
  // Accounting 1
  MultipleChoiceQuestionData(
    idNumber: 0,
    question:
        'A special journal used to record only cash receipt transactions is:',
    choices: AnswerChoice.of(
      [
        'a purchases journal',
        'a cash journal',
        'a sales journal',
      ],
      'a cash receipts journal',
    ),
    event: Event.accountingI,
  ),
  MultipleChoiceQuestionData(
    idNumber: 1,
    question: 'The amount of goods on hand for sale to customers is:',
    choices: AnswerChoice.of(
      [
        'an inventory',
        'purchases inventory',
        'a schedule of goods on hand',
      ],
      'merchandise inventory',
    ),
    event: Event.accountingI,
  ),
  MultipleChoiceQuestionData(
    idNumber: 2,
    question:
        'After the adjusting entry for Supplies has been posted, Supplies ' +
            'Expense has an up-to-date balance, which is the:',
    choices: AnswerChoice.of(
      [
        'same as the beginning balance for Supplies',
        'same as the ending balance for Supplies',
        'value of supplies bought during the fiscal period',
      ],
      'value of supplies used during the fiscal period',
    ),
    event: Event.accountingI,
  ),
  MultipleResponseQuestionData(
    idNumber: 3,
    question:
        'Name all the following sections of an income statement which DO NOT ' +
            'report how much was paid for the goods a company sells?',
    choices: AnswerChoice.ofMultiple(
      [
        'Cost of merchandise sold',
      ],
      [
        'Revenue',
        'Operating expenses',
        'Gross profit on operations',
      ],
    ),
    event: Event.accountingI,
  ),
  TrueFalseQuestionData(
    idNumber: 4,
    question:
        'TRUE or FALSE: The first step in the posting procedure is writing ' +
            'the entry in the Date column of the account',
    answer: true,
    event: Event.accountingI,
  ),
  MultipleChoiceQuestionData(
    idNumber: 5,
    question: "Information needed to prepare a balance sheet assets section" +
        " is obtained from a work sheet's Account Title column and: ",
    choices: AnswerChoice.of(
      [
        'Balance Sheet Credit column.',
        'Income Statement Debit column.',
        'Income Statement Credit column.',
      ],
      'Balance Sheet Debit column.',
    ),
    event: Event.accountingI,
  ),
  TrueFalseQuestionData(
    idNumber: 6,
    question:
        'TRUE or FALSE: On a worksheet, the balance of the Sales account is' +
            ' extended to the Balance Sheet Credit column',
    answer: false,
    event: Event.accountingI,
  ),
  FreeResponseQuestionData(
    idNumber: 7,
    question: 'A Petty Cash Fund is Replenished',
    answer: ['Monthly', 'Every Month'],
    event: Event.accountingI,
  ),
  MultipleChoiceQuestionData(
    idNumber: 8,
    question:
        'The Accumulated Earnings column of the employee earnings record:',
    choices: AnswerChoice.of(
      [
        'shows net pay for the year',
        'shows net pay for one quarter',
        'is the gross earnings for one quarter',
      ],
      'is the total earnings since the first of the year',
    ),
    event: Event.accountingI,
  ),
  FreeResponseQuestionData(
    idNumber: 9,
    question: 'A business owned by two or more people is called a:',
    answer: ['partnership'],
    event: Event.accountingI,
  )

  // Accounting 2
];

/// Gets [number] number of random questions from the question list by shuffling
/// and then choosing the top 3. This way, it prevents duplicate questions
/// while maintaining a list containing all the questions.
List<QuestionData> randomQuestions([int number = 5]) {
  shuffle(questionList);
  return questionList.sublist(0, min(number, questionList.length));
}
