Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794144944;
	b=39AFVI6Ia2uoz0Q/Wuhg+7P5kq6pnlLLxURh4q0pC+IQcxdCaBI91Kbq8yVaBw9H47EZ
	 auNXtYTbrzF1kr5ZorOVIpVvdn6xWRp31harcXIGX8WruNsXO+zHNhUtDOCcHnJZ1lF6D
	 sd3PtpFmIXXafD8LML5VyOl82xH/SjNP96Jfzd+3Fypcrz7702sfMX6pxojQ5wi+whmMu
	 guckO5WhZRFxGNEa1zZnUqf21QUmGkLoeP+/DxeQeSXsNFeJVFg/frIb0+a3/yrJS+IW8
	 WtZG5RQnIKJwjgEy6bcZYZZrTCBLnZU5HgiP4+uj07Iq1UK+GzgcJVmzZ2AtVsPCQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794144944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Ng0uZYQ+LIwIwtwHGERv4b3yBKSq7JDf+ArUiIqJ40=;
	b=YCCKG+jj5VK/TJb0Y+1Yx/yvhazT9u2xjGXcfhXFp6L7FNRy28BoQFbNOCrmx8dbk+s1
	 BlRKJ9qzOmTzkhOHtwH+/SxQz+OP8KcYOE1xHqnj74MHNJXPk0WJcTbSw+tGvlsMPrLjo
	 URpLyJ6MCQ055yCaZHoBYYhmnHGrEaZAzOOw2ooEaJMhBCCAUE3SV9SvCwJGDDd8iQSDn
	 HLsl+iTfLwt3Bcfu4c3au9nVhJ2iisNKaYhO50kATKcAznRpdYORZyhEr70n3WnJ0SOLm
	 aYVycoxJwBhu0DiNUbJnUExZYjtKylqdoP47SUpAMJ1ILSRqaodm6E+ZA+tlsZZZ5GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiOpTURZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022D606A32A
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1022D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiOpTURZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso226279eec.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 05:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794144943; x=1794749743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ng0uZYQ+LIwIwtwHGERv4b3yBKSq7JDf+ArUiIqJ40=;
        b=QiOpTURZzmEjqzsZNZGoZhVtaJpehNpJR2dhcXWm+iWH8i56iAlf8lXP5pYk4OInWA
         VSCvL1x8DzeVfP9rr4NJzSFnyr3RdAxa1QS0LYa4CKs1Aorp+qZHAZC6PgpX6aK8knZl
         /+5KIu+KCMFR4H+acsGttQkDkbA40xEMdDPAtc1VN+0qsbHNoc/05W3Lxp6sSTHCMNTp
         yopzT2st7Y3BCgbhcacd2Hz1dWMVoNKI9COGbMV1WbP27UGlvpsl7xJLMrATltAx26hn
         zycTVLaKC56zOhcssbzpE+ht1YasA4C91eJ0PjEerjFYFMn/p6q4KyY/0x73pkgOduHl
         FPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794144943; x=1794749743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ng0uZYQ+LIwIwtwHGERv4b3yBKSq7JDf+ArUiIqJ40=;
        b=bGvdzyz00PMko3SUke8G/d12RaY+I2/T2aCsxseCTxsnQjelKVq4r0kYDzyVb1SLhZ
         +8dhIIKwc2owWXeIyXPx3OgPwkIgXyC8pzAwNfJidr/JCnmTA1rdaNqWCx7RO3WVdkp8
         CVeqq7G1Vm6sR2oHKfBb433gAfV9dcY/t7Dl5IO+ku74R2bcsmaB4FCo22uRYmPoGIto
         7qRdhgYMBYD1ottQdt5r4Nnr6aPZ/+OWJX7/ppjlAw4Z8OlgRat9kGlEijodN/SS6OV+
         bJiosZHjRwIUH0HrrgpP9XqgXLg46uUIWJrB8+xvVL1WqC0v1uBYNdN3vnlvPLuPOroD
         8mlw==
X-Forwarded-Encrypted: i=1; AL+hErENHbV/Do9saSrVdTBUNRSMtMCkmzx0GdvLJJsLsLDkn/l4AcFVENd0tQNcaYL9iGZo7ltXD2SCG6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IJw+FxccDsdGhoIZHyj1rKXe7vqAvudP7kpHGFxiYXVXbGHHE
	kiWqVH3rlBFF0Kwp/jKyFFWHqcUyKuzbopKpU0O7O0gKLl84c46SYdwrfzPNmoeQ
