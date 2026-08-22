Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8833AD85
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 04:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787373293; cv=none; b=E5Pg+lhrOHvDHm2h7hQe8pS39x2t59uJlNWMhHd7CafuQ7ugVnU5sZ3lq88KzwEXgczogeCR1SpBtbQe1Rj0JOaHph0wKUxU+t0m53Zlc/+HuZKQKCGDDIQWtlPm8ipFyLBxVDRx2qbMWgpj43+tynOajHMFBfYmGc9V3UWCopI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787373293; c=relaxed/simple;
	bh=OykwwsmFnAU+OJR0KhEgDAKSALRs7bJWiwVKrggZVEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=laf3rZyyA5nL/zRcXuG3KWbPcBPCaYayyMaM6fFukxky7vJR+ZyrtcDvyJKEU+ocGYHL1/nIp7hQoud0pAJQJQ/TS8SomiHx3wu5w7uh/LSPE7KZ19tBZvr0KGIupAwe4NcaNiUaj0A6Sh2J9iZhOG/1j20vTIR3ZpRRKiaA+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhxjnpDg; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhxjnpDg"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7475a4f8b05so845708137.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 21:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787373291; x=1787978091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Znmg4yBA/yhatNk9dpD5RasoIRDCZ51yf8CIDl/7kcU=;
        b=OhxjnpDgdbExwkpeeY5UzJdU3AbvDvF05PfxTWzvEsCkIKR32hiFnFVCz6icFeEniV
         n/GJIfzytyewX6g6X92pD/ujKN+McT4oSUT8cCDQ9WIpf65FotpGl0PaZ3CCF3wOe41x
         eKimuMcyJmdgMB+JK4bIFweL1zfpK+XgN42jSeBVKGIY/UfJR6DMAsQR3HIPpnJrCW4e
         Yb+OvvX86vJR+bhls5JdOKvP0dtwaFLAjS5/F01Jis2EmH62eE5+IBmhCJ9VLkyijfr+
         E3unJEQzTcexgutXouevAVG80CLCq2+NAQRgiCjv3oGkI6FQitP/JKiWc6sGXMJM318r
         otiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787373291; x=1787978091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Znmg4yBA/yhatNk9dpD5RasoIRDCZ51yf8CIDl/7kcU=;
        b=eYdi0D3obxfUvdR2U9p2a9MOGuEZbzi3KZbDPFZpLPtpZF38grwDWoszCcwM5ut3WT
         zBW1ILXkaZbnO3rh5rtGFnInssfqmTxvTu9ufHlmjZqaMu7NVah3rXZZxL0fIbX9uVL4
         lra9upQpibKZKMZtPXQaK9U6UqEJGn15Nw3N4IAiGNvtR2TadweDjf/fOObSGWWpXAzV
         R2zoQfoeLd2SQve/0CAAcRPqJ+JMe7I1eeOt6di5OkuCN855tg1vkRuo0fk4dV4oeSEw
         9y3RbpW5be7vlnp0Brn5XTgTyBwrO4kDAYazAJLT6gZMPwpdWOnxvCLYCXYvD03cHntT
         v9dA==
X-Gm-Message-State: AFuF++kLB+SlciOyWwezC1I8J1zow7/0alq5V/le48868RWyQUIWMX0G
	k5r48G0bM8FjSZMuHM6CtK9YtPZGYrbh0pwHtwU4f6Hq+iw+aiqO9IaernE/upZIavk=
X-Gm-Gg: AR+sD11HSom/7DoQKjoBJdwPWlGDIdsk6pvyLS32utV90ewhWNLAt4f0VaeXUvhazn9
	zMHIxmTvDGfoaaWjHTwIcsYqvg99MiKI9pargiFt9cJLatbDyfdsjgTliEEBeAnVLL92nPhmbHU
	Qkp0oajuYQGrGs+G22DPSm1UTtdZf4ChKTVfjn9plnUd9a40VjeS1pW71po3lgvNmBwTtqGmP6x
	2X84F9OV/Vf3ZpoLg9D2kDfUnw/RW9RKzYKvL0uDxFQ5fI7b9BNWbrD/lHZDPj3i814KVepx3t2
	SbZhs+cXjt7pcrJpzdduMKz8h3Sycex1eCNXvl4R2rbxMpHZLnryeI/EKvVbX3n/LmAeizDk6yS
	Jy+Ct10InYHHCebMCEapGISGLPQyuqm+qr8U3MfA8qZyB2ejuZLJy5JoG5Gffa5mhTV8tCDvlNg
	n9ULb4R2JWxVCE6LmgXGLGIeCjoTSPQ4sriGUYw/g5h5L5/zg1UVA7h/AIwFkp2aDsZK4s6GMLE
	538gXBagPVbi8qGOSyJk0abqgm0B+4nKV3U43sXHgq02eUfah/rPn/+Ng==
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr20672513a91.15.1787366942711;
        Fri, 21 Aug 2026 19:49:02 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e496a27esm1094449a91.2.2026.08.21.19.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:49:02 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Sat, 22 Aug 2026 10:48:50 +0800
Message-ID: <20260822024850.2504871-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadget_bind() allocates an ep0 request and stores it in dev->req.  If
raw_queue_event() fails to queue the connect event, the function
returns without releasing the request, leaking it.

Release the request before returning in that case.

Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac..33d70b552 100644
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

