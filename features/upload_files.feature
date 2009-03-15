Feature: Upload files
  In order to deploy my website
  As a website administrator
  I want to upload my files to a remote server via FTP
  
  Scenario: Upload a single file
    Given the remote FTP folder is empty
    And I am in a folder with a single file (example 1)
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
  
  Scenario: Upload many files in a single directory
    Given the remote FTP folder is empty
    And I am in a folder with many files (example 2)
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
    
  Scenario: Upload files and subfolders
    Given the remote FTP folder is empty
    And I am in a folder with files and subfolders (example 3)
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
    
  Scenario: Upload deeply nested subfolders
    Given the remote FTP folder is empty
    And I am in a folder with deeply nested subfolders (example 4)
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
  
