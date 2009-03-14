Feature: Upload files
  In order to deploy my website
  As a website administrator
  I want to upload my files to a remote server via FTP
  
  Scenario: Upload a single file
    Given my FTP server is running
    And I am in folder with a single file
    When I sync the current folder to the ftp server
    Then the ftp folder contents should match the current folder
  
