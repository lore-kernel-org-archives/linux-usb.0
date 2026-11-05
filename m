Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879004;
	b=J2/qfQL9PnPG2hmgB+hquscRM4Rk2p6ObAKXhyle6FnVIqLhZBVvkhosDVEhDaTcNNjH
	 BGieHOA66em1vg7sD8iEGD9XcmL5gh5prbhXhr6bontfbPEnkfbu924hXCkYPbIPAldlP
	 6InWAy/hdThT+n2Mku4kndW1yUr8UaxpjEM5T53YPsJ6/2QeTbCtaG71ZqgDkFFP4U/bR
	 EjE0hWuMYB8dtfJ25Vs6ib95dsEBkCZ/BJxNG2M6RSzSyb2JwQ99SYuRhbfff3YQlDPGT
	 bHVywx+ifepknAi3Hd1muIxx78r9e1yHiqYX3lUg+3pl5L+HGuQSqsxgNyrlSsqv4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
	b=GQEhHmEx5gJMiD+HoiHVTgMYWInJQCZIGgcnAcJAqKNTB6oZps7A9UrCvHR4FGtpBrHn
	 z2IJPiWRy2x5d9FpWNxa/jFxz4TKtp/2R8Q3G81GFZL6M/IZTrVdyVcGmmLfCbWsxqpWR
	 as0DGLRufD097VaFz1imgRVTV80prv/JWHFHPSn9SpPx6Frodp27ppObi7OPiflg4bH1n
	 vkqzxzlNcNVZ0dy4WBiY3QNFfMrs1DfhLm4jIAK76Hn0oFkqZkgnMeuHVfvIK4RnQKD3k
	 ldGjt8Xi08FMjmSDeFdWlAdwpxORVzCkaiS0kEkUP3BoGkEL/fgH/gmpdUgdUXQOQzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0LqqZC7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45FE60A6F63
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 11:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45FE60A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0LqqZC7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2984568eec.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879003; x=1794483803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
        b=n0LqqZC76nh+k3HCnDbFpDZiqOO5izK4/9Oxe00sc4GKLaS3lfxYLffsCJnbMFY44M
         1RzW+pB62Zb3r2msrYtDPUQWAzGLPhBIuOIb8teU26ieNJla3KZ5CXQzf6fFD0q2MD2/
         a7SJhcwMayiKVaSVm6F1M+2o3TAdlbATRFgGgDzLO/CKmmEW+rMoeu0MXU/Wjm3bmGqR
         gDf0fkaLU5XECH8DLszXT7nzb0OoMoAKRFVD4eze5/hfzeo57ZgI4X9rXOHGLoKdjbJf
         895tI+fXnY+2wiowgWPZLQFcXpVEDbN9FXLPSE4E6F8ueohe6WsGI5GOiuNp+dN61DlK
         hlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879003; x=1794483803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9tY9gdRkxo3raHY2usVGihGSye+rQQJ2QRgz5/t7fs=;
        b=sZDOu9ZVZdB18V4bg+oe18fiNPNpVymdw79tMYO/9BtmhBmmaIywDpL8icFR3+V4c+
         B2Oy932QB+8eYgKQ3CDDKxV13YWhmDlU4w2RBANwYjYpHd6DTZWQDih7F85gKNsTq+FR
         rLpz/4Z5braWT+yEDQxGyI530jFZDVzKUA4XaVp+FuYjAkPYZNJulPuDHTgxCB3+GNwK
         1+M9LBl9k+zZfz2XWn5osfBNwY8bHHVsIUOQoR9qpY0SjcaIdnWI8h6DD14+WFtgUziH
         lISIrsAyBTCh4MKS4pM5nfRbxU0VNHx0IkAIMp0FP7MYTjTPX9RMrYmQBprVhN3YhE7I
         UMkw==
X-Forwarded-Encrypted: i=1; AKwUvBwesRhxRTCRtv0ZPsH9qew3rqUc0VU5N9jYak4XPRSj+KKMgiJ2P30fdt+iinPfR9eBHR4rzF/XZ8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RBfEIXL0HO5WRgd8VJC0Ztd/bsZl4LBVPcGGdIl/abPzdLD+M
	1Qxbtct7M9ZzcNO4YKc+J2YcfUCdqHy1WHDPZY1pQ3+RMKIL8Wpx6jam
