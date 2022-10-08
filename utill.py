import config
import xml.dom.minidom

def check_test_case_status_from_xunit(name):
  message = 'Dependency not met: '+ 'test case ' + repr(name)
  doc = xml.dom.minidom.parse(config.result_xml_file_path)
  xunit_test_result = doc.getElementsByTagName("testcase")
  for each_test_result in xunit_test_result:
    xunit_test_case = each_test_result.getAttribute("name")
    if xunit_test_case == name:
      xunit_test_check = each_test_result.getElementsByTagName("failure")
      if not xunit_test_check:
        print('test case ' + repr(name) + ' passed.')
        return
      else:
        raise AssertionError(message + ' failed.')
  raise AssertionError(message + ' not found.')