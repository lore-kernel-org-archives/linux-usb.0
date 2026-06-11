Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE43A3822;
	Thu, 11 Jun 2026 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169198; cv=none; b=YhuTCsBiqlDcNhkHUrJ+GkowgD9NL4S7ZDgRgtPvRJTGoGJrnU8rYIeQCX/LeD7B7xikk1hjqJKl2nX3D4QaWrwJ0bDCKPW0ggW/Ly+0SKhH5XnIY/5XNAUPn4HZV3ZilBqhjz83HTrgBCUI1GkGazASXFR8EENvGd6YfgYAGIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169198; c=relaxed/simple;
	bh=nf6hiQxhL56ykySXrrQ7KpfEd8hhHsWz8VxNtGbc3t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhXH5VaTPnpp57gFJQY7HerEx+QwUjxryJE4nAl5/L80WCDab8IMSR9bXaywXhmH2n47pMTnimaiUGsMhHop+1F5ZkUrVKkXkfF6tyjqITI9TgIQ6QcrqubG0UvZ+u1CAx7uYzzhJZgqP9oebgUoOIgrqs1cvbe5FyImtDfCPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=E0zxnhOG; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="E0zxnhOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781169168;
	bh=AikMuvne+rRsGF+LJ4+mCppYa54CBBNcqj7vmtaZezM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E0zxnhOG7ypie7AeYyVusODqABiXPR6bHF/VrmHSPc624rtzRnb+SpVcVg/WZKrTk
	 R6h+6u9p7seyHxODx8/ZFSsGiarbsS6RrCl+Ke5/fwVAFShxN+MfxhL8Ks81Yhgw8t
	 27cOhFgaxQazjpLkt6opsgh4okU73jKg8IrKiCeg=
X-QQ-mid: zesmtpgz1t1781169153t1392ddf0
X-QQ-Originating-IP: XYhb5sbAd8pO4x1+zCEcXtYBIWsMOt2TXK/WVLkDsvQ=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Jun 2026 17:12:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10329221507153104627
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	raoxu@uniontech.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: u_audio: clean up capture endpoint on feedback failure
Date: Thu, 11 Jun 2026 17:12:28 +0800
Message-ID: <183621D513E0DE8B+20260611091229.4017443-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MKbpLBOB35npE4miqycRKMZVdRFDwwgXDvnCR7SEIFwdVPE27VLmnAbN
	frcx/fJGBKgyVKEpJ4ukiGCP/qlPjAaxngDBZV+PGKopfshRiU8Rmsyy5zxat1y74EcpU+Z
	bZWIfdXnahx/PwaLhr3WrwWpelS4yjEP5SDg6PXMimZvbDx4Veu1M5LzBDIPmNBuH7xnBg9
	sMHqJrqUpPJsNewLKTI/LgTvAAZtQ4fS7qrtZ8c6Tl8Km6cYKds+NDrACmeMqbKKDLg/gGU
	mHtCUV5IfJLk4jnRn2WcJleoMqTjU246I3cT8w8TouHQzr/sRQC1OQXeslOvK4nQAvmGvi4
	LyIy7wiwBw/08PidcXt9LWEwSeOg7Mc63smmyUQ8XjruOuwq8qhbWZJ235nIWJEmyUbtHJ/
	GOwnfLY1xV/2a9Z0JzugrBiNtvF17WOmZXpAmcayUBniS9dnPU9mJD6bjv3dlITwzIOMctz
	YDxMr/IB4s8JTup83Q0vLowr72xS6ZLGxq30pN4wChRZsTixu7Q6K7H8MCTIKPhPZoMw2Ol
	HHPOj69cHWzcehs16U4fqXIN3wA6RmcnmzvpzTS+eO21REgt41PpLBs8lZ3zzlekU+gDU+I
	mVS5axslj4IEC53wwSlGmNCB0w+xdL4/R8yj2I4hUwVpSSTUxuwaKRw/0xDyxoObJZseGky
	BUTQIGxvDYZVrcdcUpPiBENJ6qzw1759Y6pX4JlBdta4S4V6dotnNqpoosKzAtvahXDZaPW
	bTrnvEMVwWwEozsZFc8U/JCXFAgtml+WBPAuIM5NI0e2dTDPLFmCUPXxx1xYpjdzTVItvxH
	2uOye8mTJMorA4zCdoLARM049u+/4UZ+oij4yqXxn35SUoEaDnMetJHplRo6vsCPWBvEgpp
	GR9c78bpxipDqiYb7+qMccbVLqARdGnlUzbM4HLHH+ZyfzcJPtLt4IjQ/B40w7QD3ytpc/V
	0Q+ya1zLhXo7i4mGJ+bZXD8QfHW9PLTD9Js12d1yuTq0ZQr3SdN+jv5DcVNXylZ4dyI6kMZ
	lIHT7UF3NQbG98xOqf2UWH8pwAGi37PXz6kDjuv7NmbyzCwP26
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

u_audio_start_capture() enables the capture OUT endpoint, queues capture
requests and marks the stream active before setting up the optional
feedback endpoint.

If feedback endpoint configuration or enablement fails, the function
returns an error while the capture endpoint remains enabled and its
requests may remain queued. The current code even leaves TODO comments
at these return paths.

Unwind the already started capture endpoint on these failures. Also set
fb_ep_enabled only after usb_ep_enable() succeeds, so the software state
matches the endpoint state.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e53f2927b539..ca26bf9c8040 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -641,15 +641,15 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	ret = config_ep_by_speed(gadget, &audio_dev->func, ep_fback);
 	if (ret < 0) {
 		dev_err(dev, "config_ep_by_speed in_ep_fback failed (%d)\n", ret);
-		return ret; // TODO: Clean up out_ep
+		goto err_out_ep;
 	}

-	prm->fb_ep_enabled = true;
 	ret = usb_ep_enable(ep_fback);
 	if (ret < 0) {
 		dev_err(dev, "usb_ep_enable failed for in_ep_fback (%d)\n", ret);
-		return ret; // TODO: Clean up out_ep
+		goto err_out_ep;
 	}
+	prm->fb_ep_enabled = true;
 	req_len = ep_fback->maxpacket;

 	req_fback = usb_ep_alloc_request(ep_fback, GFP_ATOMIC);
@@ -680,6 +680,12 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);

 	return 0;
+
+err_out_ep:
+	set_active(prm, false);
+	free_ep(prm, ep);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(u_audio_start_capture);

--
2.50.1

