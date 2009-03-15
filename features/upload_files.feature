Feature: Upload files
  In order to deploy my website
  As a website administrator
  I want to upload my files to a remote server via FTP
  
  Scenario: Upload a single file
    Given the remote FTP folder is empty
    And I am in folder with a single file
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
  
