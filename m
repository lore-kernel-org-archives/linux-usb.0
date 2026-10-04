Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F41212542
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107429; cv=none; b=PppFZYZkM3YHRyubOFpUXjun/zZR6j68kKriwnexpYQbjoyZ2h5qAiYZ+6O6lrCr+Pm86yusaM61LD+B7Zi0vztIyb4iCFSU+NHYw5PBOLwu9GshpS3WYJ5NWgAFerWTLTX1EH6aKJxS1T7/E5aJKSUA4ltnhGt7Y9pjK8UFCoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107429; c=relaxed/simple;
	bh=X6tIb5YCbtuc7DplNEdDK67WtMGLip/KaulnPcda2xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKBLqhPteymBCkFkpleQ6SX4cOVhXgwE83ULQ2bH/vSb7t2+LT3M3EJXcGlbWOklBrYDLSUAA5EFyG72Pyw7a0HA6NUDtpMwJFm7bwEqRUVm7GVWCBvbeDk9c9UVKQetNXRWIHZWok+s1UVu/1PSLcm3HljbLZFvZfvz2afoUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=cSqmnF6b; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="cSqmnF6b"
From: Michael Wyraz <michael@wyraz.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1791107006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+f3BNIZw5xENBksRrQ7m9RmtBwTfZbdLm6wCSioLzw=;
	b=cSqmnF6btHRFwgTzbfjDQIAb1mrps2J7osPb5Vr6hh+C6ZteC2XQFaSFNcfNf75N12tbl2
	lHjS/vi6UiOxKm4dpbiMp01C5W4hv7NDPWNyKz12sOVbqa86UdNBFoupQJVHwt/7tNV9bS
	53GdVOrwub4ySxMxcTKmMnadouh/PsjFdvTmIuRNxlYxWId70vemP0oHyFSksec0N9nxQ+
	ivF3Ootg6Tqfm95Ng9OX3XAvEx3QGkk6hw4B8gJnS+WEORZCp/U0BKFxWzDrAVg55RNi59
	77EOiGwWyzzKSxCOk5krhq1BANz/qQK1bp0hbymNG66NAkCwD+yy+H7skOVSkA==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org,
	Michael Wyraz <michael@wyraz.de>
Subject: [PATCH v2] USB: serial: option: add support for ASR 1286:4e3c modem
Date: Sun,  4 Oct 2026 11:43:21 +0200
Message-ID: <20261004094321.2256936-1-michael@wyraz.de>
In-Reply-To: <aFJzdxe_ykNw6cP_@homebase1>
References: <aFJzdxe_ykNw6cP_@homebase1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -

The ASR modem used in the Tuoshi LT22M exposes an RNDIS function on
interfaces 0 and 1, a diagnostic port on interface 2, and AT ports on
interfaces 3 and 4. Match only the vendor-specific serial interfaces
so option does not bind to the RNDIS function.

Link: https://lore.kernel.org/all/d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de/
Signed-off-by: Michael Wyraz <michael@wyraz.de>
---
 drivers/usb/serial/option.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 828b1be..f95788f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2556,6 +2556,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, UNISOC_PRODUCT_UIS7720, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x1286, 0x4e3c, 0xff) },	/* ASR modem */
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
