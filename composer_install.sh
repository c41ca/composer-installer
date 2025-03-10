 #!/bin/bash  
   
 # Change to the user's home directory  
 cd ~
   
 # Create a directory for Composer  
 mkdir -p composer 
   
 # Change to the composer directory  
 cd composer
 
 # Download composer.phar  
 if command -v curl > /dev/null; then  
     curl -sS https://getcomposer.org/installer | php  
 elif command -v wget > /dev/null; then  
     wget -q -O - https://getcomposer.org/installer | php  
 else  
     echo "Error: curl or wget is required to download Composer."  
     exit 1  
 fi  
   
 # Rename composer.phar to composer  
 mv composer.phar composer  
   
 # Add the path to composer to .bashrc if it's not already there  
 COMPOSER_PATH="$HOME/composer"  
 if ! grep -q "export PATH=\"\$PATH:$COMPOSER_PATH\"" ~/.bashrc; then  
     echo "export PATH=\"\$PATH:$COMPOSER_PATH\"" >> ~/.bashrc  
     echo "Composer path added to .bashrc. Please restart your terminal or run 'source ~/.bashrc' to apply changes."  
 else  
     echo "Composer path is already in .bashrc."  
 fi  
   
 echo "Composer installation completed successfully."  
