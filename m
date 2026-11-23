Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409062;
	b=ixKrBMh5TfVJc4Z8nt93MY4k2bpCm2QF1AwfUcBRUEWJQUqtZdf8xk6oxPZJw1JCm8m7
	 yV2kxSKb2lTDShHYkbzc8tGcIF9eAFa9dp7Mtn2FkLhxqGkgqZ1CEHSEvRq/ZIznhv/NU
	 hMsx6zIfzajNeS7y0x8STqtS3BE+UAUxO7HGD6Q+LbnMMapFGPfAcO76dsd3Fos5n9QsU
	 fMptYytnGHhmDXOCsTYCyyBxqoRYI9iIOR2oC5oyftRIMhht+qo7xWWZKSTwyoSZDFJRF
	 JKv78GrM2bFjpqnobc90ppx39w75kG0mWNsbxK9FJNXz1gAjbUU+17GHcyKet2PvSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
	b=nFBWUhUfdweFC4OlOPsEPeeZtbWCsCIwm0zHQbTqh+2pwO8c4kv0K8Chf9haSXHyoluo
	 GfT/z3u+fRXh5F8Ej6D4YONjY4VxsVHF34dMBkO+9yqlbji45/aPCGW+Dpgbybhk2BapB
	 HoPMguxCZ0zDJvOFQWG1m+tsmruNMdiQi6Gc5oNJ07BhcLu3KAezkIHWdnwUttmHv6ou2
	 Jc8JGvvAtEmcZD8+fRjoJPML4pHHjwOmcVSvf6pRtY7e+BcrolXDOR0e1HuZa0KtFGGN3
	 nSuPSMgRVtEgkGMMAumbRAz/9DmtqO6r1UBiLF63mrKhcg4rMVij2JuAiKS/PHNJt1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ie1cTnKp;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17CD606A32D
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ie1cTnKp
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so3679023eec.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 20:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795409061; x=1796013861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
        b=ie1cTnKp4MfSfSiEz5OiGwUZxrqFS6GKSJUJ/+96XcM3BSMwu76i0YBbVgn0WR0etQ
         CA/OWd3qbH5T23Z1cTJ59bGwzzjD6qzFhorJbnaj/FD5eIPiVgiMFzi/+kANFS93iNng
         AFZ2F7M/2fEBWyB468wgkpCDzSBaxnkqaTjdjTleHMqpdIp31d9v7eFWA1+7Bj//BmYg
         0qdbhEfDSzD+dM4AD3qyNLTkzGa/+tBYXH9wnAjIPiBR7+dN1qSwZCU3KudcGG0bij6I
         c+grS98KAOQphg5blyzLGMhPhMe+EhOQ1at+fpR6Bu5fnxX2qBl9zXDPKECcsktprkZU
         Kcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409061; x=1796013861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdTqrxCjGzvBio68N6oddwP08xR12JMZ0ERx58k85rY=;
        b=spVGyu3MHuvUCO5/5n+baqb1qdey48A3z63E5Afc3VMFDG94mtmMzhko6y6lZCrCpX
         Jiff9LC+MJxT1VP4BnTR5wwjZGwZe17PEviqsuHMAsWoiAFb60rZiWDdpP0jKEQTvkB2
         DDBuMZleLPpK+nT3u6o4juSmTtLHqdhH63Cejv/7HW3kH5/tG7SYYHNgC1oPHUJCOG07
         2xhKqzk+Rc2dIq9cGs1qItDiReU+XU3RX5xx1QXU9JgC0oR3EobHtZ0PCqBemFEFpRwe
         o5QM9LwfSko6Jzx1h6P0JBWUghbBp86slXj5FH2K0fvln5dpqb4QHkteNnIFtQ+i5x2/
         f6WQ==
X-Forwarded-Encrypted: i=1; AL+hErGkoQY+XMBQ/hpUNnqExKwQS4s1eI6I6L93qSh8QKzTOontgyZfUGz2vF+FkbksmnzEibRETM2X6zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lJiaWohDjhr46ap3G2W6rcq5ZxSAJ6gZBL5qwCeTkTdp1c0Jt
	gsjMNwku1icbUh2t6LMWxshPKfQZLxA+JHSDsKyxOFLn3+wAI24nv2Aad+9ZOszz
