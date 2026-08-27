Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E495377EAF
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845124; cv=none; b=Ucu8ZXhvYaOahoNX/Ft0ePTS9xqbwFFyewDjkQzmfeAmRbvd1RigzSqL3YW0IbsUUh4inFjxdsbd/ybOHIXOOQbZRGVsRR0UAQJGKJdS//aOqc+eKzrfC3vgjr6Tw7MRznM8PM3SlUsyiNf1BPd0KIY6vIt2vYD8wzAmfGuw3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845124; c=relaxed/simple;
	bh=O/L393Y8wt0Jh0lNgZkAqeKjjksUueUuRLg9cgvdUP0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=G6oE69JjfIdcI2Yi75cW9Ho0hvn4zrL8GKak0rFapcyGyCxJ/VspCFMnCb5tEur0EBr970gkWsrmFKhUUyD+De6EwdJz5+A5QcgDLo1Tkdf8ePET8gPEYcVbFzrxoNpGeqkIpFB/Pj8huuuVRsmy1Ih3V64CCIi1E/3I1h3XJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=DyPi8nu3; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=dQ40SozU; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="DyPi8nu3";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="dQ40SozU"
Message-ID: <c9fb1eaa-9c88-4942-b6c5-9f7efbe1a133@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1787845116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O/L393Y8wt0Jh0lNgZkAqeKjjksUueUuRLg9cgvdUP0=;
	b=DyPi8nu3Uxq9N2Aduw77p3nACxmZRkyWQlfJWx+t/yCLjLU7Urh5pcUQAPK08xEQ8JA0z/
	DtWZbVG8xGW8VOfLoWCCn48VBL2mJSBuckg1q7yWkBiyD6wRu/IJfWX2kUqthmH6aNtarF
	J+67d37f5lVeUHV73qT4W+2ZZVaw53PNqK9pGOuwfu4erd0QsOIyvvrubDlmb7cEDAYtEP
	T3qiK6iK8BKKaidN5RSdpez8kQHW/POqbNKcu1paevoJ8pIXA3gBmTReduJw5K00AvODeg
	oo4rDJI3QZ604jIgPsMSlRP2kw2hod8zcCpzFstLLyHn/GV+GURLN9ZApi/hI+t51BwHnc
	R7bOCSjMJ/JKuYugs5pgXBrine76g2PA58bFvNBt+NTboGLIHGVSGwRC30NkFUP25OTgMx
	CUoUi0K44QmyHKCV9TajyYOd3lOQCJzth1GlvxerlBI8KL2Yd2ARooSKb5ZLKkBZjOFSlu
	IgjiHAANJrSLLWE9EqadoSa3vavz1SgdFIbxFIodOiESWY0zysfNT4ch/5Hfc/fFt1Dvvi
	C+YOv7HocNTqt665VQdLU/Y255eAi9IZaNk6MXUNTWd/OTKgy40fiiFFSLTkdzuDIK3EUJ
	Sg5sOAn+m87HDz/hlOAu9qLWvxvGvEaxa+xZdnY02wR0TdQ4qfVEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1787845116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O/L393Y8wt0Jh0lNgZkAqeKjjksUueUuRLg9cgvdUP0=;
	b=dQ40SozUBeCU21BSA5ytwi8e49c/63KsB8qZ0yXs1q/LqgbCDrY5rhhs0s6mJOVT9/u9Og
	zMSTmm9kAoAI6hDQ==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@archlinux.org
Date: Thu, 27 Aug 2026 17:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Rys <martin@archlinux.org>
Subject: [PATCH] USB: Improve "New device found" printout message
To: linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

it's my first time posting on any Linux mailing list, hopefully am doing
everything right.

While checking out dmesg I saw that there's an extra space after
"bcdDevice=":
  usb 1-5.2: New USB device found, idVendor=0583, idProduct=a000,
bcdDevice= 1.00
  usb 1-5.2: New USB device strings: Mfr=0, Product=2, SerialNumber=0

Turns out that was introduced in
https://github.com/torvalds/linux/commit/73c6d3b284cf7b31c03fdaa2476f48f8da0932f8
(USB: announce bcdDevice as well as idVendor, idProduct.), as it was
trying to keep the same formatting as `lsusb -v`:

  idProduct          0x0276 GXT 165 Gaming Mouse
  bcdDevice            1.00
  iManufacturer           1 SINOWEALTH

 but lsusb presumably uses %2x to have a fixed-width text, so the number
of spacing it needs to do so it all lines up under a monospace font is
predictable.

In dmesg, it just causes it to look odd if there's no character in the
first hex slot, as "12.00" looks fine, but " 1.00" does not.

While staring at this I've also noticed that there's a comma instead of
a colon after the first message, so I've fixed that up too.

Martin



From a0bc389b6bf4641fbd894f8acd4c1c5709728862 Mon Sep 17 00:00:00 2001
From: Martin Rys <martin@archlinux.org>
Date: Thu, 27 Aug 2026 17:05:45 +0200
Subject: [PATCH] USB: Improve "New device found" printout message

Use colon instead of comma like the later message does.

Do not print a useless space after `bcdDevice=` - this was introduced as
the formatting was copied from `lsusb -v` printout, but that one has
preceding spaces, this one does not.

Signed-off-by: Martin Rys <martin@archlinux.org>
---
 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..c382215a1177 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2411,7 +2411,7 @@ static void announce_device_ids(struct usb_device
*udev)
        u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);
 
        dev_info(&udev->dev,
-               "New USB device found, idVendor=%04x, idProduct=%04x,
bcdDevice=%2x.%02x\n",
+               "New USB device found: idVendor=%04x, idProduct=%04x,
bcdDevice=%x.%02x\n",
                le16_to_cpu(udev->descriptor.idVendor),
                le16_to_cpu(udev->descriptor.idProduct),
                bcdDevice >> 8, bcdDevice & 0xff);
-- 
2.55.0


