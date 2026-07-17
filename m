Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89D3DF008;
	Fri, 17 Jul 2026 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282564; cv=none; b=sYY21VurmQsyVSGIJql1ZrQTL7kV3Zqj9TsryGVV+l/0CR1UczuRamUAFTNPoPhPZWtw7hQaC4eHmRut7GHKVg937N3lOl7ktECMhrb+xcZb8omxujSzd5mQHlJoIUarkTGN7B5FuN2Uc6gRuy5vxEIBUr0Zxx5FTM1syVFwj5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282564; c=relaxed/simple;
	bh=o+mpTeIBbVRILnx3uhF//4VG9dyZm+hAnzfFa7mHxuU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HlaXroDIebUIbX3CbVfnDK/vVMApLeLn9sf3wNvCA+lPLYC4fEJAuENIAEsB9ZZeZE/5PHSeTPWF1HqEqkYOYs789VzITuAB0Wcp9Zfm/8g9bONwiKo5qb9hORlYZM+DN2NV+ZOLw8F4/6PMXIYqCx4GwjtSZI9pkktqZejqquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=rvTsVNw4; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="rvTsVNw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=yjbCoxUFcXGlFaUXJEn0QziP5mDLTxHIv1wEDIrOvkQ=;
  b=rvTsVNw4tmz/LH9LP9F7d2eXhMOD6F+S7QA/MfSvkfC11P8EiL4POTrV
   J6zq9zYFX2RAaSMX/2ntHuc0YECLqP3bch2qr2bKxoBIiBY4+ygd4S9d2
   J76LOWOQUawx+YbaP6eoSrLiFMP5janjJXv1zbbrEw/9LipoeLa4uc7aR
   0gTHSa6evIJO8gwBvYp48ba8nx9+kUciIHPUi8CHbZk7IwByw7t2tWGTy
   jnlxFk/Zwzy1VHKJVe1d0Y9ZXvCrdFT8k0wQB9d7EthKq16Sx25QxpqMY
   Oi+tM3LDCTEn24QqxX1RyRFB2kJcaHxUIkcmbE7SX765OF4GHhMIyFiu8
   g==;
X-CSE-ConnectionGUID: BaGmOSUqTiKYw4wIKkOHPQ==
X-CSE-MsgGUID: dPdmZDmVTY6jeg/M856l3g==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 17 Jul 2026 17:59:17 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66H9xDoU095316;
	Fri, 17 Jul 2026 17:59:13 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 17:59:12 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH v4 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Date: Fri, 17 Jul 2026 17:59:48 +0800
Message-ID: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nz3dLk4kzdzJLUghRdk1RLE+NUQ2MLozQDJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAEq+wMpuAAAA
X-Change-ID: 20260717-ucsi-itepd-4e943e1382f0
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>,
        Bling
 Chiang <Bling.Chiang@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Doreen Lin
	<doreen.lin@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	C59206A1C2B6E01EAB3465E57228AC3B2BA5E458C6E9C4D270E5CEB6D44C834C2002:8
X-MAIL:mse.ite.com.tw 66H9xDoU095316

This series adds Device Tree bindings and minimal UCSI driver support 
for the ITE IT8851/IT8853 USB Type-C Power Delivery controller over I2C.

Changes in v4:
- Use separate tx/rx buffers in itepd_read_reg() for DMA safety
- Rate-limit error prints in the I2C accessors
- Refactor IRQ and poll_cci() into a common itepd_process_event()
  helper serialized by event_lock; poll_cci() now acks events
- Clear cached CCI on PPM_RESET
- Drain pending events in probe instead of a manual interrupt-clear
- Keep ucsi_unregister() before free_irq() in remove(): the IRQ
  handler is the only event consumer/acker on this device, so
  freeing the IRQ first stalls in-flight commands until timeout and
  leaves the PPM with an unacked event. ucsi_unregister() disables
  notifications before freeing connectors, closing the reported UAF
  window in practice. Matches other UCSI I2C drivers.
- Use device-specific compatibles "ite,it8851"/"ite,it8853"
- Move version changelog below the "---" line (Krzysztof)
- Trim MAINTAINERS reviewer list (Krzysztof)

Link to v3: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw/
Link to v2: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw/
Link to v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD controllers
      usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

 .../devicetree/bindings/usb/ite,it8851.yaml        | 142 ++++++++
 MAINTAINERS                                        |   9 +
 drivers/usb/typec/ucsi/Kconfig                     |  10 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 381 +++++++++++++++++++++
 5 files changed, 543 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260717-ucsi-itepd-4e943e1382f0

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

