from robot.libraries.BuiltIn import BuiltIn

def close_browser_on_passed():
    if not BuiltIn().get_variable_value('${TEST FAILED}'):
        BuiltIn().run_keyword('Close All Browsers')
