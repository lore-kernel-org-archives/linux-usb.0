Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A03BCD0A
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404408; cv=none; b=CDz4s3fKjAnQnVuiGcLzpEPux7Mn9uVTaw6CFNTG5gbgJZuxjaPjGZPS3oDwAqvxi53LC7n1WkT7GMnh+0kxzq2nFWf/d+0aqle3GqMirg9SgKu8l0A5cY3b+YKCn01KLD5KLigBYE2xe+a5Xn52s3X+iavFAAbeUOSjT6qSbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404408; c=relaxed/simple;
	bh=QVWkhEl0FV+Cz79sh6pbWlQp2k5M+DToLA+Tgm/x84M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0TEU5S1KzBastdMUpwefFQsEtP/K8gJDqzuRaL4OW+BzxnMeksgly1BI4bi9YYizsnfZmAmKCbv2+qRX7BlqDDsxzo1qOVlTKFdBN+j986ZrzGtMOug76N7rI7+ZkGLlYlevk3KdIOmFENqSAJM8Q151I0Iku9ert41vR8fYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Afv/Kosq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Afv/Kosq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1919358a91.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404406; x=1786009206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QiYqu+7IfXIRAIS5oVdzky6mjvxq3/9d+Z5iNN6Z82c=;
        b=Afv/KosqbkLdMobvmIuEhe2C7Fy6X8nfrikNH9x12iNNjNAcz9RZKBBUUsJWwIzcES
         MCC+tJKO6u9aGSkJ0wPaE62w0avVhrUz/iJFgDyzEUURjIZMUGZc6jeqKPfBYCmGkQQm
         W6vwQRb1TrOfnthEJtOfgDPU4EcpzhZX33OR9H31TXo/p3lfY/D9lD+ZUc9VgsNZzM87
         T7Kuqsvn3ZCN5Tj96/RnzWH1EdWa/v5P+psmxWrg2UA07/2lXo+UvV1+4xntNwXP0E8m
         wMk1G80JdGGkHDelzxc+03dYLH80PbOO32lEKbeZlx36hHRyeiW/H35/6lvxQn5TVvTI
         Ex+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404406; x=1786009206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QiYqu+7IfXIRAIS5oVdzky6mjvxq3/9d+Z5iNN6Z82c=;
        b=Am0Dnb14TDgdczWEhYRzG2lHxZnBkAa3bGJdFdMW8Yi7/TP+j7aSTuWlSuY/7ZWrYT
         HIUOZUstq3HT17oR4C0Zu/a9Pbcxc21ol6baExHbRxV0z18Gi1lYtWorg1ypx8BsjHNp
         A7x5MRAn8HNj2HvjVdPVc1cHr0HWGByCl6WuVXwDdKsQdAoVDccSlOaPkX6zjVbwQDUo
         2S4YPrzmjDcHFEy2gt6tBybFkx5v8gpfJCBw3LAQDBQDIQj5oeXa7+Uoo3x3sHyY+YWM
         Cav8z4EnZaDRnt9uvBdQ7eNfprYWHc0DfNIcZIUAeG71sZ8eeeVBhmcIhWIAowPCRl/Z
         SHAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1bY1tzgFMz9U/3dq+eYb/Olro+Z1URtECd7Lc8jIfw8jZx+m3yZV+Z07bSf3Cm5IHd+7waGhWkc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNcVxYRvwfnmRpUyDU/uShx4o2v+F5mBfPogOAY7AFdpIbbebt
	gZ32CzYvKfjANFvfFUcA3VmSg+l/GKGl47xZPTXA41edzbBq6fxKwGaQ
X-Gm-Gg: AR+sD12tILr38nKoUCZBpWwd1tZAEHjKqmGnBq8207DQHzFvk7BLbdnvz6R+zX/86i0
	Q8VcD2l+07kt0i/YRqn3p34V1bdWzXEZt3w7V/6Bv+Pw0yTEFTLOpUvss9GHYi4wne+KnzuZzcv
	w0MEH/f1D9Dv6XuYg8p5bqAhyqV4ZbTB7xSr+x+dMVkObMmLazz8P7m40dSiELRaSBxpZeb4BEC
	04Chx/0cfer9oTNsk9tO61cW/Uu825zEKtW7JVPRCNsQ+FV787CNX666n460/EFKy6Bpr7qsjs8
	1Ls7A/kee2hrqTiHAhuE8rtCY2W+O3bv9Hi0ld/TJJf1f9iXE5mWXS/Sk83wDEILQosBTCAVWeP
	7dgxMLQlsUPtxRG2/zMNOZR9Mx41liiNSVL0MNSPO+OChYluSbLi0ToFO0pV2JvztfsOYQkqZmU
	7W5XlAHhsnbiG2h9wIN++jitM+uRCfyIR09eEnKMmJWJBuHTay6vYzF25rYFqj+azzVg==
X-Received: by 2002:a17:90b:55c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f9be2b442mr1756243a91.7.1785404406040;
        Thu, 30 Jul 2026 02:40:06 -0700 (PDT)
Received: from Default ([2409:40f4:100d:2c91:aff5:d71c:30c2:c60a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dab154sm21269626eec.26.2026.07.30.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:40:05 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	Frank.Li@nxp.com,
	panjunzhong@linux.spacemit.com,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4] usb: gadget: uvc: Fix Null Pointer Dereference in
Date: Thu, 30 Jul 2026 15:09:48 +0530
Message-ID: <20260730093948.7800-1-jeffinphilip14@gmail.com>
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

