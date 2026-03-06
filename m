Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB23523D7E3;
	Fri,  6 Mar 2026 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818113; cv=none; b=AtIwGuAxU6zLh/+aXDzqB+e2Tx08DHj20SXTZss8r1L8VoBaDvFHi3yqUnQ57BjvxWbYVDidgBRk7mrOEYj6BR8rNzz5M7OLpve8jJZ5aB4N0CDStr3XdgXtNS5jWenfeQbxOBq96YpwYW4dyj6UKmR75FN1FdU/F8u8xVZxyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818113; c=relaxed/simple;
	bh=N/P24nZoCmMlbcQBipztX3lwKawdjzRLDU5X7YBh/vw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZHEsCKFifVLAgz3IlAWnEK2Ev11P9PZU41iHy8Vr2TOzP6o2Hxiz2P4dyMkvtyPfj6BUjI05yoD84NsQD+4UEevA6O0xLcOx4VzKFTOgzJSQwhR5ZHUDZUNAoGnFZM22kX65WOLReGrm5Yjaeo3dTTsRYymqzSBGnbXo1GgyVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YhojszNY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YhojszNY"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 773282FC0059;
	Fri,  6 Mar 2026 18:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772818102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R+FTGnV8AStwtejc6y2exKJO35qFNDWZKnq2oF8dPRA=;
	b=YhojszNYJfSIYZoue35kStfu09UJb6Bdq7TlZCidu1l0ueRtOuDWjDzomR/cCu89mRPPOC
	b+HUzEcrGccMCsv3A0iepB3P14Kx9TqeIx8p2EDyxoskeZ9coUZZMPAVP5zxA7KfUWusfL
	oeYSVjQwoHfsT4JobHr7k4UhWF036uM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoffer Sandberg <cs@tuxedo.de>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb/core/quirks: Add Huawei ME906S-device to wakeup quirk
Date: Fri,  6 Mar 2026 18:28:14 +0100
Message-ID: <20260306172817.2098898-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christoffer Sandberg <cs@tuxedo.de>

Similar to other Huawei LTE modules using this quirk, this version with
another vid/pid suffers from spurious wakeups.

Setting the quirk fixes the issue for this device as well.

Cc: stable@vger.kernel.org
Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index c4d85089d19b1..f8bd12b4482a7 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -208,6 +208,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* HP v222w 16GB Mini USB Drive */
 	{ USB_DEVICE(0x03f0, 0x3f40), .driver_info = USB_QUIRK_DELAY_INIT },
 
+	/* Huawei 4G LTE module ME906S  */
+	{ USB_DEVICE(0x03f0, 0xa31d), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND },
+
 	/* Creative SB Audigy 2 NX */
 	{ USB_DEVICE(0x041e, 0x3020), .driver_info = USB_QUIRK_RESET_RESUME },
 
-- 
2.43.0

