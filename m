Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF13C415E
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 05:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141483; cv=none; b=DXaoTPM1Efi7m89ENiELGAqbub0knpUE3nFAC7CT1om09UvttYv2eWBttLt9kGRP25glOT7FicE6S8GjY0Yxfy3N0ps0Jgc0/bUgyxKJLDnzbKhzmLLFH2QOtir03BTMiXNFcLkJKVbvjFYtcAHH4ym24wGEtO1pQ09Mc1CR8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141483; c=relaxed/simple;
	bh=ehFRQ3FZleExfRY9jjlGGdk7L45AX2N0aVofYNFEIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cil+pBvu5mWoF+C/CfDIkZUsbRq2q4VcY7S3rChccXKx7hLqpHR27723IkgYSoRPRWQOY9bMbzdj7dWtckI6EyjfHKXj+sV7kqQtDfHeoYR9S6PnktKE0U9p1a2K7XxO3DnGeIUkJ8p5Zkj02Mf/UH5C42QRY4JQQqOqud2Khfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3vOoP8p; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3vOoP8p"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76906adso11523931cf.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 22:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141481; x=1790746281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFpOg8k0FRJ6+H0KfdVDioIX8p2jh6VxkW8sAx0q0/Q=;
        b=j3vOoP8pRQ9BrhOxrhsotlGge/xt20Jlxm5Nt86aYCLgHFxNiMPd9NHQn4oBsUKTV1
         0yTWOQWWhv41ByQcNsxtKcXxhl/Iow41OJo/XSeAkwMgWj9BLy1jKvBKxnPsbovWUxOV
         X5tnVC+sbaU1pnEwMgxuIkc/4Zh1joO+c47jBPoGFjZMZj6Cv+rFT+EFeaK/N2FOPSj/
         8JzxcZ3R2b10bGr05jqSXnwU3epbhzDFZIIVP4UsXWha2mt4NVGqjwVD4+vNLlW5n1Ub
         w0m0b8avXtYVbMDrrAPmfhXaJ2Z7yYXCto5JnBwz9RfEGk/UAild135OWfzvxXyVFXKk
         Phhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141481; x=1790746281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFpOg8k0FRJ6+H0KfdVDioIX8p2jh6VxkW8sAx0q0/Q=;
        b=xOO2diHf2Z7evI06RBVaRMwRRa9K3rVaOvdyof1S1HRxfGwKGJq/o5INfMQ1hFQTKC
         MD3H7mTOXeKRo/Hb1tdwFg0XYSha0n6/sueDOxDmNBnGFJ3e+T/uR28u1PA8qjkS0gsG
         rgVDfbIPkvZ8akVLHIvfNpUaLBktK5JROCChpG5odvObBBhsXsauQaCK61S5aTjOT5CD
         OycZ9FMzVTjeuW/ajSb3F3I/4Gg47ngX8UXdUnbou6Zf1OK0vskONymDs+Hz8+qhPoh6
         v6Qv5rTnKgFF94oltoCiJH5tv4oZilk3Ifsg4A3/lPXdW3j+yR56YNi5ZlvZwmGhYjuN
         q/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0PIj6B8f/pgeRCGy2DhhD7R3EbNQV6aXttz6QEUHFlalNj+15HwdaqRKzHxwIR+HsF2YAVQ6uNNY=@vger.kernel.org
X-Gm-Message-State: AFuF++nv2HqS+mipnRcUvrXhPl3BiNRvj9e6l7rLzlp/4nGYmfFkzTcM
	3QndZxAYM25mBKNZ9n5F9+4mY0cipCLayODGFhbxsBohMfd7aUFmPzCETkKz0Co6rpQdTTw=
X-Gm-Gg: AYBFou2nLmTQuSVviImxXTCdpmb1NQvqrUc5vOh1g6dwOPjToW8SiEweWpqisw9SvA6
	IiLL3vedttWS9ixiTeSOvC+L4RPRemWDJJcXKt9Uy0tuVKN1OGmdkAAh9OVByUmaJhVZSwoTVwl
	S2JoPE61BQhVTOQXMtM4SvjdwLR7F39/a0tSFcpKKZTbzkHWzSR0MvUFdLE0WtSq8L0VK5D3/Eb
	rK5efHLIDygzSxD9i7zoTw2jxg0lmYdeMw6onrHJspVcAhcNzfaz9Pk5b7/1otGrFd+/FRSUwcL
	Grppdmd/UyBS3Y3uZy+5DtxQOy3gOlCoPFI3r+3ImIY6BXOLTfKJ2ciI1RB0oUDQpgQauVFUlzF
	HpZWuGeEZL81I91IG3MDIrtO9+ISmYjZww1erTnSJu0/RN8fkpT0cWiBpRW77qXZZQLRuVnKsYY
	U1JQM+cfsbFFf+MYRDoZXiQY2EymrDiUGDKV4ptEC8bRFnxLSBbzM62A+hPiPy7fspxUzimNOAK
	fxKXiAJklu3/+6gk6I2vZ0eSXiGcrBTH9eBBBl8dfOcwXoUhLAt5TAHUsaDesUZodP7RX0oNaKf
	HjjkqniVBILhF5UJ+Au5y8baVD7BO0scf9YnFpQhbN28oG5LPTrAEEtQ9e2EJ1c/qPYQcyBLjwf
	w1Ay8DmUH76N5
X-Received: by 2002:a05:6214:4a81:b0:910:3de8:177a with SMTP id 6a1803df08f44-9140c368a32mr24771786d6.16.1790141480528;
        Tue, 22 Sep 2026 22:31:20 -0700 (PDT)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c2a71cdsm13876646d6.3.2026.09.22.22.31.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 22:31:19 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: host: xhci-tegra: Unregister OTG notifier before cancelling id_work
Date: Wed, 23 Sep 2026 01:31:17 -0400
Message-ID: <20260923053118.92147-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_xusb_remove() cancels id_work, then calls otg_set_host() with a
NULL host.  That leaves id_nb registered until devm_usb_phy_release2()
runs after .remove() returns, so a role change can queue id_work again
and use the HCD released by usb_put_hcd().

Unregister id_nb first.  atomic_notifier_chain_unregister() finishes
callbacks already on the chain, and cancel_work_sync() drains the work
they queued.  devm_usb_phy_release2() unregisters again.  A second
unregister finds no entry; the wrapper discards the internal -ENOENT.
The devres entry is still required for usb_put_phy().

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: f836e7843036 ("usb: xhci-tegra: Add OTG support")
Cc: stable@vger.kernel.org # 5.7+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6f235d1e117e..f5894f2a5991 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1542,11 +1542,20 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xusb *tegra)
 {
 	unsigned int i;
 
-	cancel_work_sync(&tegra->id_work);
-
-	for (i = 0; i < tegra->num_usb_phys; i++)
-		if (tegra->usbphy[i])
+	/*
+	 * id_nb is registered on the PHY notifier chain by
+	 * devm_usb_get_phy_by_node(), so devres would only drop it after
+	 * tegra_xusb_remove() has returned.  Unregister it here, before the
+	 * work is cancelled, so that it cannot be queued again.
+	 */
+	for (i = 0; i < tegra->num_usb_phys; i++) {
+		if (tegra->usbphy[i]) {
+			usb_unregister_notifier(tegra->usbphy[i], &tegra->id_nb);
 			otg_set_host(tegra->usbphy[i]->otg, NULL);
+		}
+	}
+
+	cancel_work_sync(&tegra->id_work);
 }
 
 static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xusb *tegra)

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
