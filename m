Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2E3F4DE9
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304273; cv=none; b=oZcROOf8IPq976HsMlLbSkMDk+VHM34ASZrKZ78VVh7tBgluXvqxGtf7RiKxjXINQb69CSYb26zLv2BZ5pGQyiheSQVdh7hXD/s/bFaL6BLbuOP6kO7oNVinDPMPRoy0JCOCJ5/omsyzrso1A84ghHu2bASSaFN32w4uNwAnkGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304273; c=relaxed/simple;
	bh=OnATg2/D+/gyXaaoqtHimpPW7zrRblZmuMuESacm6xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hg/KW5PmETmVBDpHbqQGTxqqyRpfy1ZcO0gM9yZ5H8zF2Ln6kAlZ9vj1hYvb4MnyRnyTZOevVabCnSMik7T0NoDpO3ttNbYhpp/YZ+b/SlK3U5VeSp90FtDnE5SrnA/tPMiYFPUMVlWGQ5ArNxSdT6GCrqgy477d+qoviIox5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=KrHmey5F; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="KrHmey5F"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1109108a91.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304271; x=1792909071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8L+sSbfsXoJhkdRVI7O/fd02RBxlaKsiP6HOj+6ag4=;
        b=KrHmey5FenbANR/w9v7yE8qVa/o/70KZtKMvhMYss/ZKDcjgWkBp5wAWTkBchv9ry9
         /v4RShnggNafnbyZx2wbDBbuoadOs6AEQAibhlYcCfNRA085tOBBN0NzdtBZOjo8jicy
         vZUYaqTaTRBmVJlks4s0YF0AQx4J50sVfYtBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304271; x=1792909071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8L+sSbfsXoJhkdRVI7O/fd02RBxlaKsiP6HOj+6ag4=;
        b=1bp6/vHDBMOYPx/u35CDNRgsNndN4io2iGcUnYWnREJt7VPoosFJdvLcuIL7xo30lI
         XQflEM5zhjR5fcNZAJwKjFda2cC2AAXFUj1eu7qcfQjfbJuL5Kmeyj5/3lDJEsxIWBLj
         hBq/2lZHV5oBI4VAfInd5jyS0FTt+lAUaE2m5BeK6sshcSJ8lQ7Ky0lEkLJzw3MHBuxC
         P6XnlbFgMLwLBurVcS8s9vorcY7MxQpaE3bZssiUTAeqCtcFM3G1xFya/xE1ZNWlwakN
         Ss3nvRgy5K86VQDP8QPGIp+ks2BYK1fR/Zq8eij8MMdXi77sXh1ZDdg7IU3cCSGqaYBS
         mDSw==
X-Forwarded-Encrypted: i=1; AKwUvBzqIhJMiSjCg08atb7RAZn5dM4T5AbEVlRGnTaUQL2CS7cShOs2eycxfvgnvJXctAO5v8yHmPMS60s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh5yTukYW7Gv0S3iVWdsE89YdgFkp6JAb27khECywDg0U2flGC
	/gylnse/kRcSwFk1a8YJV0AITwBJrIWYtui+CWXBU7opjR3qawr0TYoy2pvkXS+RbFc=
X-Gm-Gg: AYBFou2FXFv80sQiPvG97bhn0zcQ9sSETaLTgny6haBxbm3lCYQ3gyNoKGCs5DPUt/g
	TIfE5MTLDsyf5Ub3aZ6WCtBGAvsw+58fFaKeoSX43ekn+6RZH9/s7cCKiyXBZsw1D46xEBiIAWI
	SVRMfAujl4WMz/ZnmLwvkF4d1ngRbZ4ToyMSS5gHkwU2nC/q8i0J/wWMyUMs4HgTN9G9dUJvI/U
	Uvw2ccHLANfFYysI8zB1lwWhVt8rlheTRUZYRf954ci7QcUIzj0SQc90+NA9hK3TfZgDAHu7CPI
	Ug2vztnN4TGP8ENJA+kFygiGESKJ4icj8cD0kWpwXwLnPEEx368P47ZQskEatd6SQ3kbdwm/m/S
	td/xUEhEah4+6tW25+9y9DbViHdthDBpLPUu3i6aPXXZ4OF31hfhMu0LO07Pip7eLaGkInl3mGI
	ychjbdeIMj1A+0p7ax+i5avQ4zZ4iX9Jca7uPGM1XIq3ou/gVSPvfGFDkl8IoyMj8ijTR1VIPYi
	d/ZIr8VeqLtlarDZoaRqK56AHUVVDDrspYWewBxFApPohJ1b2/AKMROXC39u4GPqQ==
X-Received: by 2002:a17:90b:224e:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3aceebf67eamr4049361a91.25.1792304271018;
        Sat, 17 Oct 2026 23:17:51 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm11025963a91.3.2026.10.17.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:17:50 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] net: usb: lan78xx: reject short register and statistics reads
Date: Sun, 18 Oct 2026 14:17:34 +0800
Message-ID: <20261018061734.19488-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
References: <20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Jie Law <98lawweijie@gmail.com>

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

With an emulated device on a kernel booted with init_on_alloc=0:

- A reply to the statistics request that is shorter than the 188 byte
  counter block leaves the rest of the kmalloc-192 buffer stale, and
  ethtool -S, which needs no privileges, reports it. Before the
  previous patch, a zero-length reply was enough: one counter pair read
  back as 0xffffffff8a427800, the address of
  usb_api_blocking_completion(), next to several direct map pointers.
  With the previous patch a zero-length reply is already harmless, but
  a reply of 1 to 187 bytes still gets through.

- A zero-length reply to the RX_ADDRL/RX_ADDRH reads in
  lan78xx_init_mac_address() turns uninitialized heap memory into the
  MAC address (12:85:1f:dc:2e:bd and e6:93:44:41:9b:9f on two probes).
  Both of those are valid unicast addresses, so they are used as they
  are: written to MAF_LO(0)/MAF_HI(0) and set as the address of the
  net device, where anyone can read it.

Treat a short transfer as -EIO in both helpers. With this change the
same device fails to probe with -EIO, and a short statistics reply
fails with -EIO and, with the previous patch, leaves the counters
unchanged.

This patch needs the previous one. Without it, a failed statistics read
would make lan78xx_update_stats() compute the counters from its
uninitialized on-stack buffer, so the leak would move from the heap to
the stack. Both patches are Cc: stable and should be backported
together.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
---
 drivers/net/usb/lan78xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index cb8204371f5c..e6be066349de 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -612,6 +612,9 @@ static int lan78xx_read_reg(struct lan78xx_net *dev, u32 index, u32 *data)
 			      USB_VENDOR_REQUEST_READ_REGISTER,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_GET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		le32_to_cpus(buf);
 		*data = *buf;
@@ -695,6 +698,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
 			      (void *)stats,
 			      sizeof(*stats),
 			      USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*stats))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		src = (u32 *)stats;
 		dst = (u32 *)data;
-- 
2.43.0

