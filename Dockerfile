FROM ubuntu:14.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install curl wget && \
    apt-get -y install --no-install-recommends python-pip

RUN mkdir ~/wheels_dir && cd ~/wheels_dir && \
    wget https://files.pythonhosted.org/packages/54/0c/d01aa759fdc501a58f431eb594a17495f15b88da142ce14b5845662c13f3/pip-20.0.2-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/b5/a8/56be92dcd4a5bf1998705a9b4028249fe7c9a035b955fe93b6a3e5b829f8/asn1crypto-1.4.0-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/74/f5/f0cb35e78044bf19309e635b20550bf3443322e0ff2ff09e6732c0ed0851/cffi-1.14.6-cp27-cp27mu-manylinux1_x86_64.whl && \
    wget https://files.pythonhosted.org/packages/f2/49/b8b356dac8c15e03e2342dda409b20d766916d414844d16f069662314464/cryptography-3.3-cp27-cp27mu-manylinux1_x86_64.whl && \
    wget https://files.pythonhosted.org/packages/6f/2c/a9386903ece2ea85e9807e0e062174dc26fdce8b05f216d00491be29fad5/enum34-1.1.10-py2-none-any.whl && \
    wget https://files.pythonhosted.org/packages/11/7d/9bbbd7bb35f34b0169542487d2a8859e44306bb2e6a4455d491800a5621f/idna-2.5-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/c2/f8/49697181b1651d8347d24c095ce46c7346c37335ddc7d255833e7cde674d/ipaddress-1.0.23-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/b2/5e/06351ede29fd4899782ad335c2e02f1f862a887c20a3541f17c3fa1a3525/pyOpenSSL-20.0.1-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz

RUN pip install --no-index ~/wheels_dir/pip-20.0.2-py2.py3-none-any.whl
RUN pip install --no-index ~/wheels_dir/*

### this is an attempt to update requests and urllib3, comment if issues found.
RUN pip install urllib3[secure]==1.26.6 --ignore-installed
RUN pip install requests==2.26.0 --ignore-installed
