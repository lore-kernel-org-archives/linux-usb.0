Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A334410D13;
	Thu,  9 Jul 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596364; cv=none; b=hteDGy/Iri2U7Au+Mw4AaJHA5+sjMaoYpmSzVXCKrSPI1iQOZHIMQPVlJwwHJUbjqWI6Rbc4fCm/YTBiwxlqkIlVKqK9JWZWq38XkgsBcW3BZNJ9EmpZEv77Fptyr9SOJPuWuFbi3PyvztrFfL0OSude7n5Po0FKUHBXdW4Cl7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596364; c=relaxed/simple;
	bh=OofZMJL109njsqXxz80JUFGZf9nrKd8SY+AvqSDKwNo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=AdXcbDNMDZprwN0HZvrc1AHhGtVSqkaDvFHV2JRjOP4A806cp9Bin2ecSBW1OJ2fuLiDNFX9YMaM8Pg2Oa/vXCUUi/cXBKY5V5zG7nEvnuqYykgKMfLmvKhAeHLfZu3WUFcd17A+9QtXUAsQt3db34ghQaQNsh/SQoz9GCsjuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=psqLETwd; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="psqLETwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=8WzcaJFlm+Ze+sn2/OTZccdOtQx+JEHSj35YZsPGCbg=;
  b=psqLETwdvQxXbMB54s6aP6Q8ja6kK/PkvSreZY0gt0byPOV3w9VyxdVc
   GN4cTdc9DDrgD2Hu4E2AaMLqqp4yLrnfGc4BZZnjL5mOhImRe8vVn7oiC
   j6qpQD4ddiiOs4TlQH+sgfZcG8MgD74VhRpQlF3xjm3FH8oeANSYKMFqv
   ASB0YL5Xz0KMLnFVPz/oy81Hf/ZsweacjRdgvnyh3pgW1pGrTkdX7o5VM
   ud06WMk1Ot3GpC14rul8rcXWmrRGZ18NgCmTm4x2lTYAH7ghQsuRqRkix
   pZUrzuS1uohqrJ080MalxzIouBj5N0G9IA4AwYtYm8G8dPNrl4zJqxzF4
   A==;
X-CSE-ConnectionGUID: 5bH+dLnMRk2SuDoJhxEfzg==
X-CSE-MsgGUID: 83hStgKiRi6v2diV7vfiKw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 09 Jul 2026 19:25:55 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 669BPpHn093117;
	Thu, 9 Jul 2026 19:25:51 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 19:25:50 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH v3 0/2] usb: typec: ucsi: Add ITE IT885x Type-C PD
 controller driver
Date: Fri, 10 Jul 2026 03:25:46 +0800
Message-ID: <20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NTQ6CMBBGr0Jm7ZBSKAor72FYYDuVMRFIW1BDu
 LsFti5fvp+3gCfH5KFOFnA0s+ehj5CfEtBd2z8I2UQGKWQpSqFw0p6RA40GLbVhcoSVotJoosJ
 qBXE4OrL82U9vzcF+uj9Jh+1pa3Tsw+C+u3WWW+8QnDPxTzBLFFhkVZFbo4zNL9eYp3p4peENz
 bquP1qmiWHHAAAA
X-Change-ID: 20260605-ucsi-itepd-feature-95e6dcee4fc5
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki
 Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL2.internal.ite.com.tw (192.168.65.41) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	F7C5159D00E60979CC7037F65561722ECF459CEE3E5641EE0976348B6114D89A2002:8
X-MAIL:mse.ite.com.tw 669BPpHn093117

This series adds Device Tree bindings and minimal UCSI driver
support for the ITE IT885x USB Type-C Power Delivery controller
over I2C.

Per Heikki's review of v1, this series has been split into smaller,
self-contained patches. This version drops the Alternate Mode
support, the UCSI command-translation hook, and the auxiliary-bus
core/client split entirely. The driver now does nothing more than
register the UCSI ports and partners. Alternate Mode support and
the auxiliary-bus split will follow in later series, once each
feature can be reviewed on its own.

v2 also had two high-severity issues found by Sashiko review,
both fixed in this version: a use-after-free race in remove() where
free_irq() ran after ucsi_unregister() had already freed the 
ucsi->connector array a pending IRQ could still access, and a missing
check on the interrupt-clear write that could unconditionally return
IRQ_HANDLED even when the hardware interrupt was never actually cleared,
risking an IRQ storm.

Note: This driver has not been tested on physical hardware. Runtime
verification was performed by building the module out-of-tree
against the currently running kernel's headers and loading it on an
x86_64 virtual machine, using i2c-stub with manual device
instantiation to trigger probe().

Testing performed:
- checkpatch.pl --strict: no errors or warnings
- dt_binding_check / dtbs_check: no errors or warnings
- Sparse (C=2 CF="-D__CHECK_ENDIAN__"): no errors or warnings
- checkstack.pl: no functions exceed 512-byte stack limit on
  x86_64, arm64, arm32, and ppc64le
- Kconfig tristate: tested =m, =y, =n, allmodconfig, allnoconfig
- Cross-compilation: x86_64, arm64, arm32, ppc64le
- CONFIG_SMP and CONFIG_PREEMPT: both on and off
- Strict warning mode (W=1 EXTRA_CFLAGS=-W): no new warnings
- i2c-stub emulation with manual device instantiation: re-verified
  after the v3 fixes,probe() still correctly rejects devices with 
  no IRQ resource (-ENODEV), no crash, module load/unload cycle clean
- Fault injection (CONFIG_FAILSLAB, fail-nth): each reachable kzalloc()/
  devm_kzalloc() in probe() was individually failed and returned -ENOMEM
  cleanly with correct teardown; the runtime IRQ/UCSI paths were not
  reachable via i2c-stub.

Note: big-endian (ppc64) cross-compilation was not tested, as
TYPEC_UCSI currently depends on !CPU_BIG_ENDIAN upstream. Byte-order
correctness was instead verified via sparse.

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT885x support
      usb: typec: ucsi: Add ITE IT885x Type-C PD controller driver

 .../devicetree/bindings/usb/ite,itepd-it885x.yaml  | 105 ++++++
 MAINTAINERS                                        |  12 +
 drivers/usb/typec/ucsi/Kconfig                     |  10 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 354 +++++++++++++++++++++
 5 files changed, 482 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260605-ucsi-itepd-feature-95e6dcee4fc5

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

