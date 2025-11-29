echo "Setting up SSH daemon..." >&2 # Redirect to stderr

# Create the .ssh directory for the root user if it doesn't exist
mkdir -p /root/.ssh
# Set correct permissions for the .ssh directory (owner read/write/execute, others no access)
chmod 700 /root/.ssh

# RunPod injects the public key from your user settings into the $PUBLIC_KEY environment variable.
# Append this key to the authorized_keys file for the root user.
# This allows key-based SSH authentication.
echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
# Set correct permissions for the authorized_keys file (owner read/write, others no access).
# The RunPod guide shows 700, but 600 is standard and more secure for authorized_keys.
chmod 600 /root/.ssh/authorized_keys

# Start the SSH service
service ssh start
echo "SSH daemon started." >&2 # Redirect to stderr
