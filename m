Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309257;
	b=ElIKEDjZUPWzylFzOhG2fYRU2qcB1rzuw6cbjmI3b/kyJGEILxzEXP63yzHgGfBn5Sj6
	 EYwfRtKuXKU4rJbYZUSrkhVcPVY7ZHy4MCcNkXK/wUU+FJif2AA4oIsWu1XrG0bsFl3MV
	 uuLpLPApbn6p1H15eZK6l10tXicLYs6YdUfUUjXn1IcC+tPNA6FLbheDKjCJHGZ0Q5yMq
	 f0A2P3XRdlbX6oGkiCdHJRrtfrBHYoronfct5azE+NhyoG4SgrCRBxzlg3a/+lZL1u+1s
	 LivPdqjGG86uwZe3H2hB+3H1jMF9fYT4r2q//lmXT3Z76ZT35T4kspXyVOSAKkhw+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
	b=ThLq4G1AAcxKmIMoTv05kcwR/JhwCTRtKzAHOJHLxLQEzB+GskuOJCCgilosjtuoLkFK
	 Gbu3TZhe4vAnBkTjI0YDdE57EjmRQVTD2GLjH0CX1LYnIRCm4Jg02CYXwLIRcNvGTHgH9
	 uEUw05aQpiLVMI4c7AU7uffa7xMG5IJ9nJwhqfj6iAXfC3L+gpSPfZ4Hv2HMMACzRRK2j
	 pN8f/jOG+At8ALzuOzC5BJ5m0DmkUOhtSlpEfbHKDGsSbEPQiGWRdaKFZ/nUSX8Gny3k+
	 z1mf7Kgr1/L/7fZNIKRBJ/YHYtfqEz5k+bAKzXEkP8oeAZcY+6CGB1MDtsgDudbnM+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whEgGqij;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40356606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40356606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=whEgGqij
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-372bdb942dbso2522875eec.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309256; x=1794914056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
        b=whEgGqijQSILV6KrKPrl7DR6X0Hr8ZyZ0F+U95wxJ5yN553gCfwFMIILJpN1Ue0c3+
         DyAwDdzrXHajzSVmVDGGWiKYcfVBffIovDms+hLlDkIsNjua0YbuJKkAf/u2nLzZAANf
         GD4YqVyXjmiWIwusmBt6KjrGLsqg3BklO+ipkyBexKh32346bos5/CPbYPH1CwmcEBIU
         g8n9/jMTecJ5JzfqiB3BBg+CNz4Jr6iseEuQXSdPl9H0nDgj7IXbQUNeuCkP7D/NXnP8
         1kuEVHOCbN7tUqWaVlqHkvYdB9anRnflK2zc4Sar7uK5mnf5HrjtP5nVx1JxCyx24MDL
         IpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309256; x=1794914056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cmPq1xovx31wY8V3YqLuXzHjOU/A8Tl8hkT2pJxDB0=;
        b=THh/36c4PBC7gm/e/KkPcT+mKPBXX8lAyULFn/IbVB67UL1XU2CgsTk8yHmqYyJDfa
         1WnIyfno2o6yXQJehOrtIGT8a+XCbbco9MbHEkVb7/oms+7jXhsA5XeaS7aIE0Mze6rG
         c8Qui5le+djLKbY1xICg4gZ+7QAju5cQq1iDncjPAhoIQp9W5H2ouHNIdCHwimALPEvz
         PthW0o4u1g7WiC/bSUYwV/HHgr1gt+JPl2YXxKQu7OEOvlcK3TMfR4J/koi1tWREtn91
         LckumIgkFZQRQZe9nzhzqmPPMl3ZKuCY9DwmoUZgb9ll7VAe729naEmwBOWtxDDZGOJy
         2BQg==
X-Gm-Message-State: APuU4Z8Ua2peeYSLj1600l0b3crVWTD7S4yy1q7mOePox5CAnSbfZjve
	2LE1mFB7mRBVo2c4q2bQKgmPhARhIzyGF4NlziGRengmjPRy27T4r+X0
X-Gm-Gg: AYBFou2Hh5/i/wz+1JipEJ2sKOimcyjvjJVmaFotuRpPc/9r9TPKUCvjhbCizvYK5Aq
	opgUj3ceMtNdhh9nQ3Go9JlfI3mY0SVN7ydMgFmGCFueXzBYP582iGXok5OS4zpXazedADDsi+M
	hUndIoWVrdJurtsbH4j16cCBTjFjG4QKlEHYgJWBz8kDqpnxEDsLGXTNoeBMgZBK8C7uEURtRKj
	Pc14YVnI7d+N/veyWRDsrCCIszaf386ESnJ12sD2fBlaqez5zCkNWESWa4OLSY7qDL9KWl6X3nz
	wmdUy9MQdLmKyc2mRh0wse+ASl9dCiceWxXiDeY32BcLNl2jBwDIngvq/pO8DYjTWqH8oHX2Vuw
	/kqH8Vuwj/IoECePInUg++RiXe8gKvuuc3p2DtImol7voNnuY4ihJHlReZhE6YMakd6iILV+ZMJ
	tv5gzcTM48a35Tc759QTtjHjgxFNZr36jd4CFiWhyh4deky/njPDvu4AW8jg32l1DKS1Cfk9trt
	WhcfQsM2SVxc5zklObV8I+H9SPGYcdbSnGRAWj+vbkOIcdM7xy3zPT9324Dp8nMUpAfBfZDMdwZ
	eyV3CtjS6sL9Mpqg/s+xa/fk0BPUWymFF0xdzovQ1pYKIE+4pg==
X-Received: by 2002:a05:7301:78c7:b0:375:87f5:ccee with SMTP id 5a478bee46e88-37587f5cedfmr1886929eec.29.1794309256012;
        Tue, 10 Nov 2026 03:14:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm5908119eec.3.2026.11.10.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:15 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: chipidea: core: cancel power_lost_work on removal
Date: Tue, 10 Nov 2026 20:14:02 +0900
Message-ID: <20261110111402.2504885-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ci_hdrc_resume() queues ci->power_lost_work on system resume when the
controller lost power during suspend. The work (ci_power_lost_work)
dereferences ci: it touches ci->irq, ci->dev and switches the role.

ci is allocated with devm_kzalloc(), so devres frees it after
ci_hdrc_remove() returns. ci_hdrc_remove() never cancels power_lost_work,
so a work queued by a resume just before unbind can run after ci has been
freed and dereference freed memory -- a use-after-free.

Cancel power_lost_work at the start of ci_hdrc_remove(), before the
devm-allocated ci is released.

Found by static analysis; not runtime-reproduced (needs a chipidea
controller losing power across a system suspend/resume that races unbind).

Fixes: cc509b6a47e7 ("usb: chipidea: core: handle power lost in workqueue")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/chipidea/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3461dd7..400e4ca 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1246,6 +1246,13 @@ static void ci_hdrc_remove(struct platform_device *pdev)
 {
 	struct ci_hdrc *ci = platform_get_drvdata(pdev);

+	/*
+	 * ci_hdrc_resume() queues power_lost_work when the controller lost
+	 * power during system suspend; the work dereferences ci, so drain it
+	 * before the devm-allocated ci is freed.
+	 */
+	cancel_work_sync(&ci->power_lost_work);
+
 	if (ci->role_switch)
 		usb_role_switch_unregister(ci->role_switch);

--
2.43.0
