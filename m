Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506305;
	b=Id/a1wiZQZWjoPgjoGvgCxeuEW3mv5AyeBpdWaZYZcNw7piiuc24p5yJFXqCinS+TV+o
	 cuPvDLycoAYh/xJA8GslQ05OJrz6XSJ//ri9Ts3Ji4we8MUiPGmqixQda4kavMheBzYuR
	 x4Df7eM3kuOHoYNKzQbaIAatVJsYAQxBzI2tU2FvSZFFcfeD0Vztv+bAWzoaVz4RlPgMw
	 J0DKbnScXASX91FyTOgwoto0zPUYIp1NrCrptYJzMCgzlE+QYAjgF8iI/WskB8SAZU62i
	 P9ggFxgKa/EnXl36qB7EzO6rvSm/FClMaToN/SEcCrnkwBhHMxL7Jf2QZMq0SmDl9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
	b=S9kv2vuyRH50JH8rCpmUOS/WKMc8XUFqHiTRkR7qV+EVZwBobIqsyK3L4gWBayoQHIao
	 ZG43J5j1+uSeE1FBi1M8iPJI9hKxSlyNajaNYUKXa+v1DQejI3iFvwi9hQGx9x9dGzd9I
	 aeLTIuDuzS0/+pJAHyhyCIh8xljlFA0/EuFCQsXXV40hBkjhK4NKSRtlwxs3ewC5zeHtk
	 4xR2dlI7XIGv70Bg5JbhSTtGJ/7dQr96W/OBc6zZZpA3FUNd8Nm98s8h9WCqQ/O5IkCLm
	 wQH1eiKiP+v+D5NMgCK3ji/3qLmN7eXp/mdwBw1WcbkxkTe2QHTWfFo4Z4Woc8/L63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS6KFzwa;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E3606A320
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bS6KFzwa
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so173522a91.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506304; x=1793111104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
        b=bS6KFzwavUcNiOSPpe77g0j447VzmfSCy8X4mBurYxhyqxMySHXpqozViwljV5Ux0g
         JvNpNyJRFL/e3+E8khJl7JoFei8hhyYlAOobKEoz0dnKEKEpHVR1HDSCb/VvsB1gXx3e
         /LsZD28O4H/xRVd+Pt8+f0rMcifNs0wvYFJJf+GjqByZp/VS7nIChdyOVWf2s4jpwe9/
         woD+T7v4tHGQuhcLopEnTaKE3Zvr+GAUW9a9pfKDXUTJQJ8rcACNpxFGx4uF9ZNaTyzT
         uucJWA54e7ASvAvTLGuuemp5iC2yukK0YSea6ZkZSki3jgdbVOP3cn7T2aPTM+Zi8tD3
         ROZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506304; x=1793111104;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B4KgMKGJExw2NIRAFHLCe3T3gCFWPlSlhOpBnCMSFXI=;
        b=BuMSOJIN9yyOuCiUjMVihC0gWkx9zUJKbyomQo/cJAGsCGhcZ+CY+AJPPA1Vit6Rb+
         3OVwBYJnSa872rz5mDZxYpbFo9xMNpzOEEe/nfj6poAFtKs7jobnvr7zoXXkUElPJFBV
         MB/oR9y5CueFrHRmZ/xYnlIpQ97+nTjdOHS2tKaC6KPTRlNF7siunsJKGFimjhAk6TMf
         nbO56gfzLPY4gi5CHkV6hqdpCyWlXDVzBg1NGN145lec7SsSZIK12GR/RVVKFaBQwzvs
         wxfm5uYep7I0waifXQnyADiaQUAXRB1r/26Ism8y7xlVX0iObtMWy0F8R6yOzFyfbAPb
         DiWA==
X-Gm-Message-State: AFq9FYLbnYtNlss10nVmRoMzaDTqWNzx52NibwrmhSy21I7AuE+NubqJ
	Z330H7hpOwJcs7EvghqOTle6n08PHptR+k+ItUdwXBd5tpfOaxqQsPuh
X-Gm-Gg: AYBFou2YUC/16PdrJvmvgmCo7WBxzd7vzDc9IhO9UGMk8bnIbKm4jEqVQX1zCY+hKWv
	a+KZi7MNMewBrQxOSUzihCEeLI70y45v1ZIT/xKqGjgCcp3EwGCPaJffim0bTRJdCLyW6+ljzLO
	Llo8UoDCLg0vvmn0tnm4smpjD0cZWywmHj91aiDP7F73xG2zCYjyustxRkUkTjQyoVPHaqzVrcv
	8CUPEMEJQI/VgqAOpxVbWJNYa0mKWIgGLCryeL0W8EdlUTAnkn0ychI1RACt0N9N4hda5LoNhPw
	dilHTed7kd1D48MmB8Bt4JKbWmuoXrtE6XpGCUtrgZho4qmhotFsCD2W8uRDv5lWLMWAJo5L5B7
	idffhNlW95KvS8tXb0m7d7cdlfOUSGuRTHV41VCJx0P3OHrTuASdPC81Xka5X1ecY3wYuDxJfQp
	xQFqmFdIfMRaS9AH4ythulhAQ2fXGbBb8FGYFLHuAWFWcTYf546oYC/Ydc6tBz9Al9oI/vXZIlc
	BAZCE0KGvLu9NWIA/PKaw3yd7DhUGENHcRytvZ7HmOCYGGoJdzxeanuYVJhVsGcECGjRGWx8TVx
	sVodp5sX
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr15921906a91.5.1792506303983;
        Tue, 20 Oct 2026 07:25:03 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60f90a6bsm3570784a91.13.2026.10.20.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:25:02 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, stable@vger.kernel.org
Subject: [PATCH] usb: musb: fix double put of gadget device on setup failure
Date: Tue, 20 Oct 2026 22:24:57 +0800
Message-ID: <179250629747.20696.17364135141613638741@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

musb_gadget_setup() calls usb_add_gadget_udc() and, when that fails,
calls device_unregister(&musb->g.dev).  But usb_add_gadget_udc() already
releases the gadget on failure: usb_add_gadget_udc_release() calls
usb_put_gadget(), i.e. put_device(&gadget->dev), in its error path.

The device model documents the same rule in the kerneldoc of
device_register() (drivers/base/core.c):

    NOTE: _Never_ directly free @dev after calling this function, even
    if it returned an error! Always use put_device() to give up the
    reference initialized in this function instead.

The extra device_unregister() therefore runs device_del() on a device
that was never added (or was already deleted) and drops the reference a
second time, causing a refcount underflow.

Drop the redundant cleanup and just return the error; the UDC core has
already released the gadget.

This issue was found by manual code inspection.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..4bc4270088bc 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1794,13 +1794,9 @@ int musb_gadget_setup(struct musb *musb)
 
 	status = usb_add_gadget_udc(musb->controller, &musb->g);
 	if (status)
-		goto err;
+		return status;
 
 	return 0;
-err:
-	musb->g.dev.parent = NULL;
-	device_unregister(&musb->g.dev);
-	return status;
 }
 
 void musb_gadget_cleanup(struct musb *musb)
-- 
2.54.0.windows.1