X-Gm-Gg: AZFdTZfauDYl6uT/hfgA8t1MBGm5RnyVeRfoAe576X5QYLW9UtwKWNsa1sH8njHIJGU
	eFjM7fbUQT5RmLfAKvQ2b7q4RogwPyHUqoppn+ajO5WsIfBBPa2NU9HvocwEkZj62uU6yDFHQC/
	fEc8YFNcsrM13MO09haDINI0Yuf4xCopCU+3y3GNgAGY9aTBiE2poaSBENBOYAAMlHp0LjpnBNl
	Csgavk909gNtkTZIXnxdZWS37VaEBexQqPVKJc4J4RwcrfrvvFuvCLKfMwNuj0bVSd9TP40527j
	qTgIyyRwsjOzeQGK1SlQy57NOb5MKMZSSk6+882QmLmgISNBFWOFE9sGOYyLd698xHUc5hTe9t1
	1zksvV5Ne9bKLYZ4h3NGEDEnrekWwsmt01Oem7HhRd/JzNYAglQaKq3nlMjeba2UhV1iGmp43tC
	Daeu4/MSDwabob7UoVDMoc8+u31Y5W26lRimuSmW9KE4kjthn/y7D7JcqMsZxyJsgzG6ZrgwE0f
	3CcvjgT5Ngh5yyKzeTUstMMwYFlv8xMMgWNdIBNqwdzc8o2w6nS52Xs2ukm35yY3VBloR1CUrF4
	qExbus3KE7OlMIkicwsd0lm/NCfl5XhzMSanilwG1kGz2SVEFG8=
X-Received: by 2002:a05:7300:e91e:b0:384:2780:8757 with SMTP id 5a478bee46e88-38570a3e793mr12269206eec.22.1795409061005;
        Sun, 22 Nov 2026 20:44:21 -0800 (PST)
Received: from localhost.localdomain ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm24322434eec.19.2026.11.22.20.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:44:20 -0800 (PST)
From: Guomin chen <chenguoming88s@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guoming Chen <chenguoming88s@gmail.com>
Subject: [PATCH v3] usb: cdns3: fix NULL dereference in cdns_host_resume()
Date: Mon, 23 Nov 2026 12:43:47 +0800
Message-ID: <20261123044347.3273-1-chenguoming88s@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guoming Chen <chenguoming88s@gmail.com>

cdns_host_resume() assumes that the xhci-hcd child device is bound and
passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
not guaranteed: __cdns_host_init() creates the child with
platform_device_add(), but the child is only probed once the xhci-plat
driver is registered.  cdns3/ is linked before host/ in
drivers/usb/Makefile and both drivers are device_initcall(), so on the
built-in path the child is registered before xhci-plat's initcall runs;
when xhci-plat is a module, the child stays unbound until that module is
loaded.  Platforms that set CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx
is the only in-tree user) let the controller autosuspend (20 ms), so
the parent may already be runtime-suspended by the time the child's
probe actually runs.

When the child is finally probed, the driver core resumes its parent
before calling really_probe(): __driver_probe_device() does
pm_runtime_get_sync(dev->parent).  That runs cdns_resume() ->
cdns_host_resume() while platform_get_drvdata() still returns NULL,
because the drvdata is only set later, by dev_set_drvdata() in
__usb_create_hcd() called from xhci_plat_probe().  hcd_to_xhci_priv(NULL)
then evaluates usb_hcd_is_primary_hcd(NULL), which dereferences
NULL + offsetof(struct usb_hcd, primary_hcd) (the offset depends on the
configuration).  The oops faults in the first instruction of that
helper:

  pc : usb_hcd_is_primary_hcd+0x0/0x1c
  lr : cdns_host_resume+0x24/0x44

Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
only skips the resume callback when the role changes during resume.  The
role does not change here: the parent is resumed by the driver core
while the child is being probed, so that fix does not apply.

Return early when the host child is not available: it has either not
been probed yet, or cdns->host_dev is NULL because starting the host
role failed after cdns_role_start() had already set cdns->role.  Nothing
is lost in either case: a child that is not bound yet has no state to
restore, and xhci_plat_priv.power_lost is only consumed when an already
initialized host resumes.  cdns_wakeup_irq() already checks
cdns->host_dev the same way.

Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")
Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
---
Changes in v3:
 - Add the changelog below the tear line, as requested after v2.
 - Note that commit 87e4b043b98a covers only the role-switch variant,
   and correct the description of when cdns->host_dev can be NULL in
   both the commit message and the code comment.  Clarify a few other
   statements in the commit message.  No functional changes.
Changes in v2:
 - Resend with the correct sender address; the patch is unchanged from
   v1.
---
 drivers/usb/cdns3/host.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index e01264dc625d..2f430e1e0089 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -140,9 +140,23 @@ static void cdns_host_exit(struct cdns *cdns)
 
 static int cdns_host_resume(struct cdns *cdns, bool power_lost)
 {
-	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
-	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
-
+	struct usb_hcd *hcd;
+	struct xhci_plat_priv *priv;
+
+	/*
+	 * The xhci-hcd child may not be bound yet: cdns3 creates it, but
+	 * xhci-plat probes it only later, and the drvdata is set in that
+	 * probe.  cdns->host_dev itself can be NULL, e.g. when the host
+	 * role failed to start.
+	 */
+	if (!cdns->host_dev)
+		return 0;
+
+	hcd = platform_get_drvdata(cdns->host_dev);
+	if (!hcd)
+		return 0;
+
+	priv = hcd_to_xhci_priv(hcd);
 	priv->power_lost = power_lost;
 
 	return 0;
-- 
2.34.1

