Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779550;
	b=N1Ls5PQ0jd7mcdPbTM8FmAccJ8jWplzWfi4qGRipI9ealqTHGHDCdZgf+H9vRWKmXrwq
	 HDN6sr3VhQExvXJPaEhuGB+DyWy02+QA0JoYcneo085k2wYQyCII6k+zBmw7spb5rz52d
	 SkpL3t81CD8XB76VFPysXi5D+sHaNn8xrPX0oJ+e3pqvT+Oz0goxnXMWBqyMwiR8kGNxs
	 yfH0ZouU7pKZxOJTDpIj9eNAPhuLfaKxBIaWWpmpYrhDU4X5NZOxFu4IPef9R9t+7f23g
	 9ztYLB0kdrwGm6Ogh8Co8tLcmEYzBl3VS4MLfNuzUO4ExGi2ZiKyq7LuRGnSkv0YmXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jTqLA83kbkT8YosbSMCS7zXjw/VlllCMxeIzfWZ/V6o=;
	b=IVbENksCU4cRvJtrnH/HAlvokGHnYUyzE4wGniGZUVw/hft6TOJyUE4CzyJz2sq9xUQV
	 yB1iWrt81oHkAa4aamy3YQ2nXiw+8hjwltcJsll5QEYHd0OYInz2w++zj2v1EN3Gounbv
	 D33NkA8+eiNB0COBny6XzAi3FsnV54hABWX2oYXmUtifhQvKhAHs+6AvXjNpL6ZpG/t2g
	 crSq26o+zm97YX6tcmMA9dOeMBGwidbTVVwjG0rl9v0J6kOr9lUyJp7FpTXYSBu0Qa53y
	 SSqQmpJavEL+sgEkcpDzhfvNvMrUeDhhnKSVj71d64CZ629obfK9bZ5urQVgMcmWkTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rdrR6k0O;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB5606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 18:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FB5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rdrR6k0O
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c616c84so88706385a.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792779549; x=1793384349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTqLA83kbkT8YosbSMCS7zXjw/VlllCMxeIzfWZ/V6o=;
        b=rdrR6k0OlUKzqPxQyJiYbBnrQkgZ+qohSF3KF+C1dXPgNSxeScZEznfJ+TibVoEKV5
         to9TBc2RzIOWg9K9asy1HxWi9y3AQFTbqMbHsUgiISJOqSttA2M3xodgm32bJotPTKIT
         YUv8m5jyEfEgZDz6UQTmHlBqu9gb0sYxWtK7TUcXYeOC7suawnsVYjxz/FqrVvCfCUkF
         bS7ljpyDKT3gS7sE0G73EqWq+QvmHHRGRugfFYQ6YC/PuV6QiWY03BSXx3+mS3yp7PpN
         644Okg4fAmu9mjV7aMfThJ325ww1rMmXRU4V73huK1nZNYrY08LYNFSsBOa60Qz/vMaz
         hvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779549; x=1793384349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTqLA83kbkT8YosbSMCS7zXjw/VlllCMxeIzfWZ/V6o=;
        b=D595LzDE14bUODv3ryNixf7bkzRtnO5CRs1PemBQncKFud2b1dAs8NNV0vdVCNp/YY
         z0J3YBua0CGhrZC82pa9mLSpANP5h+Nnnb7GDqRTVU1AAetu4G9kFnsjL3PC6gJ2cTvg
         Yf5IQ1tDm6j4YMXvD8m+DKS6lDl0LdbV7Lx9ystJcoKBY69kK5gpnftcjD7rs9dNMV9a
         HO77UPx0dPip7QGz9nYkBTlcNXfqcPj7M6FHzNF5HHv6FNoQUQwe7XyBTotYpFTwIUIF
         UDbswcAdOS0+6kchpeENalZ0zrvcFiN3i3EH7Hou4FPMulQXrOOGqrLjSAM49YfAxABH
         kJUw==
X-Gm-Message-State: AFq9FYIlvW2Stz6bIoaXt2aJuegklqhRwSP5B78fTz5gz9QQWnDT9x9D
	oVxOR5Z3dBE9yfiA9DzASxFt1GqkmNgzQqpzfKjyrpUKhZEZNnlMyt4kUPRZhuWw
X-Gm-Gg: AYBFou16r0Ve1ugUFGRBjaOHvg4ZKXo6lNvGP3rx8YT/uIgxMQoJqUXFOaf97wS9zEa
	ZJMJZIceRW6ZBY3KKSCQO91s6cdF4skBsShkRvcKOGcoiVm0T2TOozp4cq5zeAeT4tejW3TuB4t
	KO5L8iFNUixq+GG9kSExdV9h5/XPE0Yh+yev4Pw/76yNOe7KnR2vshrFRZIOssJvhxk4Nz35UjL
	25Vv3+zYrOB2Ih1mFebg2icCkwod3WO2kcrWdyfkTfNhajJr7CoPfGAyG7I/CIFHv/wrjW+TCjn
	IQGUVRZePk+3Qo5tL8mbJi2GU45Au4EdIutZCFzLsK5EDkAoMDBmI/ddpvScJazhkUjKkSWHg5r
	4Ps7NHdnmfsm1sQYmK2KOEtCBmmTpzgfzkMVbF6lnr8lLKc8J4YhDMHtUrINfRCiWHX2PHe2D/8
	pcOdrfaPtmABY5SGZA1srJD03XRHhZb6kNZzN1coehri4pia4jQWw1OtBt+/TYf27RF6XyN+v78
	hkNtN1h9nkV0d9j2p5dGMQByI9sY1GWs9csgs94RRuHZ+6NzTteuIjPnXBkei45uvJqZMWS2dQL
	TYC+3MZN+g==
X-Received: by 2002:a05:620a:439e:b0:93e:acdd:acd9 with SMTP id af79cd13be357-93f6f79e2a1mr550689285a.7.1792779548875;
        Fri, 23 Oct 2026 11:19:08 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b1c97esm80339485a.30.2026.10.23.11.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:19:08 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: linux-usb@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: isp1760: fix use-after-free when kmem cache setup fails
Date: Fri, 23 Oct 2026 14:18:57 -0400
Message-ID: <20261023181857.114054-1-shuangpeng.kernel@gmail.com>
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

isp1760_init() ignores the return value of isp1760_init_kmem_once().
If creating the isp1760_qtd or isp1760_qh cache fails, the error path
in isp1760_init_kmem_once() destroys the caches that were already
created, but the global pointers keep pointing to the freed kmem_cache
structures: urb_listitem_cachep when the qtd cache creation fails, and
both urb_listitem_cachep and qtd_cachep when the qh cache creation
fails. Module init still succeeds as long as one of the driver
registrations succeeds, so the driver stays loaded with dangling cache
pointers.

When the module is unloaded later, isp1760_exit() calls
isp1760_deinit_kmem_cache(), which destroys the already freed caches a
second time. A controller probed in the meantime would also allocate
qTDs and QHs from freed or NULL caches.

Propagate the error from isp1760_init_kmem_once() so that module load
fails cleanly instead.

Fixes: db11e47dd7b0 ("USB: ISP1760 HCD driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/usb/isp1760/isp1760-if.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index a64190addba6..bf33289bfcd4 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -274,7 +274,9 @@ static int __init isp1760_init(void)
 {
 	int ret, any_ret = -ENODEV;
 
-	isp1760_init_kmem_once();
+	ret = isp1760_init_kmem_once();
+	if (ret)
+		return ret;
 
 	ret = platform_driver_register(&isp1760_plat_driver);
 	if (!ret)
-- 
2.43.0

