Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3593C585A
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 22:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240658; cv=none; b=SAB0V07RsJP2aeGFrCpXu1V1xmHgSBfJu0mXNjVyUZsvm7rqbM0oh31XQvBq4kcajyxdYpn/HE96EDgph9nfaXiRxxn+LbTEChaBBSgGUpn6lMOmOGjP5qNt9ca8JC40CkCwIs68SyQb3K/0MP/Kq8PLKwhJis/eVkdRbIkCdcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240658; c=relaxed/simple;
	bh=hHaaDlNJljpuOJ+UeiB4YjBn2Qqf+1PpdW9pgRg0rNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdtAc8SeguToszev/rYb431RPgu/jXBUvdagl2jSCjvEEyYxtJkuvFVxSbxnakYAqsDqWyNB1UkHezPXzUg3BzPEvKta4HmhXjkuiMeNsCkDGR4n+I9JeTVcb+rmjMQOqRkiq8awN635aDl3O1dbtheeyPCZ678Tza2C04UWA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1wWM1it; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1wWM1it"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so16962805e9.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 15:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240655; x=1784845455; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRilmWySgchHqhE2g6n9YGHJfb2AaRGc3NvI8/zl/SI=;
        b=C1wWM1it6h4LzrobWbU0DYNIjD6jMtikO9RO3V4dlFyyPHqZ8rDnkcirhZFk9TqzcM
         WbBrelHJZFUWr4LwM1MGkUxIBox8zApbYDM9tLHrgygXgDbH1eXHGCMUj+yaLF8T/z6T
         vrteEGWUZiGexrur8QdvW6g2YYWkShbRnOzxpDSnoPqY5No7RaXJQjMwYlnXtQXfaIB/
         B1SotUI1ZIJkrNeRF4oZpO3DZUPPB0V7Lm2XiVQizOznKOHLT8PLgzWrwuMB092ZYDsa
         2Vf/h2XSIX4hP8lIulpMooOg59L+4FmqzWtOzSKDA8yAz4tMJEhNYWXxGJg+Oe2GGwTf
         mJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240655; x=1784845455;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRilmWySgchHqhE2g6n9YGHJfb2AaRGc3NvI8/zl/SI=;
        b=aFnyzz2fjS6iZT280vPcZSufBzNpyGNVfR59b5dZ9F9RdIpV5/a4Jx8OpET+gJQ+Oy
         bMFkY7naxdDrJ2lZwoXYCrEgBhbCM6695MT5/IPaAHS67jN0PmKpiT0aCQseuPo0JdaA
         lIUrxR+0ZoxjNrDyZtwhwaD8rNVnJlWwjRZfu4oYwoRPhV5zbJMy9ybrw+EVyFPjcK2K
         sgYKpfpsofM4/J14hP7dhF204zh/wr2IlGJLbyUmDo7L1/Q3A3w9hJ5mUuZjqDwbNuIp
         me7cYxtR4FUaiU1JWTytFjoL5GsiYalnXsamBhcL3ScJgTvc42loo8AVOg9iA+A9Xy8Y
         M7PA==
X-Gm-Message-State: AOJu0Yw6iobgpZjXfz/3LP4qL216kQrMNoAziweMO8k3Q3WxeYnwnbuL
	vj+LROb63Xkmqatz0OeRya5eX42SfFB6YS/SKmNhZsslsD8CQ3nLU+zc
X-Gm-Gg: AfdE7cmL8zL1ZyJaQ24+vyAWfUX0gAfstzP9Rlke8nkTuLnhGqrj5Mz1/JDsePyAIFM
	/qUmjkLniT7Dn+QDEIsxUWiAXDzYKAd20xbBzHHVXXkXT7Bn1ufZ8guUNoyWC74Gy9g2E6rM7Wr
	vsqUFBRtg/1Gf7zfxdMLrOTe+7WTOS02OwZT3D1d5oJJEYll5a5SC//OQAbQvNa/Hv4Omx1Y9zb
	uUxR1EzBUHtcnq2d5J5qU5Agy2rIGo/qeTgZWFrq2MXlvc4pSAFWI0WMU9jycCPAXZl5UoIHnWs
	2+vS8vanwq78OEwTTNs8DKKv7d8qE5U/hhJADqSHaE/PjKiOZ5azROt9F65ORndKaljz/1beNts
	pqVQqj13fL9DMoMT/v1ONuL5f7ksiY6sijt8uNl1eE1KUa/1k9yXCHIl90vAwFnIi8tNiLuI1wW
	ilKg+JGk8Jq494HpmwLFTQCxRAsmo6awKFfLgtaw==
X-Received: by 2002:a05:600c:4593:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-495483c0894mr14179665e9.27.1784240655072;
        Thu, 16 Jul 2026 15:24:15 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edda2sm85045e9.13.2026.07.16.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:24:14 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:24:13 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: gregkh@linuxfoundation.org, oneukum@suse.com, alexhenrie24@gmail.com,
	ae878000@gmail.com, mhun512@gmail.com, kees@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: misc: uss720: Fix leak in get_1284_register
Message-ID: <allaDTUua9n5DQ0a@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

if wait_for_completion_timeout() times out in get_1284_register()
then we do not destroy the reference acquired via kref_get() in
submit_async_request. Add the missing kref_put in the timeout path.

link: https://syzkaller.appspot.com/bug?extid=56962eb32ba0136cd330

Reported-by: syzbot+56962eb32ba0136cd330@syzkaller.appspotmail.com
Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/usb/misc/uss720.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index 1ce48f5832d7..bd0ad7c3261d 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -223,6 +223,7 @@ static int get_1284_register(struct parport *pp, unsigned char reg, unsigned cha
 	}
 	printk(KERN_WARNING "get_1284_register timeout\n");
 	kill_all_async_requests_priv(priv);
+	kref_put(&rq->ref_count, destroy_async);
 	return -EIO;
 }
 
-- 
2.43.0

