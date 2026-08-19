Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62E430CCE;
	Wed, 19 Aug 2026 10:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133877; cv=none; b=O4fwKhlhzDXVELQneCcA5WnGJAIGj1+1Xv5d/hRglEEmLGxDE2tOsjowlkNM7O9PMdV6rrcdEJNDoACjTchJ9yC2SpWrYxRGztBlFefoxiejm4FR4Ae9lRcd9S2G3nOzqOVR/3aHrioKcliNMLR+361QTlXpBmmcsGRozUyq7Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133877; c=relaxed/simple;
	bh=dWklmVe8KwQVC6jGgnEmYIYGNW9SUVJUYasxyPkMRRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SAu027pyNf1kiW0zsBOdAdL1alo6L79OQsWaYuMVNSPSU4nscNBXuAhyNlOh00UxR+0YKZCAmjdycemVL5j2rLkyJTXz5ZpadM8pRRCiYeR+NJ+iNvFY3ESEGrQsCcl6qi3lepf8hbju5d++8tzq2FCI16DmKabX/0oMN9+71L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=W1lhcm/y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G2yhljNq; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="W1lhcm/y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G2yhljNq"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A7D3D7A0089;
	Wed, 19 Aug 2026 06:04:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 19 Aug 2026 06:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1787133873; x=1787220273; bh=8s
	n7DGUxmgE2IcT/ZrBdvjCucGkYOdn7Gfkp0kMfPMY=; b=W1lhcm/ypHDcjcGnv6
	p73JaofGfB0tDCNtHTE09NXf3FpFiJjfhXo/hjZknX1RPXTnNHd0o+HBxMvr2Hpb
	Dr+mf+7Pf5df2zrA7uvVjkBoH0LABUFtWL8SAxrSutFRww0w3KFxctC5bOWfPqXU
	3ptFkVP9F4FwIFWbZlQMeFMrIPt/GtyGSGBPiKUF1SYVgVNRgXH13k5b6+qfbku5
	t8TD+ZVPWELjdotKjYODb/DGFY5S6ihKMD1f11FrDAgKzbmytm9X/Z8+q9OGsazE
	4gxOvAvr+Onjgq/J5Ws06lRiojrPLiCzZeM1Xe/cO57oZyeTYex9lhaFaiWoEQZT
	GTQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787133873; x=1787220273; bh=8sn7DGUxmgE2IcT/ZrBdvjCucGkY
	Odn7Gfkp0kMfPMY=; b=G2yhljNqUriJQ7gc0BxU0OmEmHYR2qaqSSHuVrATgu+L
	hVYH9JOsVbgV/Z72NTtNPh4omunSRRVE848Jj2obTi/io4dVWvXldR5Npq9geQ5q
	xoJtxGlL46mqJZO7XdlDiE+brVLIQxxwWhgQYTiGnxO78dwgdPQs3Ms4ZLPAfpBN
	+/5g4hIQqoWs84KXXyLYGBqyhD78txbiS5fekQHt95l1JK5UZ2SY4N9lnTxhIbRR
	zp16SRgIifatNihr+K4QRmPXTZc9uBc1nZdxz62HoT0MBRgNsHrpxRCUWfNjdVKg
	esdiO/obAcJB4bZaar3wISAfidGcjDtPfvBUo3yM9Q==
X-ME-Sender: <xms:sX-FaofMBHwzo_wowNYcKnqxwx7G1qoOMRUPLL5mHxoPkbLji2VckQ>
    <xme:sX-FaoBtYJXeqeUFb_qJKX_sUZnGzJHd_jtoNVYhAQPmhX6Qe0T39FIQ2ryWMb04P
    38By0TGMZE3kQZMbnjoogsVeVJj4kdegkxrZY2n04Uq8UNA4vI>
