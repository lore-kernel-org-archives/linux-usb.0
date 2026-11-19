Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088701;
	b=00u+rTyPKLMpGmClbbEZINW8AAvaQFHeUvOPbgiEUQCcMV22QKZorjq2VGeuIMrf8EJ8
	 wFhcULxYTAw7vbZcyhElvOfN+/NWIx5wkMh237NceaRzPUUTuYgyhRgTNRCmjFqGXsJaD
	 nYmay2imfIROd4emSvGzPRfwZfIxYabKdRt4mADHWPYaPnnlYvOtpCenLUd/z+KBipGk9
	 u7RORP+Vsqni9BlrUkpJMsF1MMPLRZ/7xSLBP91QF88EodlWcrplOi3U8oOjVZ4l9T36s
	 r0AOdSn0TZDeb/77LDOi5wMifJL2cgZkPqdEdbVVXkPAE+KJrIRoZwL3SScOMRbKOgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088701;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=arY3zljhg/9f4oH1J4G/6/OX1UJcdmzYzzT5OdZ4uls=;
	b=NdimQB29Lp0U8eEDhERaKiDwEdDvweV4mymfv569HfZjvu4Z4yvqcj1Qc/m5yXKxCt5L
	 3hLWUwSyrgoS88MnwNrAvJ4W80y4P2XXxg3RjzgSUfchPWBTYlXqTbDezQUIlCACtL/NA
	 o1OR23NlbPNjvzS+K0pSNTJI7ugRoDzRLl+XO6zvDbEeRyvDXKZnX+1iWXz5m1A/LJAIx
	 yi2xsaBdQzO8J/f1HGTjxcDdNRPCsnRwu+lAWOtg3VevGOGPBcBmHuGjObGo9uX7kLLPG
	 UFCo4MeeZjVJwTFGz2+EeEE8lw5Nq5i83yv7rckfOJJ6E568qwe3rk6fcOJehNR1x8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kgv2AhfS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD4606A324;
	Thu, 19 Nov 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kgv2AhfS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795088701;
	b=P2v5noAEbGWE7nN5F50B28/qoYrG8lJkDlFfTF0nqD1Vv0CYLTmcerVwzQeBJn8jsk8+
	 nwb0RT1WDcUsLh5hg/YfEUekgziqOChgu1ihAQQIANpLwaS9XCyvUEXJaD+sFF81OJ0Di
	 3QYyIL5zMBf7aDixaIm+cD8M2stf6dBunYdLWxtaSo0CTUVGSAZF23GUw1ITBzxYgkoXa
	 3C+j95dqDWSzIvM8LTyWywyKQiMDyYq+th9IVKOrnqia2TEtmmPUPBwIO8vOylPX8WrZl
	 KXqQvSoC80kZRWQsVatJS2CD2D/+YYPffq5D8nKzMevJUSpTtBEO/OEAqM7sP4GFnKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795088701;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=arY3zljhg/9f4oH1J4G/6/OX1UJcdmzYzzT5OdZ4uls=;
	b=3UGdK0KngRai254cz2ISPZlgdKesNzDNGcybcWv3PkPZazg78CV+2lIz/znTZ1rj0DHm
	 fe6wyrb3gHfE/sApUnbqdSjjjWn8DW3NVv7bLYPQjcxf06GlzFd7SsuL0QEbaDvBBqRu9
	 biAlK8d7QPEbI7msE2s9zM+kBB3MkWu0QVOaH9CleTgyg3jrq6zCfuZA3S9jymK3w/j8T
	 TgMgcFVCnV+Q46iKRCcx4OCI8vitOnn+SeakVBwuXONfEoKup7288GuUajdLCSv5pO7R2
	 kSgHpehXX7Xd8g8zgYIMfiHSuD4gGtky21mqBucesCeFXSQhZv6jq0uxpvjUO8v6Mkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A11AF1F000C5;
	Thu, 19 Nov 2026 11:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088701;
	bh=arY3zljhg/9f4oH1J4G/6/OX1UJcdmzYzzT5OdZ4uls=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Kgv2AhfSwmOU7Yy+nVUpf+lY/OX+L/VA3+GLHlizta0KBnV3Y+xToBFKIylVvXvB8
	 h7IMK04UlRGp43qldUR4oz9hkRzChgwTPXtHOs6AEmecK/cbqc+4gbT51SnAWPikBl
	 3RG1yJuFaWSlTRe18JpCGQ84AkQw+rkkhMY/c8xoXF9kDxIFZKnFF01j0ateGoqyd1
	 Eycn+ivn42dmC55TkpwI5xISahyAU4O7OoX173uOc82YDlTX0dHU4EEwR4s/yfPdZk
	 u7pYOobd1k8kE8+UpFUpGUhNqg2vaMYKMoqp4TVNVwsKqp7fQ0TWZE18eEKFGQB43U
	 WEGgMIvW81a7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0467F4B266;
	Thu, 19 Nov 2026 11:45:00 +0000 (UTC)
