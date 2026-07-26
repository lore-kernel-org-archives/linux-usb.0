Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614B32B118
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785072219; cv=none; b=dmkuGHco5DIayqFhReEfA7subj7XTciSAu9hmh73UwEjPWNxiFh/Q6gFZwyp48vdBmorx8oWCJS2ghHX6ZK9oGP/RN9pAy5gCVU72GVQMFGN+5jx5LG61onobQncIliIesY3MEmSGi1ODsV9nfDVdyLG6x7G3WSbdRA9GK7UH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785072219; c=relaxed/simple;
	bh=98xmMfFvolCVIJOp/NbDI8DPy0x63kxjr5+u8qKjbG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=br0UG92bhCSR+bIiA7HFSla7iDhdkHtvmtfV0Cocl4y5n4JJmdl93KbCLW4O7rYRfTKlRutQr2LvQlMdUaHEJ/OciO0HqFtA4sau3jwgIFUexHO1GlzNJJopYL+DVGEGW5y2j5BPSGCb+oW14qJ97HsU19CpHfw2/8NmStVznnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cX5S+NBo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cX5S+NBo"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso1905754a91.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785072217; x=1785677017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fompq4KZBbcRpS6b4gUBu00h6u2Ol8qMiXNV2HqKzL8=;
        b=cX5S+NBos1zP1/4NKvwwElpEKdMkKUVYzwKZmLdDYBZiAeLeb1l1BVnFJOiA6FmJ6t
         7W35NtVjaDwYcxhQJuYNs/AuvMtvlDSkuAVK41qYju5SM/WzRc5wbhqa0lWanZjTG/iY
         NhtAQ3/gAdo6FnNuGTbdGZDD4BKXuXoas0YCrFVcm/ZoeORVzzs3T1CFurnEvc4OxDfM
         7jc3xW+b19t/THV+w5ofum9+VkBWL6miSHqOkKJsHqMYY7731A7mjiON3rLVHjQ+U0Kx
         vviMRt87GKQXMqxoHFc8wk3bAixOqEcHoZAN/fMIf3/iH+bt0CNLq0Z0oiDvi9qG84/u
         P8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785072217; x=1785677017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fompq4KZBbcRpS6b4gUBu00h6u2Ol8qMiXNV2HqKzL8=;
        b=YxkFoIvRAkTzaG5cXNGzR29nCPrafGtAmK6AnPFl8v8w6noY01cnOY/lbEVLvN8QIK
         eyDsn+YnuyWoMdUyY/N9QvtSKPaHxb2u+d2xQ51PrI7fCOcqecb/F1ENWOaf8MA573Bs
         ABm03wW9aLIwnm5FwISiBdKCxoxz4LrbpS7t5KU6vml4PLInRqqy3HRudWric1lS3up2
         BIvFCejSXZ5swxUVG/zDAezKiuHKtX56s7eXj+x8jn0YmT8VhUo4xiTZ8+YNiBNHZpUz
         Ma0ZI0B93YXZDqhSHSc6wN89yTmlV3MjH3xAp0KFE74kLGTl02gPAwgNyiVvUeeBFigg
         KLjg==
X-Forwarded-Encrypted: i=1; AHgh+Roe8jOMnhrBYoT2qsCJsLaAvw1YdtG8H3twbWYIxGLiJkDCp8IbglC8o26rOKulyUHTpiG/MF/Kh9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW4nIvku6hc2UAq5Cxnupc69ygl8KPA9QPX3G1uOYC0zcTx/CB
	0f98Y7yIt9e+lJfMWsMQrKK4lOG716GM4ihiHBvTV6QhDhs8wY9XDCWv
X-Gm-Gg: AR+sD11XiKpjkiW3MqvpbwY4ysYwgfRM0fXgl94+5hCYZkrjo9a2628TlSNTF+jAEDY
	EIErCvO1ecIg7UjlWskTu3VPMUZHyrHnatQMju8odha/7segKlexK6CZRHWaVLt6ZRBsI5gkKI1
	aun9rbKEBktYcoWP99MJTkvKYBXc2FEkjO6yQWpVldfKOlflQ1ICy69ShwY02EfhCaAAQ1fWKM2
	XPeajhr2EGQV5sngORHz6uPvyvF9g7jqUMuvflBtcru6+vHmHmsuhKLLNIMXAWXbOiSZhyynXMB
	HfXU1tIKmXCUVUu0RosAz8GqBFfkhqVbvcbf9ehOMrXoxUmEb16mWcGfLUZ4zKXs4ghMeUl6nE6
	rLwaGx/V97I9THPa6zudGmePE43YrWWSLkWfNFaiO94ahpsojSq90bBJM3LxoijeDmJgT5urr94
	nP7EC5KOm4RvULBg==
X-Received: by 2002:a17:90b:5625:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38f2963ce06mr4691503a91.28.1785072216761;
        Sun, 26 Jul 2026 06:23:36 -0700 (PDT)
Received: from Linux.bbrouter ([115.96.217.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm20784436eec.11.2026.07.26.06.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 06:23:35 -0700 (PDT)
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	nikhilsolanke5@gmail.com,
	Ishaan Dandekar <ishaan.dandekar@gmail.com>
Subject: [PATCH 2/3] usb: quirks: Add ShanWan gamepad to quirk list
Date: Sun, 26 Jul 2026 18:50:39 +0530
Message-Id: <20260726132039.28330-3-ishaan.dandekar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726132039.28330-1-ishaan.dandekar@gmail.com>
References: <20260726132039.28330-1-ishaan.dandekar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71 EPROTO error during standard enumeration because it expects a 255-byte initial configuration request. Add this device to the quirk list to use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.

Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index f5a60ccf2..97b1cdf0e 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -592,6 +592,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x2386, 0x3119), .driver_info = USB_QUIRK_NO_LPM },
 
 	{ USB_DEVICE(0x2386, 0x350e), .driver_info = USB_QUIRK_NO_LPM },
+	
+	/* ShanWan Wireless Gamepad */
+	{ USB_DEVICE(0x2563, 0x0575), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
 	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
 	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
-- 
2.34.1

