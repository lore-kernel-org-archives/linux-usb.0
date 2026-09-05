Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687F4CB8C4
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626715; cv=none; b=SQcrTdA5MQ7+wQiidi+cTlKWM/8/ytjFJABjBtzQ2pbBFMnan220VJWXGMJo2r83Q/sLMQx9TDJIeK3KbOSjdpqnf/yU/jM/7Q/Zwwi2ReRJ2qJC/D8PwSEFLF8qsPlaxuI2LiS+SFsZw7hiPf1HpA+IF81sHCeFAN1EeMNqMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626715; c=relaxed/simple;
	bh=zXRC/RdlmsiuexVeqwFjarsu6yZ7PSNCPNwsKWzg6EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzYalsTw1qNgGs/TGnOpGM3cOFyzSaHLcJdrP41SQG0a/jFzwBZPyvS42dLZOI6RNAVD0fuLAH1acQbFgjAujhhWR1ArGwo7ALFJsu38YpcYj/oOu8eJNxaV46tIK8Pxdnt4xBJPO3gL3Q6K0KMPp+R7mPQ6JdP6nKaJju8y8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV7CslGA; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV7CslGA"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90cc107c451so13570276d6.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626706; x=1789231506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iebef4UkUnASKv8XcTx3vwRMvhVbFEWfZRLdXca6h64=;
        b=VV7CslGAVnHj0gm8JK0n6CeO5ODOlecicnnkvks3hTB+JxVBe1fVZlpQaFnY6YnL5b
         rBO0J4TR+BI8nfs9yAGodxNqmzezpUyKXHfFLDUyxLy6H5j2kFuBTa3vZDi9VQTLYTUm
         dFbv/itBx/dpP6fWRtZ7GJM5yA7wKDAFqXHVz7UQOffB7X8VXv0QZD6bb0PS3jE4IPsi
         2+pjaDDjAP8aX9jLBAMGSnp8qAtvnbRsK0xwpXvKs7RpXcwmp7n2uik0L1Vmk22kNjCI
         ZV+PHKzxFxW8bmLE20cPmR1v3qdJbNj8Cx+xoCjJKnS4gF9XZKIetdjUOvnfy8a/vuHx
         82MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626706; x=1789231506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iebef4UkUnASKv8XcTx3vwRMvhVbFEWfZRLdXca6h64=;
        b=Q4MoGHfPi7SS72s5m9FdCkaTi/5OVLHzAlrTSc3Y7yr/ARF/Navel0M26dzlGXFTxv
         3TYM3kQwmChWqTRwftcFRJlEO7v/P9uC3J0AJ4WMUKQJm6Z2LHVFCcOOh+NHJ+ZItFF7
         jHj+66TBjQ3AYXvJGmM2rYJgRNybhViUmuMM3IIS3mJ3aQKHefyF3mMG09qefUNp0pHE
         2tc3tiE7CDThPak4mmOrJ75Sii7NOLvWd6tTT8MHCkeaWpQpdXROHvGsxWvx4aioBM1s
         3hlmGF1ztLlWdeKUEuGKJtmKR3HluZPh2Hk+ljwoyEX6LPX0IqJmbuu6zs3DW2uOXGra
         lexA==
X-Gm-Message-State: AFuF++lPQEC/8uNxN4/+LtNPTVy5iTqs+fcM2fX2siNWdCoE64L+ROw7
	MqggLb6+vcACWq1sdZYoEUklUgqKSqb+ahqYXo7h02sQlRzIpSAxLONp
X-Gm-Gg: AYBFou1wBxQBOdJB8mZFJozpgrFnWiyueFGzJ3VgEdpIfF472lhfgzhVW2hIaDqj5pm
	HbQBgW1MXOcdaqjVpCuCYbia/3/OeVdSI+YLA24EuSwMPsv7RZMq9x6Py17whl2uyeydgng5zbq
	ZY42lf253rC8vXPJOsP2gCVS3lFtytgMKbQh0D1kS+kdLgbCs8OpWCAllUMMbHey+4wIP9YXy/E
	ImvDHPQ+Zdwbhf9YKLodV0fLp3tv3i0u1BN5FojYUgq5JQzzmjVX52Bk8iNGAyvbu23Mz7O7Id7
	tpOcPoVwCZqfSCDrBEwZN2D2P9S9AqfkkChGwhjRLkaaz9LdlEuwl9K71S4audRuhZAuXORBK2A
	+wKxToP6wNnDf9l9kdtHhjb6PnIMdvZmw670KWh0QTR4Zq4RQ1YOJx+yddLaEh0YxSs89ybYBXn
	zpfMy1IryLooHlmK6HacOvImL3amMQfepL1GcClcEUliFILPfXyjtgfkRXiT6AmvqEj1oaPTTcQ
	xY7sBsqVK2kYLFDcKI61ickZ6N5HIf8Hnd+OA==
X-Received: by 2002:a05:6214:4904:b0:8ef:91c5:8edb with SMTP id 6a1803df08f44-9103ef23c37mr177612896d6.10.1788626706129;
        Sat, 05 Sep 2026 09:45:06 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067ac52sm48984326d6.27.2026.09.05.09.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:05 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] usb: dwc3: host: fix dangling xhci pointer on init failure
Date: Sat,  5 Sep 2026 12:44:47 -0400
Message-ID: <20260905164448.209348-1-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aptV-QHKGbMqw1uP@vbox>
References: <aptV-QHKGbMqw1uP@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_host_init()'s error path frees xhci via platform_device_put()
but never clears dwc->xhci, leaving a dangling pointer that
dwc3_host_exit() dereferences unconditionally on removal/shutdown.
Clear dwc->xhci on the error path and return early from
dwc3_host_exit() if NULL.

Fixes: d07e8819a03d ("usb: dwc3: add xHCI Host support")
Cc: stable@vger.kernel.org
Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..74117cbb2f42 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -219,12 +219,16 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+	if (!dwc->xhci)
+		return;
+
 	if (dwc->sys_wakeup)
 		device_init_wakeup(&dwc->xhci->dev, false);
 
-- 
2.55.0