From: Yasunobu Sakashita via B4 Relay <devnull+hi.yasunobu.dev@kernel.org>
Date: Thu, 19 Nov 2026 20:44:56 +0900
Subject: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
X-B4-Tracking: v=1; b=H4sIADfh/moC/yWMQQrCMBBFr1Jm7YCJEqhXEReTdGqidpRMWgqld
 zfR5fv89zZQzokVLt0GmZek6S0VzKGDEEnujGmoDPZonTGmRy2ZaQo0oacSIg84yyvJE0d/Jse
 n3lnHUPVP5jGtv/T19med/YNDab328KSMPpOE2CbhtcC+fwGU/I6fkwAAAA==
X-Change-ID: 20261119-streamcam-batched-unlink-fb4a6e39626e
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
 Yasunobu Sakashita <hi@yasunobu.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088699; l=3387;
 i=hi@yasunobu.dev; s=linux-kernel; h=from:subject:message-id;
 bh=SM/F5q1dd2vyprkfGis4uWr1Bm42nEAIAtBJ4e6DG4M=;
 b=I9BApyP7CrZMcyE67xRmVhF+o4Qfb7NeHa7K21IK2F7ww7GGWsFrDUNCjCZrDlQVuTj6I55uk
 JhUduYDGWayBlHnEU3m24BcDXHfiMspq6gZ7Z1swHNKtiW+VXJqEBFR
X-Developer-Key: i=hi@yasunobu.dev; a=ed25519;
 pk=QjththR6KbbJLxSuYvQ/eDo4hRrutwL7BdLamwrIW9c=
X-Endpoint-Received: by B4 Relay for hi@yasunobu.dev/linux-kernel with
 auth_id=1570
X-Original-From: Yasunobu Sakashita <hi@yasunobu.dev>
Reply-To: hi@yasunobu.dev
Content-Transfer-Encoding: 7bit

From: Yasunobu Sakashita <hi@yasunobu.dev>

Stopping a SuperSpeed StreamCam can halt xHCI on the ASUS PRIME Z270-A.
The fifth Stop Endpoint command timed out after an invalid type 15 event.

For the affected StreamCam and ASM2142, block URB resubmission.
Queue all unlinks before waiting so xHCI can coalesce them.

The stock driver reproduced the halt on Ubuntu 6.8.0-149-generic.
Three FFmpeg 720p MJPEG and audio capture cycles passed with the patch.

I used Codex to help analyze traces and draft the patch and changelog.

Signed-off-by: Yasunobu Sakashita <hi@yasunobu.dev>
---
Built uvc_video.o on media-committers/next with and without CONFIG_PCI.
---
 drivers/media/usb/uvc/uvc_video.c | 43 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab..0ee5a7d17 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -1885,6 +1886,26 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	return 0;
 }
 
+static bool uvc_streamcam_batch_unlink(const struct uvc_streaming *stream)
+{
+	const struct usb_device *udev = stream->dev->udev;
+	struct device *controller = udev->bus->controller;
+	const struct pci_dev *pdev;
+
+	if (stream->frozen || udev->state != USB_STATE_CONFIGURED ||
+	    udev->speed != USB_SPEED_SUPER ||
+	    le16_to_cpu(udev->descriptor.idVendor) != 0x046d ||
+	    le16_to_cpu(udev->descriptor.idProduct) != 0x0893 ||
+	    !controller || !dev_is_pci(controller))
+		return false;
+
+	pdev = to_pci_dev(controller);
+	return pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
+	       pdev->device == 0x2142 &&
+	       pdev->subsystem_vendor == PCI_VENDOR_ID_ASUSTEK &&
+	       pdev->subsystem_device == 0x8732 && pdev->revision == 0;
+}
+
 /*
  * Uninitialize isochronous/bulk URBs and free transfer buffers.
  */
@@ -1896,12 +1917,24 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 	uvc_video_stats_stop(stream);
 
 	/*
-	 * We must poison the URBs rather than kill them to ensure that even
-	 * after the completion handler returns, any asynchronous workqueues
-	 * will be prevented from resubmitting the URBs.
+	 * URBs must stay blocked until the workqueue has been flushed.
+	 * A completion handler can leave work that tries to resubmit an URB.
 	 */
-	for_each_uvc_urb(uvc_urb, stream)
-		usb_poison_urb(uvc_urb->urb);
+	if (uvc_streamcam_batch_unlink(stream)) {
+		/*
+		 * usb_block_urb() keeps URBs blocked after usb_kill_urb().
+		 * Queue unlinks together so xHCI can coalesce them.
+		 */
+		for_each_uvc_urb(uvc_urb, stream)
+			usb_block_urb(uvc_urb->urb);
+		for_each_uvc_urb(uvc_urb, stream)
+			usb_unlink_urb(uvc_urb->urb);
+		for_each_uvc_urb(uvc_urb, stream)
+			usb_kill_urb(uvc_urb->urb);
+	} else {
+		for_each_uvc_urb(uvc_urb, stream)
+			usb_poison_urb(uvc_urb->urb);
+	}
 
 	flush_workqueue(stream->async_wq);
 

---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261119-streamcam-batched-unlink-fb4a6e39626e

Best regards,
--  
Yasunobu Sakashita <hi@yasunobu.dev>


