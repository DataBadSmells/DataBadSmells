import argparse
import os
import sys
import difflib
import json
import datetime
import data_manip
import metrics
import tests
import ml
import inspect


class CLI(object):
    def __init__(self):
        """
        Creates a new CLI object to handle arguments
        """
        self.args = None
        self.metadata = {}
        self.df = None

    def parse_arguments(self, args):
        """
        Defines the allowed application arguments and invokes the evaluation of the arguments.

        :param args: The application arguments
        """
        parser = argparse.ArgumentParser(description="Generate Complexity Metrics on Network Data")

        # Required arguments
        parser.add_argument('--csv', type=str, help='CSV File containing network flow statistics')
        parser.add_argument('--folder', action="store_true", help=
                            'Consider final argument as folder of CSV files, rather than a single file')
        parser.add_argument("--results", type=str, help='Location of Results Folder')

        # Optional arguments

        # Dataset Metadata Arguments
        parser.add_argument("--metadata", type=str, help='Location of Metadata File')

        parser.add_argument("--drop", nargs='+', help='Fields to be dropped during data pre-processing')
        parser.add_argument("--unique", nargs='+', help='Fields containing discrete values')
        parser.add_argument("--label", type=str, help='Name of field containing target labels')
        parser.add_argument("--benign", type=str, help='Name of benign label')
        parser.add_argument("--dport", type=str, help='Name of destination port field')
        parser.add_argument("--ports", nargs='+', help='List of bad ports to be ignored/considered background traffic')
        parser.add_argument("--control", nargs='+', help='Fields that an attacker can control')
        parser.add_argument("--dbytes", type=str, help="Name of Total Destination Bytes field")
        parser.add_argument("--sbytes", type=str, help="Name of Total Source Bytes field")

        # Other Arguments
        parser.add_argument("--list", action='store_true', help='List attack labels and exit.')
        parser.add_argument("--target", type=str, help='Target label for classifiers')
        parser.add_argument("--port", type=int, help="Target Port")
        parser.add_argument("--siamese", action='store_true', help='Calculate results from Siamese Network')
        parser.add_argument("--test", type=str, help='Apply hueristic test for bad smells.')
        parser.add_argument("--metric", type=str, help='Apply metric across dataset or to target')
        parser.add_argument("--ids", type=str, help='Apply (basic) classifier to dataset')
        parser.add_argument("--verbose", action="store_true", help='Print verbose results')
        parser.add_argument("--metriclist", action="store_true", help="List metric options")
        parser.add_argument("--testlist", action="store_true", help="List test options")

        self.args = parser.parse_args()

        if self.args.results != None:
            if not os.path.exists(self.args.results):
                os.makedirs(self.args.results)

    def chooseMetric(self):
        metric_name = self.parseMetric(self.args.metric)
        label_field = self.metadata["label_field"]
        results = {}
        for name, metric in inspect.getmembers(metrics):
            if inspect.isclass(metric):
                if metric_name == name:
                    if "Metric" in name:
                        met = metric()
                        if "GiniImpurity" in name or "InfoGain" in name:
                            results[self.args.target] = met.apply_metric(self.df, self.metadata, self.args.target) 
                        else:
                            data = data_manip.reformatForDiv(self.df, self.metadata)
                            data1 = data[data[label_field] == self.args.target]
                            for col in data1.columns:
                                results[col] = met.apply_metric(data1[col])
                    elif "Divergence" in name:
                        div = metric()
                        data = data_manip.reformatForDiv(self.df, self.metadata)
                        data1 = data[data[label_field] == self.args.target]
                        data2 = data[data[label_field] == self.metadata['benign_label']]
                        for col in list(set(data1.columns) & set(data2.columns)):
                            results[col] = div.apply_metric(data1[col], data2[col])
        return results

    @staticmethod
    def processMetricListing():
        emph_start = '\033[1m'
        emph_end = '\033[0m'
        for name, metric in inspect.getmembers(metrics):
            if inspect.isclass(metric):
                if "Metric" in name or "Divergence" in name:
                    if name != "BaseMetric":
                        met = metric()
                        print('[#] {}{}{}'.format(emph_start, met.metric_name, emph_end))
                        print('\t[!] {}Description:{} {}'.format(emph_start, emph_end, met.metric_description))
                        print('\t[!] {}Type:{} {}'.format(emph_start, emph_end, met.metric_type))

    @staticmethod
    def parseMetric(metric_name):
        available_metrics = []
        for name, metric in inspect.getmembers(metrics):
            if inspect.isclass(metric):
                if "Metric" in name or "Divergence" in name:
                    if name != "BaseMetric":
                        available_metrics.append(name)
        
        highest_sim = 0.0
        highest_sim_metric = None
        for metric in available_metrics:
            if metric_name == metric:
                return metric
            counter_check = metric.lower()
            similarity = difflib.SequenceMatcher(None, metric_name.lower(), counter_check).ratio()
            if similarity == 1.0:
                return metric
            if similarity > highest_sim:
                highest_sim = similarity
                highest_sim_metric = metric

        if highest_sim >= 0.6:
            print("Could not find attack with name " + metric_name + ". Closest match was " + highest_sim_metric + ".")
        else:
            print("Could not find attack with name " + metric_name + " or with similar name.")
            exit(1)

    def chooseTest(self):
        test_name = self.parseTest(self.args.test)
        results_dict = {}
        for name, test in inspect.getmembers(tests):
            if inspect.isclass(test):
                if test_name == name:
                    t = test()
                    if self.args.port == None:
                        results_dict[test_name] = t.pipeline(self.df, self.metadata, self.args.target)
                    else:
                        results_dict[test_name] = t.pipeline(self.df, self.metadata, self.args.target, self.args.port)
                    return results_dict


    @staticmethod
    def parseTest(test_name):
        available_tests = []
        for name, test in inspect.getmembers(tests):
            if inspect.isclass(test):
                if "Test" in name:
                    if name != "BaseTest":
                        available_tests.append(name)
        highest_sim = 0.0
        highest_sim_test = None
        for test in available_tests:
            if test_name == test:
                return test
            counter_check = test.lower()
            similarity = difflib.SequenceMatcher(None, test_name.lower(), counter_check).ratio()
            if similarity == 1.0:
                return test
            if similarity > highest_sim:
                highest_sim = similarity
                highest_sim_test = test

        if highest_sim >= 0.6:
            print("Could not find test with name " + test_name + ". Closest match was " + highest_sim_test + ".")
        else:
            print("Could not find test with name " + test_name + " or with similar name.")
            exit(1)

    @staticmethod
    def processTestListing():
        emph_start = '\033[1m'
        emph_end = '\033[0m'
        for name, test in inspect.getmembers(tests):
            if inspect.isclass(test):
                if "Test" in name:
                    if name != "BaseTest":
                        t = test()
                        print('[#] {}{}{}'.format(emph_start, t.test_name, emph_end))
                        print('\t[!] {}Description:{} {}'.format(emph_start, emph_end, t.test_description))
                        print('\t[!] {}Type:{} {}'.format(emph_start, emph_end, t.test_type))


