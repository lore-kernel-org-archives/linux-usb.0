Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750565;
	b=sXw5tClLLr5qy1vPCyKxaOU+6cAv3cdkT8tJKxLDFYxUuwFRbuIVefFQKaJDhKezycpu
	 zG+73pFsyBFJRf2b0h3MaFcCy0PV8bEgCz+ueYlwBRrpY2RIbYIucsbvlJzQH8EWB0jfC
	 2/0Bps7ry4aM+VuYt/fBGgaokJTboar2ZKbAsA/jZbWFwOGhM4zUrkDW9OuYtLdBVEnup
	 aUZam3zMn2RvX1BGwjQBQATXLIkILhKCgxCKIVYS230j2AB6Myg2z1NzqIv1u7vILSqrP
	 gBgYs4jginT6hvgOVNUv2ejkrUphJ20BrH3fzgypr1CxnKHTL9esxjqFn+hcYn48hzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
	b=RjKaZSbJBagThAH6ef04z+xHdcim3i35KhokEHrON9wkhWVT1Wj/m2v+CqhVvzdj4FG1
	 WzB6EVniOx+3raNU8U29NTWzS/GnE+Y4sJ6aya3wBL47WUBr+UOSY26z6VednMRjHgeF5
	 uK/ubg676KRyMPY9xQPLM/6/Pg2NQvxlz3jsVmwn85mdAxjX7Nf8nN8YQtJSMHtM0hHHL
	 3KdpTzxSSqwbN1TXwYG5xec+2ZyXO4QbWcLIzotlVweeT+Ep2Y5FstP9ZdWFYY7xBT0vb
	 Xh9kBRBdTEDsHAvp3w0EGxd85drenr8RZA0v9e7cDBGUKqqqSiFiIxYdBd3wdhZVDOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S3Vw1Nu/";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17810606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 00:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17810606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3Vw1Nu/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso69545f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793750563; x=1794355363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
        b=S3Vw1Nu/FppcBaS3Qvw6U5JmHn0zhK/FM0VrI/JSwsDkFBT/vvY3vheYtkNv817LbK
         ciWppLK/mw4aILC1gksjwqYF7piGXHNWXbdiFg87w+YuoZrfWQmR0YbrXJYC5SO6RG/d
         4WjcNz+T4Z9V6J7edlkrnuU7fMqHMoca+sQdPW9d7oxfK8Ze6qyQeWPb2d7fVrLW6wfI
         sXe4Tgxo7ueuLhUE9izZ9XRvLIglpccZw3xXy8cbA886T+8ylxyN2/xmegLJEmBribBS
         j7Tr2BVnkiqAUd4vSeneRBOxv095k5O+XJRWCsWCjQTYhz0TzEMZvyXYNCWDYdvPbPpm
         anxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750563; x=1794355363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
        b=l95YbYSmxUCGSnQkzonvv8rc2FIECSffCFDGWptLq/bW5XN7ooDMNTcg5VJyn0Qzyn
         30BS535dXFhtlhAsdLtla1Pin+ouDD6OmHqQr0962lISo/699pN/sZcZneFYIykgOQDP
         3xEH0PpeKlYvZGmKDwYJZCnIxKAx89oZp7nAvvnPUs4ptubtkAph+MJYm2Sk3DsuXkf5
         j9AZCkitDvjsfC9+V2rsbv0vfkcqRBMlcjl9zXf1eKpOfe6k6dsiG3TlcdOQaEY+xN66
         T4mZmyR0R6bCDaBuyHioAbz/n4XHHQOmzVE34k+gdDjb3OKrOUU4M26jziEW+ZAQnzJ4
         mmvA==
X-Forwarded-Encrypted: i=1; AKwUvBzcSa4dXfYy9HFvCP4BNOQyR7et3S0PFeg34t85j94dpQcg53QFoWTNipMh1z75yzEf3rQu0P6q8rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hS5Xo2pQ/fIBdR15boTou/4DzfpsLextJOaXNcFVBLOyvWLmb
	YOyMzZIqGkasAsBxMIuIT0510SRJ6UREEkVCLK8/vuCoFsF+5gAVgRw=
X-Gm-Gg: AYBFou1VTQWWe0fnXafjETG4logXlpVppXlHtBezjygWfeH3in1KpUYiY39LQFUI5Xt
	90FkoJQG76dYFKY3HZ2CyvqIk7QGI/+064qHAkOHlWeaeHP+WJwAWZ+QtTrBq27YBCl2xOFB6AS
	QgRBCDzL8N2V+sbkcSyCLOCTOlCRoq6VSDIFs4wCjuBhUtqCrzSQhhdKOGfJKaH6Gq2It1hsDJz
	HDNztCKyy5D2vOlVd/NzY6rk+B1TcToxa72jdT/AIDTjDze5whHKED6E3/Cp3LL7dbIIGKuXPsS
	1vw3Sb9tjv8TrLkI3Ret2qCv0xz95uPCoB969t0KSr0Q0SX0TvhrBBTDthIjgkDzf2bZvnbYkDv
	/6cB7BtnNp59pXicjeO4wzYYjiZTHc/EvQNQth7iQYFScM9Fq7lK3Wp2n69a45/YlPgwfPrXHC2
	Es9nN/1U8/yft89ls7CGs8zCB33knU5+9gWbLBI6umRzGOPJc+7jSrM1YVMs7SFSyFbBiKHRecL
	BEmhI+T4WlGzgLpK9iaVGJdm3+3kttwmHU2OZb1pQW29nkiAnue3qJaxLyz7+3tKafmHVJ2fMsm
	SaLlK6/YGarfigNuKRM=
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr34358784f8f.51.1793750563327;
        Tue, 03 Nov 2026 16:02:43 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm714193f8f.19.2026.11.03.16.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:02:41 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before freeing audio
Date: Wed,  4 Nov 2026 00:02:39 +0000
Message-ID: <20261104000239.2798131-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

f_audio_free() frees the f_audio struct without first cancelling
playback_work. If the work function is still running or pending at the
time of the free, it will access freed memory via container_of.

Add cancel_work_sync() before cleanup and deallocation.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..a9807697265c5 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -943,6 +943,7 @@ static void f_audio_free(struct usb_function *f)
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
 
+	cancel_work_sync(&audio->playback_work);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

