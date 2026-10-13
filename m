Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1A38F92D
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876827; cv=none; b=cujQov7zT0mwkEMxhyAqUct1NOHRfHlc2vYbIDlHLHOrBBJ65UAAxzZvpBwBpAc1r+ErJkJgKSKbLSF5NDXQ6R6JWKB6Apdxv762h5xuJHlNmzbqMA3ZKP9Uiioyhx7gwJWpvRaa+xpazv3yiEont7b7JXUia/Pn7A9kajmPl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876827; c=relaxed/simple;
	bh=yKooLcN7CHgsaZDkbyO505c2en4X/luvbmOSMQrltvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q83blz3tNYWMmwrLz1eKSTBWJsLSEAjHKFQOW7T3YZWP7fs/GFX0b9/ZjJXLlQxYvetPcySJS80Y8L8wNyJ0V0S3rTVV2AeANxDQMn+0/JK5IScmBC6/bx6o/vDSZUPzlwb1mLyeoPm+bPtFZCt2IBEtO84DDR3VP2Xzx8KGk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=qJxWhSZi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="qJxWhSZi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1455668a91.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791876825; x=1792481625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=qJxWhSZiO+8phAUlyAKagE3JV3yDtbaW6oDzkWBGcpkwC5/0Us9sq6+ITm7OZVdoqx
         Q2eGdJn57hMEy/RqMqszT7uXS80Likex/j4xbxDiX7k6OR45mFN3hrM6Vic6r5hxDvjv
         6Ywp7Q55W64ArZNZw43k5xb3GGgqEPeYc7v9e1L2N2Dj77yQLxCHtXCcnqwXAK48F3fJ
         Pe5g2CtLwVW7f4O0tqi9fZ2LmSgwzNSMWmuHUycfHy18Vv+tR31bvcHsWP2ObI7WQ+o9
         nJwsqick/lnyFB+Qq33sU2Q3rAC3I6PRXyqzgFzJWlJRU2nHbToo5nUjLY0RS6H8kv3k
         u2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876825; x=1792481625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwgbOTwZS+Wdyws/KBJ7MPJ9pBsymYg2xZOg5DiPzmg=;
        b=Jn+gTcb00lvTEKHtpKGTooEYpIRvB/9Ko42wcIVKT40lq4IMYdXsFrHh0yNsYrkQ1O
         V5VywLbcLgTQx8orrFcC2cFqJo40TZhxsJRRt/EEEyVRr9clnu18xAqh6Ewd6dCrDIXd
         KExd4uZIKHSV8IHzHlp+uXk+SSvyV9AX/avYlgP+kxDYuhRTDXd5yf/U0f3Sbh3GOM9M
         B9QvIS2v5EFrYuyNv93+3D1xrhxNozFSmakEKw3bocRJlBVTAwsdcWSZ+JuszxYvQfT3
         SsQmzEvHD/mx8wVMHxitnwjX+JICViEheXwefkq8DsHUSe/R3TfEI9PZ4JUkahpbzCGp
         IBCw==
X-Forwarded-Encrypted: i=1; AKwUvBwC6VBhqbuFoXH45AdDIRDb6EA5esSl85ULXKUKNHWWfxwwrWKjXTws8+/QuKsMbgTqSDdOLPN87XE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfCJAEYd8DDfvxyIy7xyFW6iuofhkFyEvv/WJHU+SPKHVAF+uu
	FSsjdhGTtF9y2SmsEGdg0UD1YJ2udHBUyFqbtVLmy7PNtwMtDcWBq+itpPfaz/VFbrAdnjpHfDX
	w1FEzhriHyA==
X-Gm-Gg: AYBFou14g4saVL0cNOy6xwvAE1OTGETV1Z/2xyz0D9r/RKNb+ZcXLbbRxypkmsglxLv
	d9yh05EDNd57Z2MMR12mPhvB9ZHcCVqQDJWdvuGLb7omjigMK/CABIx6T4l2OxIC9Y+A7PLaf0e
	CaarWJs9xDI8ofV27kwYrmebLgRt+xnTqf1ogvNxL2Lt4HLnzq8+QW3wSdfZLdS1HjLT9yGCR8s
	vJrcgjet/lsIbZCzSJPuXfCCv20aUAyVPby37evHdmLgAUxuif26LWM99J3HRMEbRqJl477oTFa
	Mh70KxxyGtlojlmI7jpczFh7pgxLgILh0C7Gt/mnM3Xms8nnqFnpL43lpE/y8l0XP+/vtEoZ3P0
	mMyrKfQEnh+aw+037YHXinyEZW/qH7y1A1xqXGKLdAZkO6cLuV2IkIRMgMPdS7N5wvr1PhxwEIe
	vHiNwrncu12qyFYcrXk7ejrDnT9OgUXALVeu5WofMdjFBJ/02kqBqr8iYKDa7vAs+nKgts60Ws0
	4y+sQ==
X-Received: by 2002:a17:90b:390d:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3ab3a7a42bamr10025027a91.48.1791876824559;
        Tue, 13 Oct 2026 00:33:44 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed0daesm19973923a91.5.2026.10.13.00.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:33:44 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 1/3] usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
Date: Tue, 13 Oct 2026 16:33:26 +0900
Message-ID: <20261013073328.2936318-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
References: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
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
index 9e6d4f39900a2..12e2b20e33b92 100644
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

