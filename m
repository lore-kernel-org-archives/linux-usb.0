Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3584374170
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815047; cv=none; b=Taztfo1hZWHxhWmBJjnCVLxOFixBO0xRiWYD5uaq8zAkQ6OKNIFSdXn+58NTzO5jVgmAb7RFmz68F8Cknnsh60D9RoTZTpEB3/YUbtGcDbH6B3MX8FgZ0Mfcju0Niu6lxNl6Vv+Y3zrqvGnz5BumXLuAYEziYS5YSo4cD0zlydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815047; c=relaxed/simple;
	bh=rf9Ub9sDjKu1OneCevUsd/89sAcaPAkWTeLE2c6AmDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDVqWvKaEYVv1y+A92wW7StIC7+/QbaoRWUFAtjj3mceBHuXMno+IWTQd03vJvKBD19vMo2Md1miR07eoKItt8NPXvYAG9Xkpdiz3M2Itu2iU6GRcKp3vkOuTMl9+kXXITtz0lDJOGdADE/ZgwwQtnzrj+YHKKvMvaQ++1Ttg6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1ezje1y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1ezje1y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3918315a91.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 20:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785815045; x=1786419845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQoj1Sy41ih176qzgh3hbd4a6Tkh8TOhWR6mflT66zs=;
        b=n1ezje1ymE1OaMeHq+uSVOoP6Pike9A8qb3j/9sEoB44uemFpYdOvzRZXg6pErDO3T
         gm/LG4lzKMdIYd12sC1oF4u/eVaNQwv9JD98Umb4emhPMz9G6NWDClwfD4OorTv+Wnye
         cBIyuWcHUFrBYkHh6QutKHghR95sXfxqXTzM6ESkNcgHaScsZtqPV7QNeS0AraXJZHhy
         Df3+ac2rgz/i4VWVlC6IYCbYlNPZjwH0HTqleCTGkORY4NWCAy2dhfRcF55U3jRvFGaq
         kvkYflrWQ+qYjkPaq3xJ2w6bx8vEMLZUsWJ2pRggBMYL4gjakYbpx7L0eTBM1QPLer9C
         0fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815045; x=1786419845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQoj1Sy41ih176qzgh3hbd4a6Tkh8TOhWR6mflT66zs=;
        b=BjQCTlMGy4ZqgkFX57cc/fn0S7adsa7lAFzgD29YdrKzXPdGXKJ56hlXBHrnyJ6/W8
         kUM9oz4k8ApV+BY0CIBK0yFOEeHlKxvfJT4lnzOnF2KqHxTj6/KLSAk3ATXeen9Pklbe
         obwVbL1rubaqVa0ZJ4EnSHpUTA9S70B9FOONRh0liKgRjNPz/tze5vMNUgn3awGe0W+7
         AWEfAYLHTGXt7HGbvczvGneSJOWLKzY2f/974PhHRmY75cDcYvM5Vr6CxNymSSeKgtxL
         HO1SjnHQmIgYPrrh77+BHH6mP2hNLjhqG8u1JzQHprrpaWJDPdaqUQDBIFy2y6ovAgPK
         HUHw==
X-Forwarded-Encrypted: i=1; AHgh+RrpTooMwAk5rZatHbeu39/naQFVtN33Yh2jmFVkryCtCwEXQszS9JCrROlMqdkYIDPm2r9OD9GbQiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJ2pthSPuq61N2EsSLnAeJT+CZcfwIqUvAT+eLtPInpABRSQ8
	eFoQDO3trBIBNmaWLnBhVbSSfrLo5QWomm4yLhRUTeHcwLID8lm4gQt2
X-Gm-Gg: AR+sD11tUTPUeG9wm8jc7sokZOApdWhp+x72tWxi9t/UCXATbfvCAu4X86pGs+eFbPH
	HW1nARw5eJzPwzKN0ZzUSa1HBH0gXpi9pf0oq5xLaK1VeVG87FQV29nIUUj5U+/JKt99DTHX8s5
	nVB5dCiMQ19JSfWtYctkuB8RotR0YH4eYmSMiCtLuIvzcB7VL7qFXyRBgzKk+0FpKUcGvTKqrIC
	hrSMd7RRFIMXAXKWwkRXagCctk5N+LS8Fa6Yvl3Ls7/Z6K9RvPdYJ2CFofs4D7eeH3lDoZdiseU
	CHM0BchbcdFeRY+jJ5TQmAPnj/VlI72bA9V/9gafwIwqDkGOEQ6lOiJI5XPSploGOUF/FwgeIal
	5nbcoQN6nppbQA7HtFI8qjmdgoSZKMbvaQj2hOrkUE/1D5e5fq2D7rkNj4gZAIsPA2dyGWMY/7D
	G1aIG0wBbBaJCQg43pHa4R1JgEIgOCnppvJU8v248zHR1te13QgtAIDdSHN1pud7BI
X-Received: by 2002:a17:90b:534e:b0:38e:2aa8:60d0 with SMTP id 98e67ed59e1d1-38fbc598d19mr12616251a91.37.1785815045133;
        Mon, 03 Aug 2026 20:44:05 -0700 (PDT)
Received: from Default ([157.51.13.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm36025019c88.2.2026.08.03.20.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 20:44:04 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	Frank.Li@nxp.com,
	kees@kernel.org,
	panjunzhong@linux.spacemit.com,
	andrzej.p@samsung.com,
	laurent.pinchart@ideasonboard.com,
	balbi@ti.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v7] usb: gadget: uvc: Fix null pointer dereference in uvcg_video_init()
Date: Tue,  4 Aug 2026 09:13:38 +0530
Message-ID: <20260804034338.7976-1-jeffinphilip14@gmail.com>
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
Fixes: f0bbfbd16b3b ("usb: gadget: uvc: rework to enqueue in pump worker from encoded queue")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changes in v7:
Changed Fixes: tag hash mentioned incorrectly to be updated before in v4
 
Changes in v6:
No code changes from v5
 
Changes in v5:
Added changelog as per maintainer suggestions
 
Changes in v4:
Changed Fixes commit line as per Xu Yang's suggestion
 
Changes in v3:
Shortened SHA1 hash as per maintainer comment
 
Changes in v2:
 -Changed subject of the patch to include subsystem as per Xu Yang's comment
 -Changed incorrect "Fixes" tag to "Closes"
 -Rewrote the patch to use uvc->func rather than declaring video->uvc first
  as per Xu Yang's comment
---
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