def main(args):
    """
    Creates a new CLI object and starts parsing arguments.

    :param args: The provided arguments
    """
    cli = CLI()
    cli.parse_arguments(args)

    if cli.args.metriclist:
        cli.processMetricListing()
        return
    if cli.args.testlist:
        cli.processTestListing()
        return
    try:
        if cli.args.metadata != None:
            cli.metadata = data_manip.readMetadata(cli.args.metadata)
            print(cli.metadata)
        else:
            cli.metadata['drop_fields'] = cli.args.drop
            cli.metadata['unique_fields'] = cli.args.unique
            cli.metadata['label_field'] = cli.args.label
            cli.metadata['benign_label'] = cli.args.benign
            cli.metadata['dst_port'] = cli.args.dport
            cli.metadata['ignore_ports'] = cli.args.ports
            cli.metadata['control'] = cli.args.control

            data_manip.saveMetadata('metadata.json',
                                    cli.args.drop, 
                                    cli.args.unique,
                                    cli.args.label,
                                    cli.args.benign,
                                    cli.args.dport,
                                    cli.args.ports,
                                    cli.args.control)
        if cli.args.folder:
            cli.df = data_manip.readDirec(cli.args.csv, cli.metadata)
        else:
            cli.df = data_manip.readFile(cli.args.csv, cli.metadata)
    except Exception as _:
        exc_type, _, exc_tb = sys.exc_info()
        fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
        print(exc_type, fname, exc_tb.tb_lineno)

    if cli.args.list == True:
        print(cli.df[cli.metadata["label_field"]].value_counts())
        exit()

    if cli.args.test != None:
        if cli.args.test == "TimeBehaviourTest":
            now = datetime.datetime.now().strftime("%Y-%d-%B-%I-%M-%S")
            out_dir = os.path.join(cli.args.results, cli.args.target, "tests", now)
            os.makedirs(out_dir, exist_ok=True)
            os.chdir(out_dir)
            out = cli.chooseTest()
        else:
            out = cli.chooseTest()
            now = datetime.datetime.now().strftime("%Y-%d-%B-%I-%M-%S")
            out_file = os.path.join(cli.args.results, cli.args.target, "tests", "{}_{}.results".format(cli.args.test, now))
            os.makedirs(os.path.dirname(out_file), exist_ok=True)
            with open(out_file, "w+") as f:
                f.write(json.dumps(out))

    if cli.args.metric != None:
        out = cli.chooseMetric()
        now = datetime.datetime.now().strftime("%Y-%d-%B-%I-%M-%S")
        out_file = os.path.join(cli.args.results, cli.args.target, "metrics", "{}_{}.results".format(cli.args.metric, now))
        os.makedirs(os.path.dirname(out_file), exist_ok=True)
        with open(out_file, "w+") as f:
            f.write(json.dumps(out))
    if cli.args.ids != None:
        ml.mlPipeline(cli.df, cli.metadata, cli.args.target, cli.args.ids, cli.args.results, cli.args.verbose)

if __name__ == "__main__":
    main(sys.argv[1:])
