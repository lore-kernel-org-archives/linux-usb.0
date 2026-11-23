Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413033;
	b=v1bQP8uY9LRJ5zlfhJIBmBbiyOwEvs3vujmH1CTTDWeJDHDHb2w6q4QPVpDktjZHHJjv
	 E657HDxyF8fkTBgxBr4OYf32cZ6xd9XJtIKvnN0lW3VbFioPJGkFtg0oHz7AItlJUKMcQ
	 Y/3+JdyDMAuhAqGF58z2iCXpCJ3Oj+gsJ4gciUHUoVntrxF0zK+2zh0FwR/4mhRSugAxB
	 aiNOHYoqXllxYgyenhrC5+cU1okSQiNgrR/4DYUj/2Gip2jloHGUsvyoC6i/cS8DAoTb2
	 vrQWWsXQA76UI+qnINbw7vLXsF9dhr5oMYYjNC+ymgj5QCWBF3j/cwtSr6KRYttOohw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
	b=PDg6JU/RFQmm/5dFcF1A1V2xj8D3rXulyBuAOwh/7iLDLgwHEi6+TJAq53po2gsadbyB
	 Uja6/NZ+GIKvekN9lK08yTPkBWtylKltAb0XWRs2lxeg6TJfbnvWnuM9O1uSL8oHeBitx
	 PjACw28Y+dNY5+TcxSMgIlONzLcQAAYGjW3EhtW3P52GZH3LZk8MpO0xKBvZKvLHOeYyz
	 kCNMMpLw1WJHqActQ2wRpM4zQsAX9d3RqH/pWu5KeQBQmPvhBCNi8bDQXYwWQQJh+eXg2
	 aLGNTT2SZG0Bc4Gx/0FJcG97R+SFRNYJ/CxHiSLbidYA7pyfQUDaZGqczCz7H+I91Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PayeCRiX;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C34606A320
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PayeCRiX
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f05b465cd1so10466675ad.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413032; x=1796017832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
        b=PayeCRiXIVnHHUvcjWZXeEtBF/ULR0xNyccQGnw11vgZqCiUMnKj+3hDQxUxZICCzD
         6ktY8wUSm7f45XZR1zvi1EKrijmEEHk3+Kuho+k29EBLY4+fGEfo73BCc4Rkusl2NUJ9
         8qXInEtnOU1w4kF7bQGu7QRMj8L/Ktwsa1iZzLYgiq7iVvu5EJGMWBrwDitkYcYW7AaT
         SQo0CNeXSYXtyAojZCM4FkeRjYo4Q/Yi21JKxCVxAjyXHrBvJOSEoqTqULuueE4R0YwD
         0JG4RGRGs+qco2DuuUYcrd+oG8ggOWAz0b0vSkfA9jKL2skyc0n0CBpaT6GZyUU4H+HF
         F7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413032; x=1796017832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
        b=O7AB7jXtUSMv5IYsiQxW4cFF5Gm3bV+ZK4jOAZb+/b3PJgkCrvYM4dYWpyguyOmSe7
         GwPMVQjrWNQf3A8Rtv/Sdgu76UCaj2BMfKbLBgqGykz+HD6uNO9/a8KrFCZYFvjhhRGx
         Wda9IgI/qAgQ/0+b7gGWkI0kqzXNdA8/4tST0ez8ksGpx/NTuYAYYbFNeMyVKLFtIWzm
         +muC61jEh9LK4ayEw6X+KldCmmhs79VLVnewrtgdwqDeK/970LPoBxeSuM4OJVisGcn4
         xYH/PcJbq9sggCL7+ypDjFoPD/K4goJGdi/FPrpr4vm4wCOG71olrZ2G5FntN1WNRcBm
         fO7A==
X-Forwarded-Encrypted: i=1; AL+hErHjgViZb4uJzwMk6+SuPGswK950ZQcorB76xkUiLkCkHXlYPXi4R6T1OwkilnxSArHRGnIINyklJJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/byN1zppg/HCTawRdR89QqiY6mpEcok3qCkVhrb1LdztN279rT
	wuiw5nJ0jI6ueIBVG3wcYlWmmkinztFhnVbuodYMa80SVD+dGE+UpNt3
X-Gm-Gg: AZFdTZf1GAyVz5iipbduO/3MdsS7sb8a/DgpgX4nP2tHxMbOFWYad2in07oB9w3vwdy
	rfjizsRUjhT2AbxV2H42ksqPZsPzegTzIAETK50zDbw6Hl77j5PRFh1SA88D6WL4NfW8xXuuN9Z
	V6ZnMS1pXAEmHE9T3Qhx9oac6W4ilZBSkrDqMJZPNTHmmXLhN1dND38knehk72bBHZPO8uQNaMj
	LN6Vayy0F9WNiBm5eNLT17uy1d0Knr7ibPsyWqTzVVdKpRIhgE7Ez//OnuOX4XhQiytLDABPr01
	zUhc8jVkVDoaNnLDsMH814ytooGGo9vS9mPQaerBYUj4dzOWKk4Hq65NM4eWq0el7j5zEYP8tu/
	PJY95tVF26wFAZHYk9jAP+0r7B5v0H2Ak82BjQTqx3OLbIZhtGaV6U0MWMvGmXtUKwy68jA7xny
	huCiwJ0t3+b1lazSQ3kGJVaG5Sd6P+mfNQ8g6qUqUY4286msic0QGfBaPEuL2EPeeiXQaFhP56M
	RxO4/CjP8bcp6kKCDTPOTc0au7JYuwuo/Rq46gygGTvKh4taWJK4Qc0M8xPYVS26wecv1PlZfVA
	0ZDBh/bbOUVSk3ioCgQ4001isQi7jKcCRxd/oYWVGPKVFsFd3rO92WO8Bw==
X-Received: by 2002:a17:902:d2cf:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2f03f146b90mr99026145ad.34.1795413032031;
        Sun, 22 Nov 2026 21:50:32 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm47076715ad.75.2026.11.22.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:31 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 13:50:27 +0800
Message-ID: <20261123055027.1141887-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112020-sesame-uncut-fc8b@gregkh>
References: <2026112020-sesame-uncut-fc8b@gregkh>
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

gadget_bind() allocates an ep0 request and stores it in dev->req.  If
raw_queue_event() fails to queue the connect event, the function
returns without releasing the request, leaking it.

Release the request before returning in that case.

Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Changes in v2:
- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..33d70b552b6d 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, dev->req);
+		dev->req = NULL;
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
-- 
2.43.0

