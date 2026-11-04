Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792710;
	b=xaQq/FM7vUQtCntVL9dm28wIO3qlWKdRAFFhxl1SFCeVRVEBpjoKLq4gZvv6IaZwuXwY
	 DB5HSQJsZDFuaPJCdgz33iUdKJlXI3qDHAvTR1L6qRwanbetBV73UJ2Zqd3/uCt++ahaL
	 sDC7K7nMd5J3Q2NcGIcA1F57g0Uk2tgGRG06NNmxnF4n7WM2HjSDfWb9hkaSG46KHDZNx
	 l/nMFe4yDgzj3srip1LFVe6OV/clHeiddZULW2dO479TyvkTFQruhIZrnED7qPWo1czeS
	 KAb96Mz5AMNOLcFMBrQw4NE+aNghS4Iwx/h4tTkpxftxp+C6ehMPJa7R7oVB/TNgkRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
	b=caTsgigU/TJb83q1AjzblahJDnBzLTYyHpqcee++CA19j3RAG1E3al4i0/amV3mGvVYq
	 ic0m6GbHprQ6TDR1pn2EzuvSeOVPnXGtyUNoVGtkTK9So4IAtF/Np8qbo1YlpGwOyLWUw
	 ahaP9OGf/d4kYxIA5FaVzaeLeiglIGiDvvm8R5cpUyeqTjo265Ki0EHF+MNNU/AH6Gyh3
	 M25e7fLxBzXIffOj0JCUzuHDPaT3k5JRugJQWseoIhu3Tvv/v1PHjR1K4dcx/xMxcfMpG
	 lO3bNELbc1dWeldQmlc1PfNUDGbTjrTf/70OrW0fZuiVerzH/DoD7C6cMkNjIURdWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxJzikPN;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DC606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxJzikPN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b042c0759so335619f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792709; x=1794397509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
        b=mxJzikPNMzjmoiEyvS16txFYybRJZhTlonxyZaPZM6I6X8xGByAxGrWpT/B6UGGNAF
         /RSQ+jU1/C8iqEkea+iGqkHBXthsI1ASf+0RcfVFeCb81OelVQh55ah0ForS/wFZQ2SN
         ECQVB6u0GMGDTK3fbdujGGBLfWxnePTp9gQ/8oKw6M6ifXEldpj84HSWBLP43029q/uj
         9DiKo8CM3si6aOXO+zfJkZXA2SNHFC4tCK8rCbL8mD8R2Pk8D3kXDKcPe11IlNymP+zJ
         z4PGDmfrMEZDpCJgjiqEG6DUZYh28Aaa5+W3K7e+ijgM+yafLesL4to9d3RQrVr4CH9l
         m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792709; x=1794397509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
        b=MvXMX702kRNNHstVB917GP3/oQ9q5xMNoOBEiOrMwoj6BF9Bv4mo6brRdyvDwOYxth
         a/uC/Qc7Jesm2pIo5vvkJYOI2T0LpCAwEnC4SztmolV1dxonoZUmxPX1RN/4mW53g1U+
         ukmE51Jur1xqEexcRjiC4yc9vOW7GpBUaa/AAO+XTxfnCAt1U9hLqKRptv4WArtUPQIW
         kCKO4kZoMjLa53VY/6/O3l/iWPjHIJO3Jx/n2hxBKBl7rHEAu1JeUamjGgCgh4nldE9o
         yiberalesUGPZAIovykj7OIBd9UurBQHJLoaGH/cQdEQ2wG3S50aTUgmhUDkk7HVi0zq
         G5dg==
X-Gm-Message-State: APuU4Z90xPZyhg+kVINW6cIw9kzYLvVAXvUqhJ3ZXGKoB5BG7KFO/T9H
	YvkLCM0WlVEPg1DiBKpb1/hj+Mtj3Nosd3RM3Gtwr6yWfWQ70SzZOb8=
X-Gm-Gg: AYBFou1mjLYOr2ZYHHLKDH8AgO6rPrds4DvwmTRXlMYals0LyCuZCT+L1/FWFDZVjWH
	yQa/lyo6bT0Yyq1DSUqeaKna76TeL4RYy2bnj3d6j9gWTbXFKnC5BXvFL28u4gvQzC3r1n0VK7A
	5m9vdwVYUHnwKIlZD+NSYCP7PnhWhSVxGlGjyP9GyUjD8abyj0obtdhLSt5BTvGE3wyEC4b18QM
	UAupOAZsAtPvQ/QQYZkzsddaSjLE4jPsjefwHkHVwQmIAo5y0TzRcrWuIGiahKEkvJLyVYdjVqS
	EOb3oD0XdZFrlq8EjqVMZHspCvgVrFgk8mnnllj4Fd07heH5xVemNU99Gfle0ivFOrkuDyiK0Wi
	LP9b1MZt+ZFncpVo1cgUShvKw0HPOM+TiJdR8V5zL8Qy1Kq5EA4D4IimwBrB1fZowFjhv8y4+N9
	gt0brwFsvA/UUoUv4reVLwwTgS4sKkvQFFAOa8BUXoePMWVFXstTVtenjQmn20GVEHfsCzEOs5D
	vSSaypE0l10ws0xYhTIr1hoDd3U/ovmeVUbOGMfDlZejdL0tHl/bur7bXkliy7nVL+UvhWwDg==
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr32360828f8f.50.1793792709001;
        Wed, 04 Nov 2026 03:45:09 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm3265405f8f.52.2026.11.04.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:45:07 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_uac1_legacy: cancel playback work and drain buffers on free
Date: Wed,  4 Nov 2026 11:45:05 +0000
Message-ID: <20261104114506.1596023-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

f_audio_free() tears down the f_audio structure without cancelling
playback_work or draining the play_queue.  The pending work can fire
after the structure is freed, and queued audio buffers leak.

Cancel the work, walk the play_queue to free every queued buffer, and
free copy_buf when it was not already queued.  When f_audio_set_alt()
is called with alt 0 it queues copy_buf to play_queue without clearing
audio->copy_buf, so the drain detects this and clears the pointer to
prevent a double free.  Use IS_ERR_OR_NULL for the final copy_buf check
because f_audio_buffer_alloc() returns ERR_PTR on failure and
f_audio_set_alt() stores the result directly in audio->copy_buf.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
- Fix double-free of copy_buf: when f_audio_set_alt(alt=0) queues
  copy_buf to play_queue without clearing audio->copy_buf, the drain
  now detects this and clears the pointer before freeing
- Change copy_buf NULL check to IS_ERR_OR_NULL because
  f_audio_buffer_alloc() returns ERR_PTR(-ENOMEM) on failure

Changes in v2:
- Drain play_queue and free copy_buf in addition to cancelling work

 drivers/usb/gadget/function/f_uac1_legacy.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..88c816b4ba119 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/err.h>
 #include <linux/device.h>
 #include <linux/atomic.h>
 
@@ -942,7 +943,17 @@ static void f_audio_free(struct usb_function *f)
 {
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
-
+	struct f_audio_buf *buf, *tmp;
+
+	cancel_work_sync(&audio->playback_work);
+	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
+		list_del(&buf->list);
+		if (buf == audio->copy_buf)
+			audio->copy_buf = NULL;
+		f_audio_buffer_free(buf);
+	}
+	if (!IS_ERR_OR_NULL(audio->copy_buf))
+		f_audio_buffer_free(audio->copy_buf);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

