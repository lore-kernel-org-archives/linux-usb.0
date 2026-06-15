Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E43AEF3E;
	Mon, 15 Jun 2026 05:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502995; cv=none; b=ZCjl1ug4q6rGYn9k4ZYDNN7dQLcp8HqeiyZ1ct21Jv9JPQ7B+NCrISTXEJeFIMb0K4kHrJFi6C/UQwISnxPxBEPVBZMi9HDze+F22rsbPGEmqRIqFum2tw/k/eivP4FBQtTAyPSu/E4rzBmO1AQXBVZOG3fVP6R6YTW4zvD/fck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502995; c=relaxed/simple;
	bh=SiVyORRwuhFdqbqx0GzQHz/kK8K9pjnUbjRaoyFNjI4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=bwmfO1T26ONPnTszNV7R7VUcESrO8YmfQ/cA37LrHJnapkmXQOO/GAz//1VyTATrRbgujI5TIi9bDO6+A+n5/A9ZdCZpeha+RHR37HjKxyCBzN85xSkSxGdUJ48ZB7V2FMC1wadRKSyZWBbceDm5Yyt4AU4qGM3aXGRMtGp711M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=VanCr8++; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="VanCr8++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=MWuzMR5mlK1/XKFsPqoAgPV+TmbTeFBZaOz3YhTM7jU=;
  b=VanCr8++PwPZ+ZpF7T8YNG2H2IPyHSWhuGckGIg/l9tNuXe15vSDZsSo
   +pfAAWXuoqL7gFUYBjOXFejrN7lJDUnoWYEgGx+HINyh3/nHekGtrTtK/
   poXFj4R3CH/s9ubbLxsW/VLguOhlfbI67H5hsx74Y872d7dS0aPu+ZLXs
   4EbzKCwAYQmRFITSRB+F/iupGD36kpAm+IZVPd0+KqBmqNAXMreqZIZ6c
   2qN2JcVwA7qLbvx/WPjpRg4qhFWZTOmLElEVsEYbUzahNqpIgQp95r7Vu
   yi68IltPRe1pYAYj6vX+kx2mG2KZEYk1rleMyoBcX+fSYc7MhdQ+Jzk2B
   g==;
X-CSE-ConnectionGUID: nktS+QTqTw+9Ca0kC/aE+Q==
X-CSE-MsgGUID: JRbp+5h2SgWWa/txnUAh5w==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 15 Jun 2026 13:48:55 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 65F5mqj2030760;
	Mon, 15 Jun 2026 13:48:52 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:48:51 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH 0/2] Add support for ITE IT885x USB PD controller
Date: Mon, 15 Jun 2026 21:47:38 +0800
Message-ID: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQFhOoVyku6uSPThe1ZBIRS
 u9u1OW3eG8nQ1YYXbqdMl5q+lwb+lNH8pjXO1hjMw1uCC44z1VMWQu2yAlzqRk8eoQowDmJpxZ
 uGUnfv+l0/dvqbYGU74mO4wNqwZ2PdgAAAA==
X-Change-ID: 20260605-ucsi-itepd-feature-95e6dcee4fc5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang
	<Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>, Eric Su
	<Eric.Su@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	D438130F484BC8F6F881F28309264865B798B7D71E3BACE103EBBCE6349514382002:8
X-MAIL:mse.ite.com.tw 65F5mqj2030760

This series adds Device Tree bindings and driver support for the ITE IT885x
USB Type-C Power Delivery controller over I2C. The driver uses the auxiliary
bus to spawn UCSI and Alternate Mode child devices from the main I2C core
driver.

Note: This driver has not been tested on physical hardware. Runtime
verification was performed using i2c-stub emulation with force-binding
on an x86_64 virtual machine.

Testing performed:
- checkpatch.pl: no errors or warnings
- dtschema (dt_binding_check): no errors or warnings
- Sparse static analysis (C=2 W=1): no errors or warnings
- checkstack.pl: no functions exceed 512-byte stack limit on x86_64 and arm64
- Dependency check (allnoconfig + make): all dependency is been added
- Kconfig tristate: tested =m, =y, =n and allmodconfig
- Cross-compilation: x86_64, arm64, arm32, powerpc64
- CONFIG_SMP and CONFIG_PREEMPT: both on and off
- Strict warning mode (W=1 EXTRA_CFLAGS=-W): no new warnings
- Fault injection (CONFIG_FAILSLAB): error paths verified on modified kernel

Question regarding Fault Injection testing:
Since physical hardware is currently unavailable for testing, my approach to
verifying the error handling paths was to temporarily modify the driver code
(e.g., forcing a function to return -ENOMEM), run the mock tests, and then
revert the code once passed. Is this ad-hoc instrumentation approach
acceptable for submission under these constraints, or is there an officially
recommended fault injection method that the community prefers for this kind of validation?

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT885x support
      usb: typec: ucsi: Add ITE IT885x Type-C PD controller driver

 .../devicetree/bindings/usb/ite,itepd-it885x.yaml  | 109 ++++
 MAINTAINERS                                        |  15 +
 drivers/usb/typec/ucsi/Kconfig                     |  15 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/itepd.c                     | 481 ++++++++++++++++++
 drivers/usb/typec/ucsi/itepd.h                     |  64 +++
 drivers/usb/typec/ucsi/itepd_altmode.c             | 438 ++++++++++++++++
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 558 +++++++++++++++++++++
 8 files changed, 1681 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260605-ucsi-itepd-feature-95e6dcee4fc5

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

