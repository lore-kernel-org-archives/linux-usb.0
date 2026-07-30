Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35223B0AFA
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399889; cv=none; b=gzCNO3IXEJuL/mZmecy5mQjWRTLZJ0FiJ2MtGaN7+bUTtpl9FCtkoGyKjujn2R9RPTij2nB2ZOGWBsCfYJRdQHCX6tWVAEMuPMhxTISXdw+HzL6ml1Vrhjw+jLcvP+lulDi34ijY7paaNpnjub998Wrfeb5jKfwstUrjp7rOiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399889; c=relaxed/simple;
	bh=gntGOjhXBA07pEHUhCuN5FxM8fYNhjoRrBO+RAoJbEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekpcmjwptIKpevWnwtG2sQ3bSsEl2xwZ3v/UlRJd+GUUcKczOmnj3Sbcti4isKS9Gr+DjjXoCuR83DJlW4YkdsvDMlR+H9RzQq/NTm2C1qBWJnU2HoRA9ys5daujaZDI6JALicWthmMgNh0hIIL14uM1VmLEL6rord4cw9L2afM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxGNGUN/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxGNGUN/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1417231a91.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785399888; x=1786004688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5J4K0JrlDOYNnYHo+BgER+kVovsWbiV6MG4x4gNbJQ=;
        b=PxGNGUN/Qa8Ut/M97G+OzzqrceHThC3ny/kB23pNtkCFf70B52XpizRrEavs4E5oxM
         yKg4dLMxuRJchi5pUk/4ycC+qgEQR5UL17TAWGBGkAA1Xf1mvh8I0qiOPPkjg//snt0a
         A1fHM7CSxcPsBoibhNd18NmPRFR6IaaxrxIWKkCVd75bnB7o6ZgCTgp3aJt0FteZTy8M
         2Yv04QfTO279XSeVY9W4D4Kt7AegSE1ExkTsAnQQZdgCCvkZYi397Dvez9LTBJpZif0w
         hHnhWToUuNgGouMLaWXpo1V2Wl7mgNYdYvbZKRpG+oFl30Ksp9KxRABOB2Sw2p6suYKl
         E/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399888; x=1786004688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5J4K0JrlDOYNnYHo+BgER+kVovsWbiV6MG4x4gNbJQ=;
        b=Vm5KH8hJecST4O74JHBDyiPj2g6IeV5/JaCLz0ilSPAWuEWHaCqz0xSYDYHkLfzrjr
         ieWgGFNeLnVDnmlowxZB5D1QesALKy0IFHhZm4GLURQjLuQfGGfqOyDq5ed7r3+6j3cr
         D+cn26F1Gw3VRh3rI8LuoLOmej3EH/cnNV1pwXwr72A2TvWd83rwVOoPKrkhqnFci3ta
         rJVaBsbv84TKK82JTz3Zd7wUw6xccNT+F6ex2rUxknTqj4hqx/2GAm/fy7Pk4tYfjNLM
         HCcEMvqgKIV+Sw1QBc5zvdDfdeGLKsNlbDSdFC6lD3VFZ5EeBmn3ybekyNFhxkdDCIem
         6yIw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp4HwoifHiVEhlb+EClevCliSBFwsO663QvE4b9+JalF5KtmGlxuplDB2+X3YbS7TkrmOm8dtbfOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMrYTBsOoRLR6WVteN2RdAd42DafKsnHIoyDJQuXd1RN/m+zVC
	9ES3IDJ0KfiTa1In+EToofO1baMGQUT8jF1RJ5MMr9ItebyNcrvfU+ao
X-Gm-Gg: AR+sD13/VPWfXVKmf3mNFwXIEtFSAbUzsNc2kZ5uinzjNWOVasq5/yzd4ezXTkxcFai
	0JU4GFokY6tDNlggVm3SiFC7TtK1oUoCiE8y3EvXJ+K4JhT6l+V7c+SsPUqSxX4f6MpG9n6sozr
	J8khbZzpILE97XpqblwsheMcp0gU3A66CDUrS+h1Rr0cgeaE8e0Oc+tKELlCrrocef914zs6iuA
	gcVx7mtOJlrYUDZ9B5ODwVlnpTEIo95M9iM9lj28BUE8D/ro0ptFd0DaynBaF9bwGoKbcmyeutX
	x66TZJUYSuDeQug+FHMA57WnQxEaTXqiAG9rqPJRfof5n8kUeqyquHezRwKE3u+uQvy4KfzzVMg
	4AHUYOBoA10IOeWNpljiUWQMzn64s4g5ODS+JmQpttGeYy7W6Rgr8GKDOfvDfz5iKBqlKjHQjH9
	2qWLuMyiZHRt0v7CtQSuhmqJtuv71cWNGRlalvrYPLIo+ejzqh0+ZbLmChZJc1hDuwyg==
X-Received: by 2002:a17:90b:1d4d:b0:38e:5dc:af03 with SMTP id 98e67ed59e1d1-38f9c1016e8mr1412538a91.40.1785399887890;
        Thu, 30 Jul 2026 01:24:47 -0700 (PDT)
Received: from Default ([2409:40f4:100d:2c91:aff5:d71c:30c2:c60a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b124e4sm17281938eec.6.2026.07.30.01.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:24:47 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	Frank.Li@nxp.com,
	kees@kernel.org,
	panjunzhong@linux.spacemit.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: uvc: Fix Null Pointer Dereference in uvcg_video_init()
Date: Thu, 30 Jul 2026 13:53:20 +0530
Message-ID: <20260730082320.9597-1-jeffinphilip14@gmail.com>
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
Fixes: 7ea95b110811 (usb: gadget: uvc: rename functions to avoid conflicts with host uvc)
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changelog:
 - Small fixes addressed in v2 discussion
   https://lore.kernel.org/all/20260730070207.16065-1-jeffinphilip14@gmail.com/T/#u

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

