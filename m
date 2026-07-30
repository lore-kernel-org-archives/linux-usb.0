Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F883BB13A
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394957; cv=none; b=S3L82Uo8BCrmjF+njzIvpPTyJv9eHMwJDCXwyCiqg7xYIzNxCDN2+b57GIZTCSoctDvfg+LHs1/bZUZ8qAArlXGMtMOGSuHWEDzYmxI7jBPu6QQGCoERS2726ip+S2YIxjkDZn7ZLnfkMLsskBZAW50xCcvemUwEkF83CRG2E20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394957; c=relaxed/simple;
	bh=wJU3jDsZvwe6A/nHebd71vYMuOQRCT1kM2KdZRJa4hY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+oK12tGaNpdUgJ/VWp9MYv3pITJDPu5KJEdbcKMsEwCPqB5nKcB3euUeTlZyyiRZbqNMX6+IjswBJasZOYzFyVv12urhOserTmBVGfUridGrCxcDlw+V83B56ljKahofqWsNgXeCdZY5pX5uKjgIYCq0R527FC6gunzkANXEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrZPQHTr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrZPQHTr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1815343a91.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785394950; x=1785999750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+MtJnOvs8AYg7ENm20sNfdBwSbBhTZCGHZJyclXCfA=;
        b=GrZPQHTrRkdsH8IfNBqfrr9HqPq/1MHM+nBjQdGCYPfaLf2nf5rcV2LJ+UiWb3armt
         EWRn51TMpyIZCa2/v880R2CdQDa6si4La9UG6SuLrlvJ3tpG9B9Ih5k8clf8jAyCyaS3
         K+xt0f5mXeK0ls6C3JFo9bPN1s+oQA2LcB+Tr8XdblSDlZ8tp/YkHm9tWBV1K8ES7e4Q
         /vcZVZXlIVnJHrHvUsy86mkt2iM0rufpyQH6X5riTN8pm6zubZ2M+bMmefs6xAzZjb6A
         DjRhaS7t6EJUopjXe99M+ZL9gpIt+ahyq735yUwDFo9pU58Lti+4Cd5iiPSehJsOxYWt
         LTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785394950; x=1785999750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+MtJnOvs8AYg7ENm20sNfdBwSbBhTZCGHZJyclXCfA=;
        b=eQRX8944HMSZfqmKABvB2Ki+iUjNFtfwPDxlIKlUwndReB694c7BDO7pTlc85FJLj9
         JzKBbhsEfQZa/WIwRvNrXe4N4XE+CQtmtZXAnh3UmQOLsYyAtrGogClXHitT0V8J+OyC
         /F5gIJ2Kg38jLvneO86+4QmNBzW1M0DP0FCXcN2EdrCw/grqhUFEYdl9l+LCm8qpSRvB
         lnggukqQ/df1BTVjwwhOhuLV/JMHmeSYyVmP5Wz72Tb8X7fwWc8w/+i9gLzbB1Pnl7Fi
         91Y6RhGgTETynUQMCcjPe1uxkyJ35i46KKLNlMXDAtuiufaPJEFULCTkPudylu93UyYm
         VBTA==
X-Forwarded-Encrypted: i=1; AHgh+RqN/giAJnl3jU88+jvweFZTv/fj6vYDHKZ4DPkzftBjAtJ3QUc5AzgTN91T9+PXV0mRxZcL8SIWay4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqj3WPMw6l72EXytnjgBazF7MmxR/J4aqlvuryTfi/tGJ+VIIr
	4MD1osraB9stnWZVQcOM3TwH/9+OXnMc95kmk2TGQvZal3D+nVoHLM5yArBBthLf
X-Gm-Gg: AR+sD10l16C98uDVBg62E+j2oyipqUTfp1yR098kiBFe//oc7kufUIicgl1HKTja1UO
	QaQxWpd/JDC8Sne0HmeKkZwrnqdCn5qGjTNf27n+DWjgl+1RF/dxD7cw6U97ezbvQufGzQvu9fy
	hLNvxEX4tEB1yXsaNTzc2I9N5kVhEp1uX3GsqyuvkF9FLUjqMnvuuSO3FkMZSGSL/jYfkV5oG8I
	SAcN8V+Kuh5gOn+8+rTHWT3Etu/69U/g7WGFSHiP++DAfKk85iGbNIwh9fJmAih2Jn8So3+w/7l
	0FuIu7wEBJ5K5w1sI8ihCd9btu8ahR9dE7HkOuKUjXtOkTXBuzHvHHf++tTNmQ6yhrtzZH0/kvz
	U5m8UzEBGv9IyjX4euYkeTh7Vl0KrEOSbAvCTuic6V/jiuCjeLoFdmzb2Q6mezLSVE8z8y35DXy
	CgNUi1NJvkXt3GrHCtFZbHTUNRcePPcJ/pCD1KuSFbJyTgoI2q3AvvjBhBurjHgnV64g==
X-Received: by 2002:a17:90b:2583:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38f9bd83fa1mr1421020a91.10.1785394949977;
        Thu, 30 Jul 2026 00:02:29 -0700 (PDT)
Received: from Default ([2409:40f4:1008:1710:a945:87ad:2d3e:163d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dd42a9sm21046149eec.30.2026.07.30.00.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:02:29 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	Frank.Li@nxp.com,
	panjunzhong@linux.spacemit.com,
	kees@kernel.org,
	jeffinphilip14@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: uvc: Fix Null Pointer Dereference in uvcg_video_init()
Date: Thu, 30 Jul 2026 12:32:07 +0530
Message-ID: <20260730070207.16065-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In uvcg_video_init(), if kthread_run_worker() fails,
the error logged uses uvcg_err(), however, the pointer it uses:
video->uvc is not assigned at this point, triggering a null
pointer dereference. Fix this by directly using uvc->func which
is assigned already.

Reported-by: syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7
Fixes: 7ea95b110811fa8e41f5960c278bcfc80b8b21c1 (usb: gadget: uvc: rename functions to avoid conflicts with host uvc)
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changelog:
 - Implemented fixes suggested in v1 discussion
   https://lore.kernel.org/all/20260730055705.13784-1-jeffinphilip14@gmail.com/T/#u
 
 drivers/usb/gadget/function/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 2f9700b3f1b6..9ba09118bb74 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -821,7 +821,7 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	/* Allocate a kthread for asynchronous hw submit handler. */
 	video->kworker = kthread_run_worker(0, "UVCG");
 	if (IS_ERR(video->kworker)) {
-		uvcg_err(&video->uvc->func, "failed to create UVCG kworker\n");
+		uvcg_err(&uvc->func, "failed to create UVCG kworker\n");
 		return PTR_ERR(video->kworker);
 	}
 
-- 
2.55.0