X-Gm-Gg: AYBFou0QTApdCnBqGX2DMe/iaBSdS8Sr3ecVi38KMpiDrjBezErnMWV2EHH3iUMcfbY
	yUZcJRtGN5vyWcVgaVYo4qgwVy2G1FEj6BwIC9MzeeoHRcftYjcOL9qScVIPGv32Cz5kRhXxby3
	Osd7rE1ZED0VH+HpjQdu4S4m2X2iZsPPaSD5LbgiZWfQkzEp3rIWrE/BfNWqP1US9YOwYr/a51+
	O5oMAvbDnnm3HBqeU/nluCPugiYJe6YYUngMROZ+qvMFbHyVHOX8a3ULulIPUnSidr4PmyiGYM6
	pGFEDpwXWLV6OTZNNDnRjKdcQ4D7Me2hovZT0ljH3F4fkUwKb/VI1Mta6B3YPIgRaQMTf2GlOxz
	CnclJMZKMV0zu58XVls4uG6HifATeXYDIeiE2lhB2uP8Mqyc/eVvDMmGmVumkuHVtH4l91C+NEu
	R/uvHjKWI2m3GVUCasBbmjd4aRestLMl1Y0BLMNNn8C3Fp2VFc7vZRYYVf6tTZ08DxphS2btm50
	jQXqigXih8dwYlU8yjXdd/+ZN4K94X8GCW9CAjx7xhybaaG6nfTrqRx/6K0ioQZItpNexLqdvPY
	62Os1w+1cMde9G12gX1u5Hc5b9pn/6qWZSoHDTJLYRiuY6ZS
X-Received: by 2002:a05:7301:6701:b0:36a:79e7:2fd with SMTP id 5a478bee46e88-3725f010ed3mr3895058eec.40.1794144942126;
        Sun, 08 Nov 2026 05:35:42 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm5239413eec.10.2026.11.08.05.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:35:41 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] usb: gadget: f_uac1_legacy: disable OUT ep and drain work on teardown
Date: Sun,  8 Nov 2026 22:35:32 +0900
Message-ID: <20261108133532.532633-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

f_uac1_legacy enables the OUT endpoint in f_audio_set_alt() and queues
usb_requests whose completion handler f_audio_complete() dereferences the
f_audio (req->context) and audio->out_ep, and which schedules
audio->playback_work. However f_audio_disable() is empty and nothing
disables the endpoint or drains the work on teardown, so:

 - f_audio_complete() can run after kfree(audio) (the UDC gives back
   pending requests on the still-enabled endpoint during unbind), using
   freed memory -- a use-after-free; and
 - a playback_work still pending runs f_audio_playback_work() against the
   freed f_audio -- a second use-after-free.

Disable the OUT endpoint in f_audio_disable(): the UDC then gives back the
outstanding requests, so f_audio_complete() stops touching @audio and no
new playback_work is queued. f_audio_disable() runs in atomic context
(reset_config() holds cdev->lock), and usb_ep_disable() is safe there.

Drain the work from f_audio_free() instead, where sleeping is allowed:
cancel_work_sync(&audio->playback_work) before gaudio_cleanup() tears down
audio->card (which f_audio_playback_work() -> u_audio_playback()
dereferences) and before kfree(audio). The endpoint is already disabled by
the time f_audio_disable() has run, so the work cannot be re-queued and
cancel_work_sync() is sufficient.

Found by static analysis and an automated reviewer; the playback_work
use-after-free was reproduced with KASAN under dummy_hcd (slab-use-after-
free in u_audio_playback() from f_audio_playback_work() after
f_audio_free(); a delay was added to the streaming path to make the
schedule-vs-free race deterministic). The out_ep/f_audio_complete
use-after-free is established by code inspection.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3: Fix the v2 regressions found in review:
    - Do NOT cancel_work_sync() in f_audio_disable(): that callback runs in
      atomic context (reset_config() under cdev->lock), so the sleeping
      cancel would be a sleep-in-atomic. Only usb_ep_disable() (atomic-safe)
      stays in f_audio_disable(); the work is drained from f_audio_free().
    - Drop the play_queue/copy_buf drain added in v2: audio->copy_buf can
      alias a buffer already on play_queue (f_audio_set_alt altset 0 queues
      it without clearing the pointer) and can hold ERR_PTR(-ENOMEM), so
      freeing it there double-freed / dereferenced an error pointer. That
      buffer-leak + copy_buf aliasing is a separate pre-existing issue and
      is left for a dedicated fix.
    - Correct the Fixes: tag to the original driver commit c6994e6f067c.

v2: https://lore.kernel.org/linux-usb/20261108122645.421721-1-hj351016@gmail.com/
 drivers/usb/gadget/function/f_uac1_legacy.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c..c07f323 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -697,7 +697,17 @@ static int f_audio_get_alt(struct usb_function *f, unsigned intf)
 
 static void f_audio_disable(struct usb_function *f)
 {
-	return;
+	struct f_audio *audio = func_to_audio(f);
+
+	/*
+	 * Disable the OUT endpoint: the UDC gives back any outstanding
+	 * usb_requests, so f_audio_complete() stops dereferencing @audio and
+	 * no further playback_work is queued. This callback runs in atomic
+	 * context (reset_config() holds cdev->lock), so it must not sleep;
+	 * the work is drained from f_audio_free() instead.
+	 */
+	if (audio->out_ep)
+		usb_ep_disable(audio->out_ep);
 }
 
 /*-------------------------------------------------------------------------*/
@@ -943,6 +953,15 @@ static void f_audio_free(struct usb_function *f)
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
 
+	/*
+	 * The OUT endpoint was disabled in f_audio_disable(), so no new
+	 * playback_work can be queued. Drain any still-pending work here, in
+	 * sleepable context and before gaudio_cleanup() tears down the card
+	 * that f_audio_playback_work() -> u_audio_playback() dereferences,
+	 * otherwise the work runs against freed memory.
+	 */
+	cancel_work_sync(&audio->playback_work);
+
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.43.0