X-Gm-Gg: AYBFou2wx1Rm7+Si7ZC/D0KW8yZxdB11e4mZZ8Dh4wxXdvg7u7d76/NaNQhcMb9dOuN
	92rIm8nFz7kMS77jplZBOeARADynj00fktkODYYRhLf+rooH0X/z2uReHxrdMsk80EpdaliMLwT
	37sfcBfG+LqgBslYVwy13a4di91LGoFdjW1X4xV2JF6odks77IiWD2gYuzt6dgJCnySMcaRVKbw
	8lLGYVdh0ElVPzqSAVoIcfC0dCDv5xq63ZKQ+adauLhKzqlrSlMEcSf45TQGhLTWGNqNdMWNc05
	VYSiKY3MLg0zRmiNsCHA8aXxisgZmSPbw2Rqmntcl0PK4Z0B/+t1vUDtQMdO+Q2kV9b1+Lodv9G
	CYCl+EBsR6BgDXzpDRksP3UTnctsMbpKp27CaC51Xj9VyXcsBrKXHEs1MtnVFc6dqTGM2cHBLdC
	BDumTiyPF9ArFZmBb55WtEK+pg2U74XSo3X2AIcwqt7hjsSPpHDpdk4ihbuQ0lThPUHpphhD6U1
	EMPYBuqJDr5vbdXSvVwevJhT88FoxXXq4vSyvWUMYjVXX18JTodKAxCWOWxQUonjzHinS7LsD7x
	uAmTkkX2WMdbuGE/CshPZJJBhz2z8I85FlXMLBto3XmoeYGa4prFeB2XCMgxkapWIi6WKoc2rg5
	BMWD7+jiNt4R/KjEZAIzR/Ss0ecR5d/M=
X-Received: by 2002:a05:693c:4195:20b0:36e:2b8b:a090 with SMTP id 5a478bee46e88-36e2b8ba399mr2744277eec.37.1793879002447;
        Thu, 05 Nov 2026 03:43:22 -0800 (PST)
Received: from lwq-System-Product-Name.. ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm19906381eec.7.2026.11.05.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:43:22 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: felipe.balbi@linux.intel.com,
	vladimir_zapolskiy@mentor.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: u_audio: call period elapsed under the stream lock
Date: Thu,  5 Nov 2026 19:43:09 +0800
Message-Id: <20261105114309.970899-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

u_audio_iso_complete() drops the substream stream lock before
calling snd_pcm_period_elapsed(), which re-acquires it internally.
Between the unlock and the re-acquire, a concurrent close can run
through snd_pcm_drop(), finish the PCM release and free the runtime,
leaving the period notification to dereference a freed runtime
(runtime->fasync in snd_pcm_period_elapsed()).

Keep the stream lock across the period notification and use
snd_pcm_period_elapsed_under_stream_lock(), the API for exactly this
caller-held-lock case, so the callback's runtime access happens
inside a single locked section.

On final PCM release, snd_pcm_drop() takes the stream lock before
runtime detachment: an in-flight completion holding that lock
finishes before STOP can proceed.  The STOP trigger clears prm->ss,
so subsequent callbacks do not enter the running PCM path.  Runtime
detachment happens later and is not itself protected by the stream
lock.  On the gadget side, u_audio_stop_*() dequeues the requests
before the endpoint is freed.

KASAN reported the use-after-free in u_audio_iso_complete() on the
unmodified kernel.  With the callback stalled inside the locked
section while a concurrent close ran, no use-after-free was reported
after this change.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

Fixes: 773e53d50e227 ("usb: gadget: u_audio: remove cached period bytes value")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---

Changes since v1:
- v1 saved the period size while the lock was held but still called
  snd_pcm_period_elapsed() after dropping it, leaving the same
  unlock/re-lock window open for the period notification itself.
  This version keeps the stream lock across the notification using
  snd_pcm_period_elapsed_under_stream_lock().
- Documented the synchronization this relies on: snd_pcm_drop()
  takes the stream lock before runtime detachment, so an in-flight
  completion holding the lock finishes first, and its STOP trigger
  clears u_audio's prm->ss so later callbacks take the early exit.
  Runtime detachment itself is not protected by the stream lock.
v1: https://lore.kernel.org/r/179378417544.69464.16164899430939223277@gmail.com/

 drivers/usb/gadget/function/u_audio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index f0ee83abcebc7..7da4032e3a203 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -156,6 +156,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uac_rtd_params *prm = req->context;
 	struct snd_uac_chip *uac = prm->uac;
 	unsigned int frames, p_pktsize;
+	unsigned int period_bytes;
 	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
 			residue_frames_mil, div_result;
 
@@ -267,10 +268,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	/* update hw_ptr after data is copied to memory */
 	prm->hw_ptr = (hw_ptr + req->actual) % runtime->dma_bytes;
 	hw_ptr = prm->hw_ptr;
-	snd_pcm_stream_unlock(substream);
+	period_bytes = snd_pcm_lib_period_bytes(substream);
+
+	if ((hw_ptr % period_bytes) < req->actual)
+		snd_pcm_period_elapsed_under_stream_lock(substream);
 
-	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
-		snd_pcm_period_elapsed(substream);
+	snd_pcm_stream_unlock(substream);
 
 exit:
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

