import 'dart:math';

import 'package:flutter/cupertino.dart';

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
  ),

  // Accounting 2
  MultipleChoiceQuestionData(
    idNumber: 1,
    question: "The totals of the worksheet's Income Statement debit and credit " +
        "columns are \$89,900 and \$67,100 respectively. What is the amount of" +
        " the net income or net loss for the period?",
    choices: AnswerChoice.of(
      [
        "\$22,800 net income",
        "\$89,900 net income",
        "\$67,100 net loss",
      ],
      "\$22,800 net loss",
    ),
    event: Event.accountingII,
  ),
  MultipleResponseQuestionData(
    idNumber: 2,
    question:
        'Select All that Apply: When no-par value common stock is issued,' +
            ' Capital Stock—Common is NOT credited for the:',
    choices: AnswerChoice.ofMultiple(
      [
        'total amount received',
      ],
      [
        'stated par value of the stock',
        'par value less the imputed discount',
        'amount stated on the stock certificate',
      ],
    ),
    event: Event.accountingII,
  ),
  MultipleChoiceQuestionData(
    idNumber: 3,
    question:
        'Cole and Madison are partners who decided to liquidate the partnership. Before the liquidation, the partnership\'s balance sheet showed Cash \$10,000, total "other assets", \$106,000; total liabilities, \$88,000; Cole Capital, \$15,100; and Madison, Capital, \$12,900. The "other assets" were sold for \$118,000. After liabilities are paid, what is total distribution to Cole?',
    choices: AnswerChoice.of(
      [
        '\$20,000',
        '\$70,000',
        '\$44,000',
      ],
      '\$21,100',
    ),
    event: Event.accountingII,
  ),
  FreeResponseQuestionData(
    idNumber: 4,
    event: Event.accountingII,
    question:
        'Using legal methods to minimize a tax burden is called tax _______:',
    answer: ['avoidance'],
  ),
  TrueFalseQuestionData(
    idNumber: 5,
    event: Event.accountingII,
    question:
        'Marsh Corporation has a current assets valued at \$15 million, inventory at \$12 million, and current liabilities valued at \$6 million. The cost of goods sold was \$60 million. True or False: Based on this information, its current ratio is 2.5',
    answer: true,
  ),

  // Agribusiness
  TrueFalseQuestionData(
    idNumber: 0,
    event: Event.agribusiness,
    question:
        'When handling a “know-it-all” customer, it is important not to be competitive or argumentative with them',
    answer: true,
  ),
  MultipleChoiceQuestionData(
    idNumber: 1,
    event: Event.agribusiness,
    question: 'A disadvantage associated with projected cash flow is that it',
    choices: AnswerChoice.of(
      [
        'shows when excess cash will be available',
        'allows planned purchases',
        'evaluates the relationship of short-term debt to repayment capacity',
      ],
      'projects prices that are difficult to estimate',
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 2,
    event: Event.agribusiness,
    question:
        'The practice of cultivating, processing, and distributing food in or around a village, town or city is known as __________ agriculture.',
    answer: ['urban'],
  ),
  MultipleResponseQuestionData(
    idNumber: 3,
    event: Event.agribusiness,
    question:
        'Choose all that apply: Advantages of incorporating a farm business do not that it will: ',
    choices: AnswerChoice.ofMultiple(
      [
        'limit personal liability of the owners',
      ],
      [
        'result in double taxation',
        'result in fewer rules and regulations to follow',
        'reduce the amount of record keeping',
      ],
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 4,
    event: Event.agribusiness,
    question:
        'The practice of using an integrated system of plant and animal production practices that have a site-specific application that will last over the long term is known as _____ agriculture',
    answer: [
      'sustainable',
      'sustainability',
      'sustainably',
    ],
  ),
  MultipleChoiceQuestionData(
    idNumber: 5,
    event: Event.agribusiness,
    question:
        'Since farmers are continually exposed to loud noises, they should have periodic hearing tests called',
    choices: AnswerChoice.of(
      [
        'visualgrams',
        'physicals',
        'ophthalmologram',
      ],
      'audiograms',
    ),
  ),
  TrueFalseQuestionData(
    idNumber: 6,
    event: Event.agribusiness,
    question:
        'True or False: Technology-advanced farm equipment increased the labor market for agriculture',
    answer: false,
  ),

  // Banking and Financial Systems
  MultipleChoiceQuestionData(
    idNumber: 0,
    event: Event.bankingAndFinancialSystems,
    question: 'Many recent bank closings can be tied to: ',
    choices: AnswerChoice.of(
      [
        'credit default swaps',
        'competition and recent laws governing banks',
        'the recession',
      ],
      'unethical business practices and greed',
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 1,
    event: Event.bankingAndFinancialSystems,
    question: 'What is the name for the rate of return on a savings account',
    answer: ['interest', 'yield'],
  ),
  TrueFalseQuestionData(
    idNumber: 2,
    event: Event.bankingAndFinancialSystems,
    question:
        'True or False: The first sale of a common stock to the public is called an IPO',
    answer: true,
  ),
  MultipleChoiceQuestionData(
    idNumber: 3,
    event: Event.bankingAndFinancialSystems,
    question: 'What do actuaries do?',
    choices: AnswerChoice.of(
      [
        'evaluate the likelihood of present events',
        'evaluate assets and liabilities',
        'actually evaluate accounting statements',
      ],
      'evaluate the likelihood of future events',
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 4,
    event: Event.bankingAndFinancialSystems,
    question: 'EFT is an acronym for electronic funds _______',
    answer: ['transfer'],
  ),
  MultipleResponseQuestionData(
    idNumber: 5,
    event: Event.bankingAndFinancialSystems,
    question:
        'Name all of the following which you should NOT do after an interview',
    choices: AnswerChoice.ofMultiple(
      [
        'evaluate how you did and send a thank you note',
      ],
      [
        'write down all the questions you were asked in case you\'re asked again',
        'tell the other interviewees what went right or wrong',
        'e-mail the interviewer to find out when they are going to hire',
      ],
    ),
  ),

  // Business Caclulations
  MultipleChoiceQuestionData(
    idNumber: 0,
    event: Event.businessCalculations,
    question:
        'With a depreciable value of \$27,000 which cost your father \$30,000, calculate the depreciation of your company\'s van using the straight-line method of five years of useful life.',
    choices: AnswerChoice.of(
      [
        '\$4,400',
        '\$11,000',
        '\$5,600',
      ],
      '\$5,400',
    ),
  ),

  // Business Communication
  MultipleChoiceQuestionData(
    idNumber: 0,
    event: Event.businessCommunication,
    question:
        'Which type of a report would a local school system issue to the state board if it had to correct some deficiencies?',
    choices: AnswerChoice.of(
      [
        'status report',
        'audit report',
        'periodic report',
      ],
      'plan of action',
    ),
  ),
  MultipleResponseQuestionData(
    idNumber: 1,
    event: Event.businessCommunication,
    question:
        'Proofreading include which of the following (Choose all that apply): ',
    choices: AnswerChoice.ofMultiple(
      [
        'use the print screen key',
      ],
      [
        'use spell/grammar check',
        'read backwards',
        'compare drafts',
      ],
    ),
  ),
  TrueFalseQuestionData(
    idNumber: 2,
    event: Event.businessCommunication,
    question: 'True or False: "biannual" means "every two years"',
    answer: false,
  ),
  MultipleResponseQuestionData(
    idNumber: 3,
    event: Event.businessCommunication,
    question:
        'Choose all of the following words which are spelled incorrectly.',
    choices: AnswerChoice.ofMultiple(
      [
        'reservoir',
        'congratulations',
        'feuding',
      ],
      [
        'fourtieth',
      ],
    ),
  ),

  // Entrepreneurship
  MultipleChoiceQuestionData(
    idNumber: 0,
    event: Event.entrepreneurship,
    question:
        'What document should you prepare to include with your business plan that will tell the reader about your qualifications to run the business?',
    choices: AnswerChoice.of(
      [
        'Executive Summary',
        'Mission Statement',
        'Cover Letter',
      ],
      'Resume',
    ),
  ),
  MultipleResponseQuestionData(
    idNumber: 1,
    event: Event.entrepreneurship,
    question:
        'Choose all of the following that are good characterstics for an entrepreneur.',
    choices: AnswerChoice.ofMultiple(
      [
        'follower',
      ],
      [
        'leader',
        'self-motivated',
        'visionary',
      ],
    ),
  ),
  TrueFalseQuestionData(
    idNumber: 2,
    event: Event.entrepreneurship,
    question:
        'True or False: If your cousin, Andy, is willing to invest \$20,000 in your business for a 15 percent share of ownership, it is called "venture capital".',
    answer: false,
  ),
  MultipleChoiceQuestionData(
    idNumber: 3,
    event: Event.entrepreneurship,
    question:
        'f you were going to start a small retail store selling gift items, which type of market structure would you most likely be entering?',
    choices: AnswerChoice.of(
      [
        'oligopoly',
        'monopolistic competition',
        'monopoly',
      ],
      'perfect competition',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 4,
    event: Event.entrepreneurship,
    question:
        'Which one of the following functions of management would apply when grouping tasks into departments?',
    choices: AnswerChoice.of(
      [
        'planning',
        'implementing',
        'controlling',
      ],
      'organizing',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 5,
    event: Event.entrepreneurship,
    question:
        'Who determines the amount of sales tax that must be charged on a sale?',
    choices: AnswerChoice.of(
      [
        'Chamber of Commerce',
        'federal government',
        'business owner',
      ],
      'city, county, and/or state governments',
    ),
  ),
  MultipleResponseQuestionData(
    idNumber: 6,
    event: Event.entrepreneurship,
    question:
        'Choose all of the following which are factors to consider when analyzing the economic climate that controls your business?',
    choices: AnswerChoice.ofMultiple(
      [
        'prices you charge',
      ],
      [
        'new competition',
        'demographic changes',
        'condition of national economy'
      ],
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 7,
    event: Event.entrepreneurship,
    question:
        'In a _______ economy, the government determines what, how, and for whom products and services are produced.',
    answer: [
      'command',
    ],
  ),
  MultipleChoiceQuestionData(
    idNumber: 8,
    event: Event.entrepreneurship,
    question:
        'Which law bans unfair or deceptive actions or practices by businesses that may cause an unfair competitive advantage?',
    choices: AnswerChoice.of([
      'Sherman Act',
      'Clayton Act',
      'Robinson-Patman Act',
    ], 'Wheeler-Lea Act'),
  ),

  // Global Business
  FreeResponseQuestionData(
    idNumber: 0,
    event: Event.globalBusiness,
    question:
        'The _______ country is the country in which a multinational enterprise is headquartered',
    answer: ['home'],
  ),
  MultipleChoiceQuestionData(
    idNumber: 1,
    event: Event.globalBusiness,
    question:
        'Many Japanese companies own hotels in Hawaii. This is an example of:',
    choices: AnswerChoice.of(
      ['franchise', 'wholly-owned subsidiary', 'joint venture'],
      'foreign direct investment (FDI)',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 2,
    event: Event.globalBusiness,
    question:
        'Domestic and international contracts require something of value to be given by each party. This is called:',
    choices: AnswerChoice.of(
      [
        'capacity',
        'mutual agreement',
        'legal purpose',
      ],
      'consideration',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 3,
    event: Event.globalBusiness,
    question:
        'Which of the following is true about personal space throughout the world?',
    choices: AnswerChoice.of(
      [
        'Japanese prefer less space than Americans.',
        'Jordanians prefer more than an arm\'s length when conferring with each other.',
        'Mexicans are very comfortable beign close in lines, on buses, and at home.',
      ],
      'Americans confer with each other at arm\'s length.',
    ),
  ),
  TrueFalseQuestionData(
    idNumber: 4,
    event: Event.globalBusiness,
    question:
        'True or False: Advertising involves the marketing efforts to inform and persuade customers around the world to purchase a product.',
    answer: false,
  ),
  FreeResponseQuestionData(
    idNumber: 5,
    event: Event.globalBusiness,
    question:
        'All citizens take part in making rules that govern them in a ______ form of government.',
    answer: [
      'Democratic',
      'Democracy',
    ],
  ),
  MultipleChoiceQuestionData(
    idNumber: 6,
    event: Event.globalBusiness,
    question: 'Free trade zones are frequently found in: ',
    choices: AnswerChoice.of(
      [
        'shopping malls',
        'multinational business',
        'hotels',
      ],
      'airports',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 7,
    event: Event.globalBusiness,
    question: 'Liquidity means:',
    choices: AnswerChoice.of(
      [
        'tax-deferred investment',
        'highest possible rate of return',
        'insured investment',
      ],
      'easily converted to cash without loss',
    ),
  ),
  MultipleChoiceQuestionData(
    idNumber: 8,
    event: Event.globalBusiness,
    question:
        'The ___________ approach is the human resource approach that uses natives of the host country of a business to manage operations within their country and parent country natives to manage at headquarters.',
    choices: AnswerChoice.of(
      [
        'Geocentric',
        'Egocentric',
        'Ethnocentric',
      ],
      'Polycentric',
    ),
  ),
  FreeResponseQuestionData(
    idNumber: 9,
    event: Event.globalBusiness,
    question:
        'A _____ allows a person into a foreign country for the purpose of employment',
    answer: ['work visa', 'visa'],
  ),
];

/// Gets [number] number of random questions from the question list by shuffling
/// and then choosing the top 3. This way, it prevents duplicate questions
/// while maintaining a list containing all the questions.
///
/// The reason this is done instead of randomly picking an index is to avoid
/// duplicates in the actual quiz. The alternative, removing the item from the
/// question list after it was selected, had the potential to permanently remove
/// that question from future quizzes within the same instance and remove access
/// to it when reviewing, which is less than ideal. Therefore, the strategy of
/// shuffling the whole list and selecting a sublist was adopted.
List<QuestionData> randomQuestions([int number = 5, Event event]) {
  var list = questionList;

  if (event != null) list.removeWhere((element) => element.event != event);

  shuffle(list);
  return list.sublist(0, min(number, list.length));
}
