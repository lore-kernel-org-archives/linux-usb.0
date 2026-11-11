Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393466;
	b=ZyNyzC6yl2tg4C8Yj7tEq4wxT+ZdVtkaDlyn/Lmzc97dYopZ/hG0BUqXRnUg2mwB3oCl
	 w39mSY6q6wDaBTDq5qE+STx+c1B6id0/1Fiugzp2k+UgbhiuXlnDOEmeJTz/kC4APoC3b
	 YWMHPhSSTS6YWTX7VYv1S9vdDImjup6mpe2G31gRbWdDSY8SJ5dLuQvuSbrErgsNZiu9c
	 qYjcA9g41NbbHGEICoyj/eVMuq0NK7ZM5Vqmus5TuHckQxtdkr46oPiSzICftljQO+XA/
	 weJIVmM5au3vTmb6sPCfEvt7NFLH2DOF3W5ZRSCRizdAwU/tgJOgqTDwaHiH4Bc9BAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
	b=ZSpRFhXI+Ck1fBTYnRAAyiNtWVX4wdd+f7OOvasoFS5bPjQJppw1GkFPEyUiTt/u4ikf
	 6Jvp55f2Nx00FLCzAvy3LjG1XhTfTxZj5qJOKr4JCu5UdetIREvc4nL5zFF2/Cm073bfV
	 yOoEFruHs823SD0eva/ewULiDb0eexXBS2dTX/JplR/MI6EdUUVtzLwtxsZxWX+upiigY
	 6zjwR9fqHGXdh9uu/lnVEc1pDLO1aQ6ROIM4ImQYD50HL+kk03pCOHXqZ7rgKtBXxug+A
	 vMbXvStBYLyBHSK4kESOeyxIkNpZnuEjtL5hMNLVWXsuf9ybgg1x+nM8ttd2orn0uJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSly81NO;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72C606A33A
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 10:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A72C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSly81NO
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2362021c88.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393466; x=1794998266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
        b=kSly81NOvkhOF6h0IUmSNriQskA6oEcGAjoNE8bqtogijFzDsyCzVPJTAOi6M+4j8y
         qFBg5MELsECzCfQzr965hhvxj1AzlX6Y2dZt2YzO+cQ0KhL78bRIFyAIfF6VCl5izkVQ
         /01F2qZkeRNNa6TydW8kNim7Ooo3GKXOCBqLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393466; x=1794998266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7reSarsH32xBEfkEocNwbF7rtpzWp2YmAcWJ2rMzGE=;
        b=Fcno2NLBGSX7LgMRI+SlFLHycNf1lwpW/gfq1mahTC6ecFMaKRdMBcVNkwcM4Muu6U
         H6qNve34H9xHFpmdjXZupIucu2FuFlQQGki0JvDcBVgOnEPZy1HNB8Pck2Z8nK5aSufr
         kddvuvIsP7+6KueDULoGhwwT6YABnQQNgZZWS+5qP9VLgJ1hOsYagLpva/a4n8+SAZa7
         nTGlLqi5+4hVjcoljPqd8FTdkzgJeL35FlUWYviSZbKRLn4HV1CbJ2+c/2rQpJ/E4jbW
         ELN0PDY3D1H1dWDAOE1a6znzcitmFW3vSbXZCkdEtCPOQA55SZgfJaTskvFFNjjFLH3F
         RGZA==
X-Forwarded-Encrypted: i=1; AL+hErGsmQHnYgbq5OyAD+UBia3VhSPfdMwQ+KXdWBKxhBeQJvvWkI+8cyhCngpLUhuCuymPKOoQ5HVp1AA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FB2rQRTzIQu/5MbfWFwVyVeKvJI7hW6e65zeHuwPxhR7qRqKK
	xcAt8AHq1xqmAMW6E2S0MHn84O5q+cfPSt3pPV3n11T4PVP8Fnx5OcIL9RJdbFstdA==
X-Gm-Gg: AYBFou1stqygmO44H0DS/0mJLDrzDNJGJItMP7slKhgyewtLdLPSLtpVcYv645EPCY7
	Xbx73MzvYd6lG/D7JJNwy3VDPEohB2e53wdb41wrALaCQY0OZlke/ioyKHrO1lL7m+n/wa5nvFY
	t6RN0FyqMguWAVWgY8J6crjVaCdV7+rnrJ8aw0NjAm7oWcgI6I/AAUr2qNXT/8asLcnLGHLUEvm
	93KXuhnGfoE8Xbz9oNyE/Gowb6JzofGc/atYph/5dF4OvinXHmaoMqWpqKE8dFbJqnDQrRAMM4G
	QbGrWCkbwSZ/K+xM//5tTzlPK7h4UtvZS41SIKVeUtchTAHyyzdD087xc/atLleJDcYd8nQn4n+
	AL/a01l8gQ45Br/L6jfZ+OxlgRu4UclOP6bjlmYJBdwDCcQNwa9jYk7xF2emmnoSDhPu2wx05gp
	WXFu0h1iYgFbCz/qA+lYt1sRwEWMHD8PaRF83gI81NKmENrb117GZF56TWgWZggicBVSDGG1Yai
	6oHhpYEWqdVjw7PHURBesECUmZIFKJ9gZnoBxIMLNa9Y9VlfrrqiZc1OwaKn7+2gAF+ErtPcufi
	hwdCchgL061GJgSMLH6tV+ql/JAWWeetAuMLJ01e4VO+iVGrBco3Rla/fsjLykZjUjCHgsvuBkl
	3qeHtriNrwlGfVVd3hg==
X-Received: by 2002:a05:7022:b888:b0:144:c123:4036 with SMTP id a92af1059eb24-1b3c034eb4dmr1715739c88.35.1794393465573;
        Wed, 11 Nov 2026 02:37:45 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:45 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support
Date: Wed, 11 Nov 2026 18:36:13 +0800
Message-ID: <20261111103710.1393311-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111103710.1393311-1-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
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

Add support for the Genesys Logic GL3525 USB 3.2 (05e3:0629) and USB 2.0
(05e3:0630) hub controller, which shares the same reset duration and one
VDD supply as GL3523.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 0606d405c16f..3bf03e1d1287 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -666,6 +666,8 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0625) }, /* Genesys Logic GL3590 USB 3.2 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0629) }, /* Genesys Logic GL3525 USB 3.2 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0630) }, /* Genesys Logic GL3525 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 3523f8f8a149..b1844a068ddd 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -155,6 +155,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,629", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,630", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
-- 
2.56.0.542.g3ef89b7020-goog

