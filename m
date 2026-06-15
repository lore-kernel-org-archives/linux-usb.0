Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886C3DD85B
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518285; cv=none; b=frRt1/Gesk7DrH12UQXsFAXdZuh2PPyA0Ur3OU/HnVz6yxSGoLcSTn5lQZ43aisx6r1QfqaST/ScWcVzJM5pLUgWJStuHbtNKXvA0KmzelaDrmVG8Ns4Zkj1zAq41WNJHDGklOb8vKFgGz3BR5ApPyDvwv+CfLk/nwTbZHljLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518285; c=relaxed/simple;
	bh=b4DFbYTqrbafPbAUIyCZ3yEenOwgT+KZGEuH6olCxA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EElFCQt0IGETD6bY+/rU5ikkHHYO9RnyoyfmKaMnfiFjCHwWr03wyrsOCXDjk7id7n66zbAVAFU4D+bWujj5v6rea/L4Bm4vzv2TYzzcyK2GK+x+7QNNabj1u8ysZHCFSq0FppQjk9XgnzHH19PGZe+mdWibaHXS8JLmQmhGKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsGHK5eT; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsGHK5eT"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c858d69bde9so1128846a12.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781518277; x=1782123077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RVi7KkvQsQOeDWpnCRQ5qnL7fNugRknh1rPXsQ6BoE=;
        b=MsGHK5eTErhP8qPSJAvp3HHSoJSe0CSioer7jcQPaLNezfAV5NqK7LKZPHPpbXztz5
         65Proq3iBoIluzmBdB7pL+ncPocSPVeT5+xW6VhH/0k8KUgpNznlhWbtU9wc6nahhzZA
         ixwJ2qANSmR6rKAQ22LT5Bw3bbh/l0QA3wfgRGoC/0Lu630cWrf82tKgiXTeuPns4Hxy
         alA8rYXV60zssPC7eKyoqddsvRt2B+NTjMg5ey1KejyyeFri89+Euiaw3rqfuWEXPvYd
         dtE65RdyvJwJFfwt/z+sc8UPdFJF6jTRMMJMUWH2i7AAjB1ZxlwDL6CR7mro6PFvBToq
         OC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518277; x=1782123077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RVi7KkvQsQOeDWpnCRQ5qnL7fNugRknh1rPXsQ6BoE=;
        b=mhnVFrnpb13yFB2oPOm591fIKRYECeNmfd7XTLPsgOZElkVxlFzZUcEi6jk21pb9Px
         r2ioMQ3UL+dtluzy/wIsLElYrekv+XjuMBfUlZ79Wk26/cD88/yPixWSJZL8JHJwWsbj
         p6HokL5ChdkFOCiVDBiznQD6IpW0dO+kjbTs+U1ejpgFH0BJ5LPnL1GIop8s1mQeHMUA
         DK0RK8OdSq3+f2QjaAt4Dchu8ubB6PkGyLfDsf+Xy7prHy3xRL4W12p8HJVOsTc+XITR
         5ZE48wxSYjnCqforeqrQkqvp2zwzNXSnbipAdc3tMwqf5h4qm9wCxIHj4TJ+LpcNuE+d
         LTzw==
X-Forwarded-Encrypted: i=1; AFNElJ8jUTGhuV8G8URP/VXpfvyX0dguaL4b/nhdPxw5YK79JWX5HQ34IigLgj4EEcqySZTe0hvwF/RMDFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsjMiSxwIU8nRVjyiFhVOpVZh3dSIhZC4ETyPVb5hbZeivF8pZ
	g6dE7khTwYd5BJf6jmqmx4+LmztX6rIvLKGQyrJs12E+ExN+XFCDRoEI
X-Gm-Gg: Acq92OGtmpd5WabPaKnzMhORbkgyspptiVMTFsU/ibu0qagWJhe2yj9yF235GJM2EQt
	gvUv/gzg9SzusN+WE14C8u3RvIdh1mJxWBDPZRE5sgTkbzM404z2/OJeQEhVvKLKQotvhHckALy
	iqNzpz0waJDVgR9tqrZnaDGCHSpVXNlJRnLNWqQq4FznddJkTmqySjMbWgnH9yE3sfQUYB5WPIs
	nwqPUH5msguqj1hnjvP8oLUwmg3+v1yqRcchqQCXHseBuknumkMB+0nSuFxXwinJPj8/5sYmaXn
	ROlNaO5nB+krH3fR2SCsggr6PkjzQjg17I4vmVlsMRFzCfJy+424bTKdFOzX6m1p/HXV2JWXZe0
	5GsbPZ1zq2vz9lau77IN6ACdqb2BnWoBvnwmd6SLbEFPpQ5oMxEyzY6ohMkv07zMfac3MxhWDkp
	X9oriUPrlDr+O+Q/Sp0cOV17oOpQR1MhRHhLhps5iwITYyhD7IUEc/xTFPyQ==
X-Received: by 2002:a05:6a20:7f95:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3b783bb0448mr16174579637.16.1781518276972;
        Mon, 15 Jun 2026 03:11:16 -0700 (PDT)
Received: from kylinsec-189 (li1862-99.members.linode.com. [172.105.208.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325e477sm8181173a12.10.2026.06.15.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:11:16 -0700 (PDT)
From: Hu Xinyao <huxinyao0011@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org,
	security@kernel.org
Subject: [PATCH] usbip: vudc: get vudc from endpoint in vep_dequeue
Date: Mon, 15 Jun 2026 18:11:10 +0800
Message-ID: <20260615101110.1913-1-huxinyao0011@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
In-Reply-To: <2026061502-rants-doing-407e@gregkh>
References: <2026061502-rants-doing-407e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vep_dequeue() looks up the virtual UDC through vrequest->udc, but
that field is never initialized when requests are allocated or queued.
A gadget function that dequeues a request during disconnect can
therefore dereference a NULL vudc pointer and crash the kernel.

This was observed with a USB/IP vUDC ACM gadget. ACM is not unique here;
it was only the tested gadget path. The bug is in the generic vUDC
dequeue path rather than in ACM itself.

Use the endpoint to recover the vudc, as the other vUDC endpoint ops
already do, instead of relying on the request-private field.

Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
Cc: stable@vger.kernel.org
Reported-by: Hu Xinyao <huxinyao0011@gmail.com>
Signed-off-by: Hu Xinyao <huxinyao0011@gmail.com>
---
 drivers/usb/usbip/vudc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index c5f079c5a1ea..f0a1a44c18e3 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -344,7 +344,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 
 	ep = to_vep(_ep);
 	req = to_vrequest(_req);
-	udc = req->udc;
+	udc = ep_to_vudc(ep);
 
 	if (!udc->driver)
 		return -ESHUTDOWN;

base-commit: 186d3c4e92242351afc24d9784f31cb4cd08a4b7
-- 
2.53.0.windows.1

