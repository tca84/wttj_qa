
import pandas as pd
import csv
from collections import defaultdict

TECHNICAL_JOBS_FILE = "appendix/technical-test-jobs.csv"
TECHNICAL_PROFESSIONS_FILE = "appendix/technical-test-professions.csv"
OUTPUT_FILE = "merge.csv"


contract_type_team_dict = {}


def merge_csv(file1, file2):
    '''
    Merge csv files and delete unwanted columns
    We need only profession_id,contract_type,category_name columns
    '''

    csvfile1 = pd.read_csv(file1)
    csvfile2= pd.read_csv(file2)

    csvfile3 = pd.merge(
        csvfile1[['profession_id', 'contract_type']],
        csvfile2[['id','category_name']],
        left_on=['profession_id'],
        right_on=['id'],
        how='outer'
    )
    csvfile3 = csvfile3.drop('id', axis=1)
    csvfile3.to_csv(OUTPUT_FILE, index=False)



def format_jobs_per_categories_and_contract():
    '''
    Parse output file in order to display number of offers
    per categories and per contract types
    '''

    with open(OUTPUT_FILE) as csvfile:
        contract_type_total_number = defaultdict(int)
        readCSV = csv.reader(csvfile, delimiter=',')
        first_line = next(readCSV)
        for row in readCSV:
            contract_type = row[1]
            team = row[2]
            if contract_type not in contract_type_team_dict:
                contract_type_team_dict[contract_type] = {}
            if team not in contract_type_team_dict[contract_type]:
                contract_type_team_dict[contract_type][team] = 1
            else:
                contract_type_team_dict[contract_type][team] += 1
            contract_type_total_number[contract_type] += 1

    print('---------------------------------------------------------------------')
    header = True
    for key, categories in contract_type_team_dict.items():
        if header:
            print('\t\tTOTAL\t|  ' + ''.join(['{0} | '.format(k) for k,v in categories.items()]))
            header = False

        count_by_category = ''.join(['{:<5}|  '.format(v) for k,v in categories.items()])
        total_by_contract = dict(contract_type_total_number)[key]
        print(
            '{:<10}\t{:<8}|  {}'.format(key, total_by_contract, count_by_category)
        )
    print('---------------------------------------------------------------------')


if __name__ == "__main__":
    merge_csv(
        file1=TECHNICAL_JOBS_FILE,
        file2=TECHNICAL_PROFESSIONS_FILE
    )

    format_jobs_per_categories_and_contract()