X-ME-Received: <xmr:sX-Faj_VsNvW5hoEnZkKxKobRg4klubbhY3LpHFgIfszvqqG35WTxfzFk9u-IyU03yozKVMZuN6DrDIuERBl_5cWuK0Jd1c9KVd17xEIIjYoyKnOawI>
X-ME-Proxy-Cause: dmFkZTGqShzFunr7Y+qIeUxGgcgkO8ao7UwquAqCgxQ09b82TrvEXrx2JbJCBGsIq79Drk
    6Z+I0Pyx7JIRbfR2uGjR0I8pBAKwrQ9oIkOqHmPAznD9/0kl7wrw5DBQ77dQe6crRFjDXI
    /DWm1DyweiQmLvLXgNnAvJR22w/QIivwZGukbBiMkwnaYc6NXUuCOTJN1VaE7A0X80btoF
    9d2yMMul4Kt84E/V+EY/0VNMEoQ2Bs6Yxl574b7u9x1PRNln3D666HzsUh/qGvuEN9nbM/
    inDJpHle52T25gTTPC7Io0hkDL4HuR/9uZS81sgF6NxEUIJqRo2BKSfOh7DUHuzayitRFR
    cCJvBU7anxmEDp0vD/G6zTXQorRVVmbG9HMLNkkGDN+Xv7lsnc0jKlXYkFHhr3mhgFWVzd
    ftOa+/+XJqz8v6indgy/liBiqSkAXWAm1G6geg/Ci9BdQtBGxfFJ6LsA1yFWvoWEgouAJC
    2uPfybW5xvKQYPLlPIsRDZ1qPJuBpj3VOi2MaL/hqWrUaFlM906yW2yO4fY1EPomik+1b0
    OnP7Us4lRR2HlwaNUalFxbN7InrHlngNXIxn3+3hhQeyzfr1OakEy2KiEV38WlGQZWK2JX
    MMqCxUu5tdVjGOEZdNJNwI6R4V4qsw5doM1KX/4m1ELMoekcP/WxFumVAx8w
X-ME-Proxy: <xmx:sX-FarKzi_COHhOfms19_fuuzEc7wP60OKGNG5kRtEo2R4T7ZPzvRw>
    <xmx:sX-FakiC8HpiH8Pl-oxeZGxIOdalyVuVT_X2OMChZSrir6OrLwTyLQ>
    <xmx:sX-Faj4PAROS_mzHoIUzrN3Th0VJbbN7I_uiYwANLs8RwAKDHyujgA>
    <xmx:sX-FakbEX3-jEl-v-m2ilGewZ26thTXNdOtCE45j3ArqBYisvWxtEw>
    <xmx:sX-FajZYOoFpcV-q5lnmGuOsnAwBNuoYDG1T9Y-QOBw0nRnJOT8bBt4B>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 06:04:32 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Wed, 19 Aug 2026 12:04:25 +0200
Subject: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRxv9VRERrMBIlHUQi7q5Yf
 ov3LmB0hAxlcIHDg5gW6yHDAMzY2gEFdd6gIpVGuczEzrqZiU3jWtsts4hlFkvdY6ETBb5aHfZ
 0fseq/s27ntBs7wbu+wF6tOmrcwAAAA==
X-Change-ID: 20260817-usb_misc_random-41741bfe9b52
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787133872; l=1343;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=dWklmVe8KwQVC6jGgnEmYIYGNW9SUVJUYasxyPkMRRo=;
 b=OYFcuDnZUJwIl7qkf6wzq35ugAPARCySu33T8pl1AcSbzRUEu1RXNY4WCUslGm8tKJ3j6oz8u
 sjRsBym0z6YCfV+pjdu3kjmcy7ZCT3DkrllOx5BGpJv/rNGhFLxX++M
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Change the kmalloc() calls in usb_mdc800_init() for irq_urb_buffer and
download_urb_buffer to kzalloc(), avoiding potential stack leaks if a
shorter message is received in mdc800_usb_irq() and
mdc800_usb_download_notify()

Assisted-by: gkh_clanker_t1000
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
 drivers/usb/image/mdc800.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index ca287b770e8c..f7caa1c5cbb7 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -1000,13 +1000,13 @@ static int __init usb_mdc800_init (void)
 	mdc800->downloaded = 0;
 	mdc800->written = 0;
 
-	mdc800->irq_urb_buffer=kmalloc (8, GFP_KERNEL);
+	mdc800->irq_urb_buffer=kzalloc (8, GFP_KERNEL);
 	if (!mdc800->irq_urb_buffer)
 		goto cleanup_on_fail;
 	mdc800->write_urb_buffer=kmalloc (8, GFP_KERNEL);
 	if (!mdc800->write_urb_buffer)
 		goto cleanup_on_fail;
-	mdc800->download_urb_buffer=kmalloc (64, GFP_KERNEL);
+	mdc800->download_urb_buffer=kzalloc (64, GFP_KERNEL);
 	if (!mdc800->download_urb_buffer)
 		goto cleanup_on_fail;
 

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-usb_misc_random-41741bfe9b52

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

