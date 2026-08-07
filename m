Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33B45D5E8;
	Fri,  7 Aug 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097848; cv=none; b=CMey7xrqgJ2OTxNW/eG2lHK1FTCIlZJXg+yTrU91Okmic7GSDoLzVqwXXv29sz2r6LqgbgxddvAgIz06uZ87jfb7ztZJ2MxBx4j7NfDqad8hiDqBeAPv99TU9vfgt9Q13itHzgefouRPnKVEtZxkzcl5Ebv2qaV245YG2cFB+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097848; c=relaxed/simple;
	bh=R0eQzBv0zIMHElybneI+uHWGy71vu5LZ9/xpUTeI9EA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dpsy4RolDeO0iHFLn6ZHCApLvsSyPuSQW1m03ytwJSN6FDOi9ESOIfz7yM110xNc6ODz6jg0MZlMLy4nKGJi7snSlMdDaSsRF7APCPut3Ee8EHW52Rfk0u/jAmmLrcCcPvuzOW3negK10nabZxI7A0EpvFSd6jJ2n9J7Hh4k2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=FnyWWms2; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="FnyWWms2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=YGP8AUz1kay8vMY15NtD05158DNApkOAH4JyHfK9gxY=;
  b=FnyWWms2TghGHyEKPHYQjcw/Z8djrkb49KdTR3y+BgiEYp9vl7in7xeF
   KiaZaZ6D05KJe2WbELmh1vAthxgnFDOjzffhxxJQ0Z14iKOTnIT5rD23L
   6oZgf44JOr1Wa08r9ruOTOFkgJe+xN5fWY3dThZCvBr7RcnHjGpgnAjvf
   +XSkzN0W6YFLFylaQdaBUMEksmsCiaBxh9hjbzvHj5t5NUjX2Luuk4cx/
   igf4EuLc1Gf0y0xTvbNsFBnphQ9MwKp8rrCNHHOtIkegtXih/gsWDEibP
   ZqvwhGluRe2CI1DCH/RA6y2PogBdRmb35ADd0x6028TJcEJDi4K7Sc+zm
   Q==;
X-CSE-ConnectionGUID: UKzbBSOhQR2jhz1nF7XxBg==
X-CSE-MsgGUID: Svw+hofQRvS2xLYyhlvDiA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 07 Aug 2026 18:17:11 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 677AHASj092219;
	Fri, 7 Aug 2026 18:17:10 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 18:17:08 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Subject: [PATCH v7 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Date: Fri, 7 Aug 2026 18:17:44 +0800
Message-ID: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBAF4KuQri3pLwVX3sO4KO0gNVFIC6gh3
 N0WNxBdvsn73swogHcQ0DGbkYfJBdc9YlCHDJlWP66AnY0ZMcIKoqjCowkOuwF6iwVUggPlJWs
 IiqD30LjXOna+fHMY6xuYIS2kRuvC0Pn3+m0Sqfd3eBKY4IbXWmprLbHNKd5z093z4YnS8iQ3l
 omdldFaqksO0lRGqR9bbCynO1sky6QGympa0v3fZVk+Z3xM0C8BAAA=
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
X-ClientProxiedBy: CSBMAIL2.internal.ite.com.tw (192.168.65.41) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	50FB800E79E4CE34FC960823F750DF5BF0E27470A286EA86C948177B0958B2D42002:8
X-MAIL:mse.ite.com.tw 677AHASj092219

This series adds Device Tree bindings and minimal UCSI driver support 
for the ITE IT8851/IT8853 USB Type-C Power Delivery controller over I2C.

Changes in v7:
- dt-bindings: define 'reg' for the connector@[01] nodes, since a
  unit-address requires a 'reg' property.
- dt-bindings: dropped Krzysztof's Reviewed-by tag due to the above
  change.
- ucsi_itepd: use guard(mutex) in itepd_process_event(),
  ucsi_itepd_read_cci() and ucsi_itepd_read_message_in().
- ucsi_itepd: kept request_threaded_irq() instead of
  devm_request_threaded_irq(). ucsi_destroy() is not devres-managed and
  runs inside remove(), while a devm IRQ is only released after remove()
  has returned; an interrupt in that window would call
  ucsi_notify_common() on an already destroyed ucsi instance.

Link to v6: https://patch.msgid.link/20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw
Link to v5: https://patch.msgid.link/20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw
Link to v4: https://lore.kernel.org/all/20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw/
Link to v3: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw/
Link to v2: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw/
Link to v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
Amber Kao (2):
      dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD controllers
      usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD controller driver

 .../devicetree/bindings/usb/ite,it8851.yaml        | 156 +++++++++
 MAINTAINERS                                        |   9 +
 drivers/usb/typec/ucsi/Kconfig                     |  10 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c                | 356 +++++++++++++++++++++
 5 files changed, 532 insertions(+)
---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260717-ucsi-itepd-4e943e1382f0

Best regards,
--  
Amber Kao <amber.kao@ite.com.tw>

