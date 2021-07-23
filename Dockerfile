FROM ubuntu:14.04

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install curl wget && \
    apt-get -y install --no-install-recommends python-pip

RUN mkdir ~/wheels_dir && cd ~/wheels_dir && \
    wget https://files.pythonhosted.org/packages/86/41/44173175d378c9e3a73294bb33c73725f7726def5ce267af6bd11b72eb23/cryptography-3.3.2-cp27-cp27mu-manylinux1_x86_64.whl && \
    wget https://files.pythonhosted.org/packages/74/f5/f0cb35e78044bf19309e635b20550bf3443322e0ff2ff09e6732c0ed0851/cffi-1.14.6-cp27-cp27mu-manylinux1_x86_64.whl && \
    wget https://files.pythonhosted.org/packages/27/79/8a850fe3496446ff0d584327ae44e7500daf6764ca1a382d2d02789accf7/pip-20.3.4-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/b5/a8/56be92dcd4a5bf1998705a9b4028249fe7c9a035b955fe93b6a3e5b829f8/asn1crypto-1.4.0-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/6f/2c/a9386903ece2ea85e9807e0e062174dc26fdce8b05f216d00491be29fad5/enum34-1.1.10-py2-none-any.whl && \
    wget https://files.pythonhosted.org/packages/a2/38/928ddce2273eaa564f6f50de919327bf3a00f091b5baba8dfa9460f3a8a8/idna-2.10-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/d9/5a/e7c31adbe875f2abbb91bd84cf2dc52d792b5a01506781dbcf25c91daf11/six-1.16.0-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/c2/f8/49697181b1651d8347d24c095ce46c7346c37335ddc7d255833e7cde674d/ipaddress-1.0.23-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/b2/5e/06351ede29fd4899782ad335c2e02f1f862a887c20a3541f17c3fa1a3525/pyOpenSSL-20.0.1-py2.py3-none-any.whl && \
    wget https://files.pythonhosted.org/packages/0f/86/e19659527668d70be91d0369aeaa055b4eb396b0f387a4f92293a20035bd/pycparser-2.20.tar.gz

RUN pip install ~/wheels_dir/pip-20.3.4-py2.py3-none-any.whl
RUN pip install --no-index  ~/wheels_dir/* --ignore-installed

