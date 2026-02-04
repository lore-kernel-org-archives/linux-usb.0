Received: from a4i635.smtp2go.com (a4i635.smtp2go.com [158.120.82.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F8158535
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 03:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770176700; cv=none; b=tzsp5zt0rSL6nvjK7tVP95SLSbUFu9p4EB0IiribEaHckRoZNMXAlMg7xMoB5fy1ObsngeVi7NhUdT1e7zUmMhzr7DloiRHyczLVOwiEN/xYznRyeb84VOpRJCfZ47D/G6vVT0ej7XurCP45Q0e5SL8/W7ZzLDWTKD1JNGyho4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770176700; c=relaxed/simple;
	bh=qCxNbV4yZVn2dX6kAU93c08AZ2lXfknYpCjWEbIrzNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OiHAZFo78GLaHfm6KiH5VT3koqQ5bxeKsTPJyDRR7/PCwRjE4yUynsfoROayYoW+PW2D6Ke5VtSHtam7IbbVBpYT3LGcfA2R6x+xAvC/lOudLfdraPyahSwCuXKz+2rDlb8rnFb9guXiVTSGlBVFi7pA5ZRw36yGte2FvltrjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com; spf=pass smtp.mailfrom=em938170.a1rm4x.com; dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b=TEAck+hH; arc=none smtp.client-ip=158.120.82.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em938170.a1rm4x.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b="TEAck+hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1rm4x.com;
 i=@a1rm4x.com; q=dns/txt; s=s938170; t=1770175791; h=from : subject :
 to : message-id : date;
 bh=2GrKHkv/Zgf2VQ+fqdcFvgQEBZvm4VAIDZViPyKU5eY=;
 b=TEAck+hHoJGJQvjvVPFfuBQWexajv7iFd4TGj6EN9asspWsyT3gLDizJUWhVwe5Ljgue3
 0zcbt8fJJTk4xEpSfPSocaiWCoin9G6thtQ7l2Q/BHBOsGbQ4Dz+7FbDO9u2bk0jS0H7HBJ
 3Q4V0n3sVaUPWg0UuzIcwWT6Le4gclG2ZjrvzWz0C7oSs87QdPepq6SM3BQSa02qpgkSTQJ
 5FsTT/PU7vOLyiJ5CblRS2+4+BfAeD2W/aqBPWHCTGXSvEttkcno0UIvGGT0kA7drQ20GE0
 iG2Wozez3uodfOBqjklhxZN4bU0gaYg3DmkxtHki3RRvKcf/5b4tdgZo5adA==
Received: from [10.172.245.14] (helo=CachyOSBTW)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.1-S2G)
	(envelope-from <A1RM4X@A1RM4X.com>)
	id 1vnTaO-4o5NDgrhkvk-dU5O;
	Wed, 04 Feb 2026 03:29:48 +0000
From: A1RM4X <dev@a1rm4x.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	limiao@kylinos.cn,
	oneukum@suse.com,
	huanglei@kylinos.cn,
	lijiayi@kylinos.cn,
	dev@a1rm4x.com,
	johannes.bruederl@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: add QUIRK_NO_BOS for several devices
Date: Tue,  3 Feb 2026 22:29:38 -0500
Message-ID: <20260204032938.61553-1-dev@a1rm4x.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 938170m:938170ab7bWmC:938170sZy9LOp2eM
X-smtpcorp-track: zfF0Yzv_n8rn.m5MuCUkz044R.4SRZPA7hAlA

Add QUIRK_NO_BOS entries for:
 * ASUS TUF 4K PRO (0x0b05:0x1ab9)
 * Avermedia Live Gamer Ultra 2.1 (0x07ca:0x2553)
 * UGREEN 35871 (0x2b89:0x5871)

Signed-off-by: A1RM4X <dev@a1rm4x.com>
---
 drivers/usb/core/quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index c4d85089d19b..ddce45ce9f6c 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -453,6 +453,15 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
 
+	/* ASUS TUF 4K PRO - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x0b05, 0x1ab9), .driver_info = USB_QUIRK_NO_BOS },
+
+	/* Avermedia Live Gamer Ultra 2.1 (GC553G2) - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x07ca, 0x2553), .driver_info = USB_QUIRK_NO_BOS },
+
+	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
+
 	/* Sony Xperia XZ1 Compact (lilac) smartphone in fastboot mode */
 	{ USB_DEVICE(0x0fce, 0x0dde), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.53.0

