control 'azure_remote_state' do
    title 'Check if the Example Resource Group matches expectations'
    comment 'see https://docs.microsoft.com/en-us/rest/api/ for valid queries'
    impact 1.0
  
    describe azure_resource_group(name: 'Inspec-Azure') do
        # Check if the Resource Group has tags
      it { should have_tags }
  
      # Check if the number of Storage Accounts is correct
      its('sa_count') { should eq 1 }

    end
  end