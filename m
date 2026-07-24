Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0B218592;
	Fri, 24 Jul 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887736; cv=none; b=dfuB2kXrqHOIp4DiwV7+spFpCYUuupn4qPXvgULJv8vGG5FHDBdp1Ncg/iSffncbcGU2YoHu9xXmgLP4xgvTd2L7yWoSmn29Zg1e7LIDX588MUv+6D3Ad71IIPj4ZlvmnVKng8ko58KrhYoHNkyDFWPid5i7s9ZgJYFLJnaqyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887736; c=relaxed/simple;
	bh=jXr+d29cM7/bs+EgTGZiqe9DF7qRXPgO6kkYLF/np+M=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=evlagN46vuhoLYI1wFQtqeE/hXTISqySK5EnxEiDWjuurPBpri5AV+i+/jOcV4EP5zZHWS3YqSU+ZszHOmcl/OhlZIs+5/4is6YevrQqFOkvT1gcb4jTD4YASkvasOUEaKCneaPHlwbM5yIUboCPFByw9sqcWZw2PxncHeiI2sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=mnzUllrZ; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="mnzUllrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=y0rjAn7uCDN2T2yvFgBmTw9GhAV5ePHmiXKBOSDvXqs=;
  b=mnzUllrZCShcQ/vPCbCOck2bu0Mn0DdXawAKpnT775lkW3O4bTtC46Ie
   MJAwnI5wgfrWV1slnjhLn3aKs/roMwii8kKW+jodocZftjJPP7SJLGJ/c
   pNGj1uT4XQRYWpDFsQRkREr5MqFpDgxj2SS0e8TutVa8AmfW5wcEYYq3a
   hO0TwIXA4f5TezijvWNO1yIQvOJ3vUXL/WEBxBwKXzKpkuXSBc74sMmHs
   krAFEITMT71QF4TZtByvDHkExlgZLdBbzQ4FqO6feTBz0NrLHaia9I3+s
   zUPD7nEKpmDQ+iLrOCkDv5cG0Xqbk3R/Y3YmDtsDfqQfkZDuugoYKb76o
   A==;
X-CSE-ConnectionGUID: 6nbddMcYT86uTbh5sgQjsg==
X-CSE-MsgGUID: 3BixHLXARESTyQDz7FajHg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 24 Jul 2026 18:08:44 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66OA8gF1061254;
	Fri, 24 Jul 2026 18:08:42 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 18:08:41 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH v5 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Date: Fri, 24 Jul 2026 18:09:18 +0800
Message-ID: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBREr0L+2pJCi6gr72FYlPZXvomUtKVqC
 He34Nblm8y8WSCgJwxwKRbwmCiQGzM0hwL0oMY7MjKZoeb1kbdVy2YdiFHEyTCJZymwEqfacsi
 DyaOl9y67dT8Oc/9AHTfD1hgoROc/+1uSW++vOEnGmRW9apQxhht7zXmp3bOML+jWdf0CN1uOe
 7cAAAA=
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
	A777936220F962DB246E32E4F53B96F706C5AD182E13193963A6C0ADC02FCE2A2002:8
X-MAIL:mse.ite.com.tw 66OA8gF1061254

This series adds Device Tree bindings and minimal UCSI driver support 
for the ITE IT8851/IT8853 USB Type-C Power Delivery controller over I2C.

Changes in v5:
- dt-bindings: express compatible as ite,it8853 + ite,it8851 fallback
  instead of a plain enum, since the driver treats both parts
  identically (Krzysztof)
- dt-bindings: use consistent quoting for patternProperties key
  (Krzysztof)
- dt-bindings: add anyOf requiring at least one of connector@0/
  connector@1 (Krzysztof)
- Drop the unnecessary heap-allocated tx/rx buffers in
  itepd_read_reg()/itepd_write_reg(); use the caller-supplied buffer
  and a local variable directly instead (Heikki)
- Ack the interrupt in itepd_process_event() even when the CCI/
  msg-in I2C read fails, instead of bailing out before acking, to
  avoid an interrupt storm on transient I2C errors (Sashiko)
- Not changed: keep ucsi_unregister() before free_irq() in remove().
  the IRQ handler is the only event consumer/acker on this device,
  so freeing the IRQ first stalls in-flight commands until timeout.
  ucsi_unregister() disables notifications via async_control() first,
  narrowing the reported UAF window to the interval before free_irq() 
  masks the interrupt; IRQF_ONESHOT and free_irq()'s synchronous wait
  mean only a newly-arriving event in that narrow window remains exposed
  (Sashiko, not addressed)
- Not changed: keep itepd_read_reg()/itepd_write_reg() built on
  i2c_transfer() rather than switching to
  i2c_smbus_{read,write}_i2c_block_data(). The read path needs this
  regardless, since the message-in register can return up to 40
  bytes, exceeding the 32-byte SMBus block-read limit; write is kept
  on the same helper style for consistency rather than mixing APIs
  for a few lines of savings. (Heikki, not addressed)

Link to v4: https://lore.kernel.org/all/20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw/
Link to v3: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw/
Link to v2: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw/
Link to v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD controllers
      usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

 .../devicetree/bindings/usb/ite,it8851.yaml        | 151 +++++++++
 MAINTAINERS                                        |   9 +
 drivers/usb/typec/ucsi/Kconfig                     |  10 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 365 +++++++++++++++++++++
 5 files changed, 536 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260717-ucsi-itepd-4e943e1382f0

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

