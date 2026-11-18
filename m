Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005622;
	b=niBXfMuOgjnx/83i2Ntv0cUhmsMNJzCcF0z60GALfU46zaa1hDt8Nd+hnckVA3yQYzpE
	 LLPUJQ159UwqQE6P9cIDZS6pcDrvZekvo9dhJqL0OAGeS225NUaOq3IzOReDaX0oLgSFp
	 dj2jRudAuA2LFXL5/kh2McoIEIVdDjZnF3BN/M2YRLQraymjI+wsyYV1hVGB2W7aTvHvP
	 feY6+vD6JHHYziGjswDFw/AFS9iKcInbMhi/qouOAKkHFfSz7lPJzqKoqQQ47Zv76G2P3
	 xK2fXDVbanB+XMhggALSMkQWDeUu/jlj1u9O2YscEEjP3atAf05XkKmj1mw2us5Z39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
	b=x+t92YKCSnHaLFIlTG6UiF8AOoLXYB4LOEPRZHBir4WMxBJ9GVTcUiFjuI6tklFgmmls
	 Z4mWepONBGBptI/ffVubRHrKn/1JlIFnm04JTPv6Qlq7aQ0qXB9g2CdFW3kC+9L0F0wMA
	 RFQcLwY2pyYaXbLXCFbVe2OeaWIb1a9Cjq+OMOQHDlv3UeHXIewmPzkIoPrNIIcYQloy7
	 VBWrWgwTVkyqS9FHVG0rvs28c05wfxmNsZ3fULUCUtni/q1RSut7jVWTIlf4/fHDcKQh1
	 afE1dEgB+FLC8Ido4hGKSfPXvmWr8OolzUu8975+/E4eVMBUlt23Lb2puVGb5bsgnqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p49ssens;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF58606A333
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF58606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p49ssens
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1424174a91.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005621; x=1795610421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
        b=p49ssensfNeolb6Ih8IzXirPrigVla/RaZ6YMNBkNmOJ1WnxeYsjKRHCEk3DJ+xfri
         NjkF/f/XmkQtpAFHNLVPyNBsFwJ0SvlYr3W9hdEy1lBDfIKbGKwg8zzxQM6ZjJmujwrn
         UK2nk9/rHDbN+QgBxht8vdrPlmX+7MljZ+5vlp19cqr7/Z+HzV+wsfXdK4SQMND7xhHx
         4erVtxtbbWg01ScivNolsL2hSyDo5LLUbVjV5a2RvDaIZJE8Tv5ckPXTJnQSmXIJ6L4T
         AGPlKP2qUFcG+9ghK803ZXbC6Hkg8t0JCPaXwWY1oT6OmIacKRoVGEsyK63Iey1Nu1qm
         uUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005621; x=1795610421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmq7Af/sM0RcMj+9tuc6VMNoq5IrrSVjtEHnLJaumaY=;
        b=YSx62vXeigFLtrwRcaPXc6rqXdx2NJHby1gbyVT7aQkhWHFS87Gs/86XF76JTpPtQs
         seZoB1kghYbU3MPFBsPhGMC9dWwCdO+am4XJO0c38h3XrAgoe2zr4QH4iis6qQoaA0mD
         8ZQ1zYdeV9XRl39qgNqpWLCcBjEDZ44kt04EP0A15S0+gwRPjTJ8fslt5s8zEsphd/+S
         hsXiMuSvtU+3A4CB/Cm8IP34FRxLkug2kXffsS9SiEK8BUTvK82fM4pg6OZdOdXtp8Vy
         0GSAwDQ5DTJdmmSSsGEXzdePTVLFAYNWeH1IBvcHsjjVru91CFImsPs+i5HU32/MRLY1
         SmdQ==
X-Forwarded-Encrypted: i=1; AL+hErE2zQ5Zrp5U8hEIJT70gSqHiGC77iXIW0ZVsbDmKVolBH/tKZdD6l8wdf08b2iXwAElR9WhMReh0O4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lgl9Fm11RHpuvT6G9YiEERAMxbehMM75fbgrrQ+mPzGuwK0YB
	/gUETvVDI65FbknkVvvjT3qY91Z2ccMS8OYTnOKkXQMgdpxe/FFUJMHiSLKjq5ZzMnqqzVsQknH
	7ZVtvfyU=
X-Gm-Gg: AZFdTZcV1MuACxkj8nGbSErG8JXgJfV9L6xQrY0FwC6nEV8urakqFZWstkTlHaeCWNo
	ekAQZCEAdtCs0I5xwUB+A+2JsR4hYdPYBDmxKnbYEm0hcU8DUko+AyL+Y97lRBYuBLy20T5PyNC
	HfFKDAH1hhn0MR+jOYwVScXW7NKCVoAUDy0YLkMuCA0LP8Mj86i7yuNbhvymVinxYRcFZj8wuoE
	wMm6J3h8VGyY0jPOlo4Lc9xvRmoCsZ29+RownwTIEYPjKsluLHvbCl3lz0+jZVo8Jp/br6oj16T
	CAGjpP+IN5XVxk2V7RPzc5ag9RdjcKU7u2qMKsDkPK82Mi7iYV2j6sFNGPf2pvd2gPjzRSRT71M
	+GgfLXkXRAzCq7Js8uZhwYX90KkyiulALZnpdImEM0Bsu7REAa1460aoE8FspIUo8yExyP95c3D
	osoi5o/Qq60WsIdPUiFlCUBDApoEzFCJFEp9bLHuxjMTPNUHv5tFkHiMu4PkzeW/229GyheBPNr
	1RUsgY72juEzX8jhA/4rTqrCuHbCYe5BmX2KZtc5c3Mz/GJcN/cARHh+fK4S/ajVGtS39fnu7+L
	g1M1lhB0c6KALtrOcoR9YBzLYJiJc8vad4c8tyfW7cdGAwczyiEkd6f2ux77qCJnFeiIfKB7cPD
	7Ym611OS3wASGAANKQoKRat+bxeVsSQleoRbG+g==
X-Received: by 2002:a17:90b:5848:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b3d063dbcbmr1675099a91.2.1795005621132;
        Wed, 18 Nov 2026 04:40:21 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:20 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 1/4] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Wed, 18 Nov 2026 21:40:02 +0900
Message-ID: <20261118124005.2428068-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

bot_send_bad_status() and bot_send_status() run from endpoint completion
callbacks - bot_send_bad_status() via usbg_data_write_cmpl()'s cleanup
path, and both of them via bot_read_compl() after a BOT read.  Those
callbacks are called with interrupts disabled and must not sleep, but both
functions queue the status or drain request with GFP_KERNEL, which can.

Queue with GFP_ATOMIC, like the other usb_ep_queue() calls reached from the
same callbacks (bot_enqueue_sense_code() and bot_err_compl()).

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..12e2b20e33b921 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -139,7 +139,7 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
-		usb_ep_queue(ep, req, GFP_KERNEL);
+		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
 	}
@@ -167,7 +167,7 @@ static int bot_send_status(struct usbg_cmd *cmd, bool moved_data)
 		csw->Status = US_BULK_STAT_OK;
 		fu->bot_status.req->context = cmd;
 
-		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_KERNEL);
+		ret = usb_ep_queue(fu->ep_in, fu->bot_status.req, GFP_ATOMIC);
 		if (ret)
 			pr_err("%s(%d) ERR: %d\n", __func__, __LINE__, ret);
 	} else {
-- 
2.43.0

