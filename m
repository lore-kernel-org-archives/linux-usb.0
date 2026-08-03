Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64031D366
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785732572; cv=none; b=BoWkcmr9vl5V3MMKai5Cs10icMy9OTF3pktaCk1m5RKnQz+/MieCkJrTlHTfrCKtlAq9JCZjD2GYxMx9raMh0tizm5fFiNXaKS3KzQIbhs9mN5KeyYmU8lC3VqQ5ef99ULuhkn8s+z6Fxxx/7anHwaLoICDeFJw1zPOtgPEBPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785732572; c=relaxed/simple;
	bh=46HK5ojW10QtCqveZtmMIdvFVUvyO6vX8BARdRVpdX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pa0XP/vfpeHNC9DR58eow/HugnQ9VoysB2BQgeVApkHyWW3w8SwYIJ4FIyDDXUVWnphRREYwqaH9+uFFM34npxS9Cgk5JquJi3V5/wSc5vF8vqz2XAGk2XtcGW14fcyIcB+WVfTXFdhrDzSg35MbBn/AsZtNIuK9BRuvy5tw740=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n44XSYNZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n44XSYNZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so2184959a12.2
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 21:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785732570; x=1786337370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6mXAlr/zwt8ZXOoLa52W+b3eDz4sTWHBZRzsSIRQPU=;
        b=n44XSYNZOXdqsYgyyJ7tAS1cXo+S0Jl/0mXdFnLO+ivS1+2HUBXZp4P3D6IacipDKG
         k98zIovp2BCXsjMQKqyIGyL8SWTdVhUnjAK6R2jd72j7nrd5CdZcO/aiQCMaBy5zWNzn
         9zK70OtXqD543A5Rtum9jM02y8a/KHpV1UYfIigt5QajSDisAwOpFMIAsB9mIjEwfFk6
         hdyfJLFQmTMNecSfni+UEl3jeEfaFojHe+ok2Fda3eyRNHgxkgpdPDhqwZAnKi/Rv5nw
         kR1aSuS3diI/r4x7V5L8QV2AxUGXeBDZnM0waUYcD+xbfVCUpeG4oK8gYwIKqEWZURW/
         LFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785732570; x=1786337370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6mXAlr/zwt8ZXOoLa52W+b3eDz4sTWHBZRzsSIRQPU=;
        b=FCvsdwEEAbrVs6tdKfxxyH5AYEG0yBTYFZmle1wr9Qscppyx8APZ2HCEdx1nS9H2TJ
         qYmVRVNfi3JDhMJBmXLkUkSQijEy+LeEwbYEugchaZ76v4/rt/ZwAUgKxKmJ+MY1eimk
         wkxIXs719Av4sOr3axCX613B57yKjqaI6cGURFhGPGGzcSHy9n3eVfjXPV2CIUMw+lT/
         ZrDuwiS7suN+QVoUxKvX7VsRhTXG5kRy4ak64WZmSce4bMsXjEa5KPbIPnhjgpbEl2z3
         etxACcJu1QRxvtKz29iQIMkTuVjRV4+P0HXPZBmwaIjEDs6lmEaIPzj3DiiCbsji4Ojv
         2Vhw==
X-Forwarded-Encrypted: i=1; AHgh+RqxxoYriX0UzB6t5dejGiGkfs5ZiZwD2RyYyKiwxBKpVaD2OeWW/Ft6IaK678Jw9RtAy6ooRprP4vI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyziG3f+IyybHD5jUxgsaRQyYFsojN/89BlDk2W74C2/ECGkKSQ
	a3lUoG9ADw1n6sjvlm5EST4Cnl2QK3ok8WIVcgGfA5Y6iUnACYoDXXaf
X-Gm-Gg: AR+sD10mLcZ5dDj2rB0PGVC1rtQ0cR65xXrFcPvoUHFfaJLQgPqH1+x0/xREv/PnO67
	I89s4rdWlpeiOgzgsxuEOvbNLlcgN1s+f6mcK0p7t4HdxbbQ1YVSP3ZjdkusSedQZhYTrwz/JSI
	jI0vzQus5NoxPJLnicarOfCKVqdpsjrmvRjFRbo+I6fkMbEhndULr60J1U7UNb/nrXJ+vR4uLWi
	7mUivDzUn5GGV0pCZYaH5Xk8qNOjSkBAG3NZJNVmXQck5w06yPWSBGbPtr+w+TeQGAOuav/c/fE
	rn9SWniaE2urqlJWxHqyV6mRHyTG+/n2YGTt0UM1wYOWtunpsIxyJIYdMsXp9BXUPcFwJqIKn4b
	HW2cR6Bsc8VIfWGnPf+BrJdtghtNG1qjbmFadxj4ML5zhRAfAunC/MTCYcNmslvlXGoPPPkzYym
	4eZOrWWtwSDSi1k+pmfT8mn5OIht024sZDHDqEXfKqMVK7DDNMYiLUOMl1xbQ/C2Bd
X-Received: by 2002:a05:6a21:398b:b0:3c3:f5ff:8c9b with SMTP id adf61e73a8af0-3c92a8e2c72mr8019202637.71.1785732570300;
        Sun, 02 Aug 2026 21:49:30 -0700 (PDT)
Received: from Default ([2409:40f4:10ff:eef4:b4e1:bfd0:d002:8e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm33236477eec.21.2026.08.02.21.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:49:29 -0700 (PDT)
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
Subject: [PATCH v6] usb: gadget: uvc: Fix Null Pointer Dereference in uvcg_video_init()
Date: Mon,  3 Aug 2026 10:18:56 +0530
Message-ID: <20260803044856.9271-1-jeffinphilip14@gmail.com>
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
Fixes: 7ea95b110811 ("usb: gadget: uvc: rename functions to avoid conflicts with host uvc")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
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

