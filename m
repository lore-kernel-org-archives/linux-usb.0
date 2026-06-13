Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967C2FE060
	for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 23:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781394722; cv=none; b=OAYV7ov3pc4mGt3LA16eiX/Ji5RfGDiuiOWVCEvtq+uckWudSTISWxQT9bUwfhW8zbtZDVUXsAztOExEtpzy57NUzsvRXWw/CyjpHO84Z+EwnE6MUHbPk9MrsJifVCYifDpkGIsNyAbkw7LCB5jlIVB0Oo8LSViBmekKV4ndI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781394722; c=relaxed/simple;
	bh=RYAIiHj58ERZEHSLNjDFTbW1jFn94CqBXziAJ83qc1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T5hxqCWX2iSCMtRasxllBhmg2zDo5gMTtsf1EOZ7uX2Tw1Y1/HIpY7OW0M/ulsG/D1PDmtm8Evbe3ohWfQ30b26T/Gd7g50AdYYSQcYWtI+Nf7T845sc4A7G6rFoQKJZ/ps8gbKkNzH1W2f69EILGwudWH5exj/Dzfyc6CbNZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixO5vrm3; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixO5vrm3"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304d8362a58so1658214eec.1
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2026 16:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781394720; x=1781999520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQNEZ4jBfjhrm9hWDk4a6BkVYFxfVXT4i8xjzJvzlRQ=;
        b=ixO5vrm3/78glTmxYnDz8NRoKBGs8EBiIcsbPgR0OpHY5VPnytqMtxC6MDSNJkywv9
         ig03MfI96VKmak9gh2nKnzyq1eMAx4phKOrosPZ5arbJTadYhqUZul/yGBELfBjjrix6
         gsQUNmtvSvahqkmvOQ/Y+elirH4AK/XqHLytMN3zBUAWn0oxWfJsE8V1qfjwjSSCbrzk
         w2XYr8DvyRwkCyl1uRTUtBWhaMuU7lA8WQZgQH+w9/Vy+KlGzbjdc0eiQMSwuAklODmX
         QpU/v02vtxkhpaOp7VTJoJ/eRjE1ZxC0Q1c4HMnW3MCH75iwxPcV1HgsH0FDNJKAJDh2
         tGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781394720; x=1781999520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQNEZ4jBfjhrm9hWDk4a6BkVYFxfVXT4i8xjzJvzlRQ=;
        b=fvX7sDi0PC2L3dM0xwNfm+Ye5ELnmp7Wm2pmfv9oHW3h/5JkgM0j4+XbFnj9CvScRd
         N28qhiPqr68Dka56t7L92qoHxqYE6D5zZPaL35Y3RNVRYo859BBnnLcqUkk8jpjNnj8R
         voB59E7OOM9P18oH/QatNhrhY7sqD153uEgOUiXgdIm60PxClw9nPv0dWLs744EUsp/L
         eXIZXzAFNOP39+yEtoFhkndpFXIXxHiKJetVISQ6DsZjySeX/nDPXmjfhGKukVSzi1WL
         wJ6hA0ActjrWu8e7i2EfzlFUFVweRY48SkQAIa0QrtOekxfsxxGYXFMJdxUO2Lld/nBm
         m0tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WIAkLPXF1AwzmUfrF0do7RadWRveXg7I6D/1HSOFGJ4SVfx/bK4MVgaSgdpt4lyB5JeND+ON9bQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqsklpLxttjn9sWEarrbycY/qOWdQYTy58IItt1PiIqQkf643E
	B+i+Qj1ILDcFlTxR6Hj9GfjG8d6k00zP1tEqU7TO+8m6WdvJ6kzwj/hc
X-Gm-Gg: Acq92OFNQmUwhd5auv+zTOU8/dGicsg7QEzFgDjvKSxS4INfBO0tBPHwZOBJjgKneef
	hVAruEODKAfO7KVN4p1df7znScgjF37agwn8h58qs6qW8j2qJpQkroh28emEbG23HL9kZAkWMjg
	0V17I2LvWkDPyklue4nmrFTL0Z82iZmbklGW251d/9LEu8gyNcgoaNV7ZWbL6NlY8l5AXEiHPZq
	Wi0chpb9Q7SjtGvtRznDde9eJxYGVbRaIi8iLWASz2pghXPDt+KNflGlULq8IUnw2yvA6ZLE9p9
	ZE5D5e/UmJuxe2CdyAwEyPrrUdpddvQ2TIcnXP5NtFvkuQpUWKKO4AgLv4KpvjELsJrM5liwH9L
	Z76yKEl95xcxvkHynDlSz5nlbD2rqF5t7rMg5TDk/ey7mFEYvECB3Or0dFnGcL9pjIAcHpcCl0h
	4MZ1nh9zorvtNMgMSh3GOWsGCKnNF5ZqEnkiy06XFoECqptZ/9Ypyw94TsUir8Sj9QjXBfuizTa
	Iyj6mPgM1T8tlxYF7W5+4x1zfHzlGMfmrMKR0erjgyQOHYyCf5Irh2Ht7M8VaSnR579zQp0VhSz
	f3pTIHnpKK3qwu8L1A==
X-Received: by 2002:a05:7301:19a6:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30820c2d295mr4712965eec.7.1781394720576;
        Sat, 13 Jun 2026 16:52:00 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm8808882eec.19.2026.06.13.16.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:52:00 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: nokia: correct CONFIG_USB_GADGET_DEBUG_FILES macro name in comment
Date: Sat, 13 Jun 2026 16:51:52 -0700
Message-ID: <20260613235156.164531-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in drivers/usb/gadget/legacy/nokia.c incorrectly refers to
CONFIG_USB_DEBUG instead of CONFIG_USB_GADGET_DEBUG_FILES. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/usb/gadget/legacy/nokia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/nokia.c b/drivers/usb/gadget/legacy/nokia.c
index 2e15f9a32ce9..396605a84cd1 100644
--- a/drivers/usb/gadget/legacy/nokia.c
+++ b/drivers/usb/gadget/legacy/nokia.c
@@ -50,7 +50,7 @@ static unsigned int fsg_num_buffers = CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS;
  */
 #define fsg_num_buffers	CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS
 
-#endif /* CONFIG_USB_DEBUG */
+#endif /* CONFIG_USB_GADGET_DEBUG_FILES */
 
 FSG_MODULE_PARAMETERS(/* no prefix */, fsg_mod_data);
 
-- 
2.43.0

