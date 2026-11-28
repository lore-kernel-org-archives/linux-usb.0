Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846752;
	b=iJUntooQ/XVHd3f1GsQVwfiGD2krX8nOhFc5KyZkAHzy2u0n+Zp4EfOlt+LmmGIUBjOG
	 OIzo7olQcWaakrsAP9s6bXHsDD/dDp8YbNzikU6NVvsmoD5seMK0x5AmREAbek4+j2H4X
	 Ws6nYPggF1gSO/A2NpWkoeoR6KU34oOay9S9AANh+dJuilGSiwu3TUL3/prIRjn2XyCha
	 lwaZreoq7Yb2varTV6paXgkVPKjv9GkqVTzvkgaKYD1PMi94FzxlnupzPQ8qdMseSSfHF
	 OKEJV5rAPBqtWvdPhcjsj6o1AnXyhtyUv5qncQ4K2c/1VkhsoiAt4HlRFWgMPjJJ19w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
	b=0f89+n/AU3UFAA/W49i9fwGj3wAC1aNsxB+Dku5p7MOaChceaGgvpjbB+xzhwc/xrMcL
	 DhxywgblV52TlTKHPoYxju2vuMPAPRTcozcXyh1jW/E5R4m2DQkFlCZmz3/OM9q4HsUoj
	 sE8J23CT4fO4tSlOwkbGY8AM0HQY1HuzX9IFk4RcNMZaJ6DavdEzzJkmAsdFJuRQJ3jRS
	 iDOF6dzYkZBZi2PEnFF79wvJnNcf/Hg9xngEfLfM7VwKq8vI7I/Za1idC5mBGuNm7dOEU
	 JGoffl3X5dTbAmxM94v2ijNBxJexoVqVwWxQ5Qi0+VjOZoy1t8k/1/Kbg57JgKDWsYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdfmLEwZ;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB3606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 06:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdfmLEwZ
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-92100b756b0so67445566d6.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795846751; x=1796451551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
        b=DdfmLEwZ7o7QhnLgq298NVLTmp+v1Zw5KGDQR5HL/4YjkoIUnVkEtJQkzAtezPtEUy
         Lueu3cLUY0nqc62kWSkh7wwvOgqhaHpIOp63gT/oyf+CTdfxuGsbiUSlN3GskLxq5vNu
         43mq7oAV0ZndNOZ5gpHBk8LxivD4M5yxWCUW055yovDK51xZy1zFtUVsqw+AU1xl/g5m
         A9M+Usz0EIokbL/7tx5QjBzl9WXwBMVLdcUxO3x+16c/wiuJl1MZUdCDMQhxjgtBQACR
         eu+agRAQGopjkaO2Us1/xFUEEJkOsU48sR/twgCfuM4qnSj+Bcp5T4tbE8/BeKHwMSUa
         kBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846751; x=1796451551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
        b=00uJxy9OtkWAmufnzZZg6yF2mU/g2X4mY98M0f3pqsAXdTlktres4xRIfsHjIstJjq
         EkCckgufCrWtv69TNCY3+BrjAgpjSnFrpliO6Dvv2u6JVrtZcj+pd4n3/zeHlxKeMGES
         A1iL9CZUH2M7Jx6iLx03i8anD/346vNFeAYpfxsTJSgRAQ9I9PVf5VkhI1+6LKAvyOti
         DkH1c+NdmCwdIaugGv8EgsbyyLhTGJzuzJtIeML1FeIxEt/ukNgiAf5nq2B6mbVgXXfu
         N0IcLjjsyuCA8VBsOPG3tLqfYwLpeOKWuqdHyHR3WNe3y4ojtY2xCFOo/ZDQ7ZuQZOlg
         uD6w==
X-Gm-Message-State: APuU4Z8hbIPUWcm550vNWHMSsxFDrT/mSJgjZqeL3r109X8uhNKmxMG8
	p8eWtuhyDPqsnRrgqVnYNTnfUINIk9nPvdhr4IsxsJZhnAvNwyynt/nA/5lfSkaw4d0=
X-Gm-Gg: AZFdTZdyPPpA73CQv1flqRucuBbwwlck7OckpDG7T9BKZTX25uXfC/ouMiSDfpRCTt9
	XzVBpTezq7L6+kVe7jBuBxCT++pMKCjrI4mT/mbC/ywdEvIMfz3Y3/ED4YGchEWfgkcjREDzHBE
	ouTpTPQvyiBYaZkIXWhjAcdwIORtYiW+V3yICu9RMiFeDre2c3TmWj0VuIrxef9b+zANMe5s8Du
	V/dv7ilYRzB2r1b6gFBtUSGP+UvtIrwABnX+w3oREZS2Bo9da7Bbw4HZoCo0tYGcr0V3x2SUrBv
	50pq8Oh+s3AVZlP9EKew4oD7/GlJ7+/edH23Aka2Ya839hp+2d9M2mIcFoxDfvky2reiiH2C+Jn
	+cNJ+t1RFCHLtYe9WYB+f6e2AqAxLTTncFXvipTJds19amtUW3gbVFkMyJt1D1H1NPzNQsJEmrh
	vf4P0ROzI2f7QJXCgDj1AItHTplhwleU1SVYbkP3gImHiwEM3/dwPDoKi3kdfOsexTO0tSqNGZf
	FqwuOqvIvTbtehl/DUld+lbbb9iS5pcxAUoE4goxtBXER+jeDVAP1Zre/kKNt62NEGcvGIhdbKK
	eDqq7cPLmBePQ9WO6q7ID3mhNBFUgy/xGBb8LZoh0tLN
X-Received: by 2002:a05:6214:2f01:b0:921:2e36:b781 with SMTP id 6a1803df08f44-92134a5457cmr539622096d6.16.1795846751423;
        Fri, 27 Nov 2026 22:19:11 -0800 (PST)
Received: from zmitepc.ad.psu.edu ([128.118.12.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347966desm232907746d6.3.2026.11.27.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:19:11 -0800 (PST)
From: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer BlackShark V3
Date: Sat, 28 Nov 2026 01:19:10 -0500
Message-ID: <20261128061910.742824-1-memobayoglu2007@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026112051-smirk-omnivore-0d65@gregkh>
References: <2026112051-smirk-omnivore-0d65@gregkh>
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

The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
USB host by its configuration-descriptor read pattern during
enumeration. Unless they see a single full-length (wLength=255)
request like Windows sends, they refuse to bring up the wireless
telemetry relay and battery, charging and EQ state all read back as
zero.

USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
behaviour, so just register it for the four BlackShark V3 PIDs:

  0x0576  V3 Pro (wired USB-C)
  0x0577  V3 Pro (2.4GHz dongle)
  0x0579  V3     (wired USB-C)
  0x057a  V3     (2.4GHz dongle)

Both the dongle and the wired transport enumerate the same firmware
and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
vendor channel answers and battery/charging/EQ read correctly;
without it every vendor GET returns zero.

Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
---
v2: move the new entries before the Kiyo Pro (0x0e05) so the table
    stays sorted by vendor/product ID, as requested in review.

 drivers/usb/core/quirks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b..dd926957c 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -500,6 +500,11 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer BlackShark V3 / V3 Pro (wired and dongle) */
+	{ USB_DEVICE(0x1532, 0x0576), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0577), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0579), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x057a), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 	/* Razer - Razer Kiyo Pro Webcam */
 	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.56.0

