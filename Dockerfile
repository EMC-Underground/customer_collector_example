FROM vmware/powerclicore

MAINTAINER krishna burri <kburri@starbucks.com>

RUN pwsh -c 'Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false'
RUN pwsh -c 'Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false'
RUN pwsh -c 'Set-PowerCLIConfiguration -Scope Session -WebOperationTimeoutSeconds 1800000 -Confirm:$false'

RUN tdnf install -y git && \
    tdnf install -y gawk

COPY ./s.ps1 /s.ps1

ENTRYPOINT ["./s.ps1"]
