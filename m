Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784193;
	b=yc79HrSmh1W9YJ231mBL/KVehOoNlj0WbiHhXCvHV2mfjsT00J+Z0nOgAKFrfnsR5KuK
	 sq3xnrPy779R3R1ZfkC5GUcKioIqtAkT4eATOUlK05ixuz4qjoDLiQ2EEoCA3G0g3z8aq
	 43o6Cu3l8vDWMolomilUzwTwj0qCWPbBYdQgMV7R26V+weA5BU7CD3O+EAcY2KtDrPwZa
	 cofII0uxMUEuOq5ubaQ8y7EbyjXihAu3fR4zTaByzqqlhZhwym8qw61rzabNOYRKlsE2g
	 yIIkqZzjEJqHW2ixB5JLiDegBEMc9B+BSPpc29iNf20tPecy7HtgxZsS2GOZmifNNFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
	b=vXt0qPTMc6V7ZKVSM1rNtPa9DJXRXDHACb5mNibcZegXOUtplPgm/gTH4Lj0xPCGFbY0
	 4ZElP4JwFcZGPQz6Wv/FfK64mDbrUsYWxdfA0yLMdc8zhsB9toyiBlj8GEoEzE7YUWb+p
	 ca+8HPS5Z+bJWj7IWJmIsYZn9hJrEEXpdiR931lulXgoW6ZFRAdIgKv/BADgIaiTu7Hs1
	 dhzF3c1ECXoHztEyAmkC/NSyU22fYsuFA3+NgaFgk1Sm7qQ6A3AXJ11lTq7ZLM/5yArTs
	 H8tPG95QwaKhels6VR9lGG5yUkKwa2g+xNevx6TwixahHECr+ORslr2IVIE8k7AIVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yv+WjofV;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDC6606A329
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDC6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yv+WjofV
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9b69so420810c88.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 01:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784191; x=1794388991; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
        b=yv+WjofVIwN4wmr2CZdx/HBP0X/MSvtWEKfaF+4kXaJQRIB1/UpBXPGEnSwfksPIWh
         r2bE97GWyBUlwWCGYtuIOlnPwhWS83/M/53s0bNHkSS67iRu2L+yUOzesiBuSAkjiPMs
         RemmnlUQhpAnfPvNKz+35iLokaxjvvNBthxkCkS6YvIXXLvThAgf5EhgL7JZ0WLYfXWE
         ncF4V9K90+nzgPYQFw34l6xVLUAj/gOnAOXvrh6DP9VG/jMGwkG+VvQGHj8aD+uLH9dX
         iMSnTPCfcOfFrOQknpV2X4kRMKhKbbnS/x8LIMmR9Sv43aU9/Mb3dYd6A6hpVjbM60NX
         7XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784191; x=1794388991;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l625WaYz05tuxkMPrYXEIl3wHIYIWGdZBEbzMzBv+3o=;
        b=rpgKxmO1LYmnPgvjpIBumuavPyRqBTpkaDzwxw6FevPJlYS67z7iS25m1ulQ4nM/TW
         GgcIh+ZndTsaDHL7V34Bn2JvcrHauSACMdBq5jfv0qi2mPoup09ElhAZGEuvGe8VPowa
         3F0bbZIN6brvM1JQ74oPNGHLtAmfy7n5UQWq/09JwxRSiOAiydDROSj92bIzKwapKsTw
         z0X8e8J41qzkSumjnnt/48CRHZ2mM+KfwDnc0Xzpjh5nccGvYYgUC/2JaOx0+Y0BNOVO
         MNVYlZaSNakyjJXJG3jfi5GemwMPhQW+JrgFT4eNEiCgNLRYZgQ+c8swuzTPNNstppXJ
         7LEA==
