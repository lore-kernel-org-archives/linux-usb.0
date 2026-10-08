Received: from cvsmtppost17.nm.naver.com (cvsmtppost17.nm.naver.com [114.111.35.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554B4A385C
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466888; cv=none; b=PXMddMmF4FecfYdDk7RGYLs+ElUxDiMMPPb9BsiPnPn+YyvuYi7wTNz18ba7tjHudonsfWQ5l3tUuytxfQwYgE32G8ktJ2nfEsF0NyjtiLoTrBQHY29+30a1jm+C3d+RFwrPZf66LrXXvKj8ejj8YlneMna9S75eG5ef8zsLvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466888; c=relaxed/simple;
	bh=Vr73Pu22UawOSM8femvoEs3NUe6ahG8ew2AJH1d6klU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/AcUPy27OytHO9aJ2c8R+1DjFPoJW95/II/wwkk760isNo/velQY7ieTac4/v34VFrsDKGBuqQfIjErFgOUUcwdhbpbl6dyDF8OpsVCPZKHGKBBKMcEiPiMcIc0ECa6EYbeQkmr6t1h+7DwzDWRR70rIsOry3IM13gVWZbIOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=iaRlqfOd; arc=none smtp.client-ip=114.111.35.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="iaRlqfOd"
Received: from cvsendbo005.nm ([10.112.18.54])
  by cvsmtppost17.nm.naver.com with ESMTP id cmrADW-9Sru3XfCYM1UELg
  for <linux-usb@vger.kernel.org>;
  Thu, 08 Oct 2026 13:41:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791466877; bh=Vr73Pu22UawOSM8femvoEs3NUe6ahG8ew2AJH1d6klU=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=iaRlqfOdYS5KYmL1xQpdKad9mMysM0F8OAZ+IjvEtKG4ZWNUsSVyR3H9lKaUdH9CL
	 YWKrJBZHnLlyTIECqj7tvUjrzHItir8OxbYqnvc12wezgXIRev/zeMPbLQcQLG2qnx
	 yimeFmzI9ZUg0+4aPbzPTzk4HnZSiXn/2oWFK4Lg2rpJqHJp8mY1zjbYuntdLik3ev
	 eojxHrMiTN4fIMn/N5DyhXO6V3kNvKuCsRcD3VLMZkD8lMV1qbFdax3HEDXOmc87ao
	 4J/71sGff+Tf9rvGm8Ujtg6YbLpW5HZr3c9KIk+jfjK8tCR6c5uI6wWYDJ0YGd7PF0
	 9PRQlo6qkY5oQ==
X-Session-ID: mEecwGBtR0CjW04n4hAnhw
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKBmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: ldnqFAulFqJZ+HmXFqtd+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by mvnsmtp06.nm.naver.com with ESMTP id mEecwGBtR0CjW04n4hAnhw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 08 Oct 2026 13:41:17 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: linux-usb@vger.kernel.org,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH] usbip: avoid dereferencing a missing device in receive errors
Date: Thu,  8 Oct 2026 22:41:06 +0900
Message-ID: <20261008134107.265827-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VUDC builds synthetic URBs which do not have a struct usb_device.  A peer
which closes or truncates an OUT transfer after the submit header makes the
shared USB/IP receive error path log through urb->dev.  The resulting NULL
device dereference crashes the kernel before the protocol error can be
handled.

Guard every shared receive and ISO diagnostic which can consume a VUDC URB.
The protocol error and teardown still run, while ordinary URBs retain their
device-scoped diagnostics.

On ff47652a4b66, a real VUDC interrupt-OUT endpoint reproduced the KASAN
NULL dereference in three fresh boots.  Normal and near-negative transfers
passed three times each.  With this change, the identical short transfer
returned a bounded error, reconnected, and completed a following valid
transfer in three fresh boots; normal controls also passed.  The touched
source is byte-identical and the object builds successfully at
47324d3a5b3a.  This demonstrates availability loss only, not RCE or LPE.

This issue was found through manual source inspection assisted by an
AI/LLM, then evaluated with local production-path dynamic validation.

Fixes: 79c02cb1fd5c ("usbip: vudc: Add vudc_rx")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/usb/usbip/usbip_common.c | 52 ++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 100f8920624bb..8d379a9437efa 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -683,8 +683,9 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 		return 0;
 
 	if (np <= 0 || np > USBIP_MAX_ISO_PACKETS) {
-		dev_err(&urb->dev->dev,
-			"recv iso: invalid number_of_packets %d\n", np);
+		if (urb->dev)
+			dev_err(&urb->dev->dev,
+				"recv iso: invalid number_of_packets %d\n", np);
 		/*
 		 * usbip_pack_ret_submit() already set urb->number_of_packets
 		 * from the wire.  Zero it so processcompl() does not iterate
@@ -702,8 +703,9 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 
 	ret = usbip_recv(ud->tcp_socket, buff, size);
 	if (ret != size) {
-		dev_err(&urb->dev->dev, "recv iso_frame_descriptor, %d\n",
-			ret);
+		if (urb->dev)
+			dev_err(&urb->dev->dev,
+				"recv iso_frame_descriptor, %d\n", ret);
 		kfree(buff);
 
 		if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
@@ -720,10 +722,11 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 		usbip_pack_iso(&iso[i], &urb->iso_frame_desc[i], 0);
 		if (urb->iso_frame_desc[i].actual_length >
 				(unsigned int)urb->transfer_buffer_length) {
-			dev_err(&urb->dev->dev,
-				"recv iso: frame actual_length %u exceeds buffer %d\n",
-				urb->iso_frame_desc[i].actual_length,
-				urb->transfer_buffer_length);
+			if (urb->dev)
+				dev_err(&urb->dev->dev,
+					"recv iso: frame actual_length %u exceeds buffer %d\n",
+					urb->iso_frame_desc[i].actual_length,
+					urb->transfer_buffer_length);
 			kfree(buff);
 			return -EPROTO;
 		}
@@ -733,9 +736,10 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	kfree(buff);
 
 	if (total_length != (u32)urb->actual_length) {
-		dev_err(&urb->dev->dev,
-			"total length of iso packets %u not equal to actual length of buffer %d\n",
-			total_length, urb->actual_length);
+		if (urb->dev)
+			dev_err(&urb->dev->dev,
+				"total length of iso packets %u not equal to actual length of buffer %d\n",
+				total_length, urb->actual_length);
 
 		if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
 			usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
@@ -793,11 +797,12 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
 		    urb->iso_frame_desc[i].actual_length >
 				(unsigned int)urb->transfer_buffer_length -
 				(unsigned int)actualoffset) {
-			dev_err(&urb->dev->dev,
-				"pad_iso: bad src off=%d len=%u bufsz=%d\n",
-				actualoffset,
-				urb->iso_frame_desc[i].actual_length,
-				urb->transfer_buffer_length);
+			if (urb->dev)
+				dev_err(&urb->dev->dev,
+					"pad_iso: bad src off=%d len=%u bufsz=%d\n",
+					actualoffset,
+					urb->iso_frame_desc[i].actual_length,
+					urb->transfer_buffer_length);
 			return;
 		}
 
@@ -810,11 +815,12 @@ void usbip_pad_iso(struct usbip_device *ud, struct urb *urb)
 		    urb->iso_frame_desc[i].actual_length >
 				(unsigned int)urb->transfer_buffer_length -
 				urb->iso_frame_desc[i].offset) {
-			dev_err(&urb->dev->dev,
-				"pad_iso: bad dst off=%u len=%u bufsz=%d\n",
-				urb->iso_frame_desc[i].offset,
-				urb->iso_frame_desc[i].actual_length,
-				urb->transfer_buffer_length);
+			if (urb->dev)
+				dev_err(&urb->dev->dev,
+					"pad_iso: bad dst off=%u len=%u bufsz=%d\n",
+					urb->iso_frame_desc[i].offset,
+					urb->iso_frame_desc[i].actual_length,
+					urb->transfer_buffer_length);
 			return;
 		}
 
@@ -891,7 +897,9 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
 	return ret;
 
 error:
-	dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);
+	/* VUDC creates synthetic URBs without a struct usb_device. */
+	if (urb->dev)
+		dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);
 	if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
 		usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
 	else

base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
-- 
2.43.0

