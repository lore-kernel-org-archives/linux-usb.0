Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B385D3947AD
	for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166666; cv=none; b=dy6g2CNj8mw65eUhJ1DqlZiTyGWEwTadUVcidGCIaikp9vvwzd8nYKLSK1tFomcmJLfKY1uiHYSfWGSMwkoI6oLGv1bcM4WXGCfs3oe7cVVFaq5fSdy84XHxofk2GBh2E66LnAdyxgCl7zTdg3M1bqTNtmXUXsw9VD561hhr+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166666; c=relaxed/simple;
	bh=i8+Rp2lm8fLOSvJCut0Z28GxDZMXSKPLZaUW+1NBCtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QG+wO6oYbq/IX3fiUg34nETYdGAVrqNTg/pnFavzR3dUQWv3l0Ww0G+H5rfVqZD3/OhH8chuJfgQxmCcuCO25PHcLov2kHpTtRRXie1UhFf4U/TNa/hOv3IRVyHfkngLCQhXf05FcSMM0n81cOS622y7prDb6zGpH0jxbjRql+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehgQ9oez; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehgQ9oez"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823c56765fdso3044524b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776166664; x=1776771464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=u0ActCVXLFthIaGOw+Dmt/Wj5PFa88ClW2h23NoquNs=;
        b=ehgQ9oezirx6YrYn1I2tQNT4PaLX3lV2eaceu+o85JXN1oWD9Neg44deJuDyHbQzH/
         Yz/McnNg0/ryjzl5eELS0JdlzyiX12008tLYnSJF6UYqkeJ1Slhu5sLKy/KnOVukdaaO
         g6WBy1hn16a+imL2bJwvjZY4FppvR6LaI5VxFjNbsby4S3lxxdtVcCRhx64ey0Z/9rIs
         OUik7lniFFeGmSCizj1UUmPU3731scgxRDjEUnAjL5yvHK36CLsckPTnCwBOFIZNUPdR
         rVSMrSMZQ3DZm+Nfe/njjZ8Zj7RUi59iyfKiwA8fII8BoNoWsUObDtnl6+hwLMOF2Kfw
         AxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166664; x=1776771464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0ActCVXLFthIaGOw+Dmt/Wj5PFa88ClW2h23NoquNs=;
        b=Lu2a8Vke8AKReGcS3JHbSljqMgltTcaJ6J/joEk4twa8Z7SHTMB2EGeuBjckVgYJQQ
         UqbIwDADMl3WLbObz5Pr930Wc6b/XMzw6lope+ZcjzcNrtKu8RraNBTRi7QOliGxKMpO
         V+Aqj2wQ+W5jdS/fEtmReXT/4L3mZdtu+AqqnHIvm/4X5CGkScmOz0bXcw/ImOqYRdHA
         XcXv/M7dCYU8oKJoMnIXgWHhOaPuTzMHzo3jnmZbq4AGQdduAHvTSYqytddZnD85Cxf6
         CbfTOBsHwPgjcvS7xnRd+X+vaFO8JZNsKFpC88g6EEMTnbfVEm26uDAgLkphgj3kqNn4
         mCaQ==
X-Gm-Message-State: AOJu0YzrDLtg7lSdjSa6uBqwIiWOvMQem70tE/6b/7tURR813+JQP7QI
	wiDMAelQGPDjB0DZxJBXqgipkUGj02tO8vuvszk+VrG2Ur+CT3OfocfWJPhKeFOp
X-Gm-Gg: AeBDiesclw07joT+tMev+GO49zu13tlcVjV3mD19TPizwlB+TaEfqhlI9w9yIjh8+hL
	+tIsP6ZbQ1c1UxVzLcJVA0Igv9C7NMbGUna4M0ju430yt3tYvTBJKG+5OuyG7bCFxdG+3N3BpO+
	3fAoUQJpHCZ4+yHF5N9Ja/qriB3uNK2qp1Wr7RXJZ4pSQFWgEMmR5CzpHbD5kGT0g9qclW0lFeq
	zat/idJ9QfVgatNtcRY3hnDko/R2A1n+SHaQ9RcHCgr65jp0+J3L0K3L7oMAV4XO8fIfkkq5EK5
	QG8g5EPJ9wE5cJFp3/RhzJbjPaREdWhtOyBqIBIyhC92SrXRdH6mngMApZsJtRdcZHKVJcLrEPM
	MuO/dkBr7F6VeAwfpDBLfCqbmS/cL0YNxmekieycrycy6fpYXfj1RJUVXBAedrBYO0NjYWgpiKV
	yij56C/FS7woZM6PfDJzSnKKf6x/w=
X-Received: by 2002:a05:6a00:2407:b0:82a:1499:263b with SMTP id d2e1a72fcca58-82f0c2df3dfmr17411423b3a.52.1776166664006;
        Tue, 14 Apr 2026 04:37:44 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e2119sm17100132b3a.47.2026.04.14.04.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:37:43 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Skip mapped PCIe down port when config read fails
Date: Tue, 14 Apr 2026 19:37:35 +0800
Message-ID: <20260414113735.51730-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tb_find_pcie_down() uses tb_pci_port_is_enabled() to check whether a
mapped downstream PCIe port is already in use before returning it for
tunnel activation. tb_pci_port_is_enabled() returns false both when the
port is genuinely disabled and when tb_port_read() fails (e.g. -EIO).

After resume on TBT5/PTL hardware the host router is not immediately
accessible. A config read on the mapped port returns -EIO. This causes
tb_pci_port_is_enabled() to return false, making tb_find_pcie_down()
treat the still-mapped port as free. tb_tunnel_activate() is then
called on this already-mapped port, fails with -EIO, and logs:

  "PCIe tunnel activation failed, aborting"

The display connected via the Thunderbolt dock is then lost until the
dock is unplugged and replugged.

Fix this by inlining the config read in tb_find_pcie_down() and
distinguishing three outcomes:
  - Read succeeds, PE bit set   -> port in use, skip (goto out)
  - Read succeeds, PE bit clear -> port free, return it
  - Read fails                  -> hardware not ready, skip (goto out)

When hardware is not ready the function falls through to
tb_find_unused_port() which returns NULL, causing tb_tunnel_pci() to
return 0 gracefully. The Connection Manager will retry via the hotplug
event when the device re-announces itself once the link is up.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/thunderbolt/tb.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952a..2712927b3837e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1848,9 +1848,26 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	}
 
 	if (down) {
+		u32 data;
+		int ret;
+
 		if (WARN_ON(!tb_port_is_pcie_down(down)))
 			goto out;
-		if (tb_pci_port_is_enabled(down))
+
+		ret = tb_port_read(down, &data, TB_CFG_PORT,
+				   down->cap_adap + ADP_PCIE_CS_0, 1);
+		if (ret) {
+			/*
+			 * Cannot read the adapter register, this could
+			 * mean the hardware is not ready yet (e.g. after
+			 * resume). Skip this port and fall back to
+			 * finding an unused port to avoid activating a
+			 * tunnel on an already mapped port.
+			 */
+			tb_port_dbg(down, "failed to read PCIe adapter status: %d\n", ret);
+			goto out;
+		}
+		if (data & ADP_PCIE_CS_0_PE)
 			goto out;
 
 		return down;
-- 
2.53.0