X-Forwarded-Encrypted: i=1; AKwUvBxXrn/F7IgpOHQo2eS4syKb06su422BgNPgURTVjGf4bq23NNM9EXGpNaaO/QFtiUJBi5yWhnkh4rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MwX4C9kGRu6+cA5VmwbOiUba9CpdDl9mYZmbHaTx9uQzy6HY2
	d2xbcewtQ72ka8ykL2cbYZW19WxZgPTU7LHqE5YRBef522lkLIPaa9SF
X-Gm-Gg: AYBFou2cmQWHxunTDUuyJmV4lkveeuGzam/Kdj/YWlXpQiP33BEZmexOdJCKkTUywDU
	eBNXEdgNka3SRAyQShO9R2PBbhINeUuccT+0B21X1ve04ApD9HB9WLlxtBKFrnWgVZps75T27G4
	7AZ61d+np86yc2cUmrA1vOFhfwwKWp/wtjd8MUl//pAzDE7rxc84MPGI2vIGIqrKY8BP7cMwfEG
	p9Evznv8zV77qO+A0LlNxWTgEIFvmFBsSSshp5BXjNHop7ALSpaP7LNaKeLfJbHdhnVNIhYrBMI
	OIS74qIx+7e6AFJ/UBA1AcWxrNC3nekXOVAU588WIzCJeVkgPgTQiD8s0gMTgYFT3sS8HdIHrK9
	U2XoUoipV/XZ/mAm34YvPUlE3WrGkMcM6LcB4RV4fLy11eRbR7s5eSDrd4no2VKFwgngCJkCHMF
	QssWjXDrfcU+M6KYBSKiRaI5IawLvhExPxBRvU76l8jW0vHooRy7Om8mw8Zbd9wCYwgqvWJ66au
	9U0s0w0MoaRyDz4pxTdT4I/E8kR+HGK9Cyt1ay7clQsQ6XXFrBZTWjf4odBr3kLAjYJLpxWz+W3
	6d4fXSzGJgfxiZleccUMtgCOwakPoIGQqNf9Ruvd5xjWwwLyqqgx5SU2CoDiKCdN/dI=
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr23062656c88.11.1793784191353;
        Wed, 04 Nov 2026 01:23:11 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6796395c88.22.2026.11.04.01.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:23:10 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:22:55 +0800
Subject: [PATCH] usb: gadget: u_audio: read period size while holding stream
 lock
Message-ID: <179378417544.69464.16164899430939223277@gmail.com>
To: nkapron@google.com, gregkh@linuxfoundation.org
Cc: raoxu@uniontech.com, sonalipradhan@google.com, 121811682@qq.com,
 vladimir_zapolskiy@mentor.com, felipe.balbi@linux.intel.com,
 erosca@de.adit-jv.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

u_audio_iso_complete() reads the PCM runtime while holding the
substream lock, but calls snd_pcm_lib_period_bytes() after dropping
that lock. A concurrent close can detach and free the runtime in
between, causing a use-after-free when the completion callback reads
the period size.

Calculate the period size while the stream lock is held and use the
saved value after unlocking. This removes the unprotected second
runtime access without changing the period-notification condition.

KASAN reported the use-after-free in u_audio_iso_complete() on the
unmodified kernel. An injection-assisted test stopped the fixed
callback at the protected read while a concurrent close ran; no
use-after-free was reported under that test.

Fixes: 773e53d50e227 ("usb: gadget: u_audio: remove cached period bytes value")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc7..7f378858146a1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -156,6 +156,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	unsigned int frames, p_pktsize;
+	unsigned int period_bytes;
 	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
 			residue_frames_mil, div_result;
 
@@ -267,9 +268,10 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	/* update hw_ptr after data is copied to memory */
 	prm->hw_ptr = (hw_ptr + req->actual) % runtime->dma_bytes;
 	hw_ptr = prm->hw_ptr;
+	period_bytes = snd_pcm_lib_period_bytes(substream);
 	snd_pcm_stream_unlock(substream);
 
-	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
+	if ((hw_ptr % period_bytes) < req->actual)
 		snd_pcm_period_elapsed(substream);
 
 exit:
-- 
2.34.1

