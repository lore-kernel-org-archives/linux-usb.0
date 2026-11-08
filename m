Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124292;
	b=rRq/q+9Ko+S8sXPfJM3QAy+HAQKTB0pZkyimBWB+5JFlzqhZ3/66uUu13fhfTKjUVdcm
	 m3xRdXKbadCqrfpimSEcnrDvTbOoizHyokc/O4gU3TqIuINwS8AlCmIZBTZxAbyRdmk5J
	 iWwmQJ16lrQwbbSUQjXlySCNUCalFQGMQzFXSaK0ly+JpC4xFWGUNjd7+CCeTEydfV5kt
	 Kp2bd/dEZXGv2jrLn6z68MBhrMi68jLU10XhHOX1ak/HM3LFB497l2wqDAlpfUhNYDY6q
	 gXnBKiSafRd0L/4TNHz0AdWaYLqBtQCesij+VNh8vwovnLLXc3j2+wl9irCzy9+NdMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
	b=MuXUEKhcL2Qe4VXzPzNHk1mPukaY9m4luRA7xEBbPvaJ6ofSJJxgH9khNDfphq1ZlxfJ
	 kZtNKRjvF45i1uwfSwZYd6RAwgywTULqA3VX4co9/zMGv4oWiaG6NlZfTv486a9od3OEt
	 eBG3Jx40k5A+ztKkvuKXvySshTHVHbhFjRsNx+LQJzE9+kQYdlm5EfV70FV19CJcrxAxB
	 6dsmYPJ1kvKH5bl0ouSP80YcOla0G3rGDpt/15vWPkfFboQbkbX7FtDUPdu2/Ra+Ee8cf
	 Id3Z2nU0alqKfR3B6lJiMGvch3UkiX7W7BmJVlaf/hPIu2sKYrqmBlykL6vLyXx25DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/5/dbHb";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5873D606A321
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5873D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/5/dbHb
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso672515eec.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 23:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124290; x=1794729090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
        b=x/5/dbHbTtV3HzASC0mSTL6DCkKTqJmhN0woh9gHzab72ecWApO97cGLZbtOzsx5Wq
         Drdpr33yCVYl3pf5qHuHgHHxIsWAzuW5gd39HtpPd35teYSnYvdvp3TvP9NDICzy1YhR
         94U9qWczgdFTmaqEAue9gSPLqTeMUia+qAiWIZUANv2f/A0Bc3P+FbfTwTNW2JKOHv8X
         G2UbdtG+OaFou3O4xCQPRzN3poPeWy7zMVjbUfMsOQNCdxDPaYpuxrJZyS7uZhI9Zmzr
         ITBQU7XLcgNpqNXJj7pV/XDmFZD4wbLFwIlT5OlZjmfSJ/Ii+3m/Vq5l2JsH95yThOnG
         Jqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124290; x=1794729090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
        b=BT54OwRpZ/xioJYCF5qI+HRRzjoBUheB2+/H+ikCaGgQlRW6j1V89nwnYWQhGqVgqs
         4/pYwnTMBYZ1/804zzXKZWHey+VDWvnjNQtkkGLwQnOP33Tnt6BHHlsIT31dzcRdf86m
         3ZfZ80cRArRJvUX9gl092JB3n+d3XTVT7DGljDJRgdiJTmm/gTP4jJ7BQYtn7Spa2TI3
         Pue8VbWsAoO8eUXGcZzbDjWXfTLwJpPnXn9Fqf4+LAfNPc3K4+v1kF3l6dPFjwJmNMbY
         s+ZLZFiYyCx+HiThpUlN4YVMx11cfsfWYOCyPAW46+Hs1spLYCUzalst722kyy1pH9Ti
         UP2Q==
X-Forwarded-Encrypted: i=1; AL+hErGwUJPvD2kDbktRJVaw9XSejj3ZPFj/aT5FVazz5nYWGwH70+PvfTPnQZ5iqWnyKn/O0kp1NujlGgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hRZLzJdNY2wY8YJHUSblkouqpeTf+rCoYdzInEfYK1JwKT1KW
	CkqlF2k+q36pbeQnXWBwcLQMNrSM3ESX5Sg2EaXlQAl+4pH/Le8bKyOJ
X-Gm-Gg: AYBFou0//gf/2yGIe+hfVXzspE+pXpnJdCjyvSHTsiU2HH7FXMasxWzA1jTyOQlOcZI
	kpDW3NptNgSSND1yv62RNVovPC3IOvUJWiPWKHnfH15fG0B1Wv0t6m+WSz2fTrDc80laWK/oEd4
	iDTo24dYeo+y7HZa2RQhAS5epATfdl4ZcMY6HvYFj1a+cyl1vgEAKVbjPuw6+03QmY+7Aq7Jktb
	A4Fnsa4tYqdbSuC2jxBnr4OueoIE90m7x8nLKGiSU8IBcTXkBekg8M14T3/ETgxUiMXIfKTMPxs
	HiYZ2znhOBtpgpejf1f5aOV5ssLUCTzd0DCf/gpafZY40muPX2LRp3PxN773vYKoBwDTuFSfaaT
	7EhU6WUJurA35emyHeSDltcg7Kjofans61kGhR+XaLMrqe5FQEbmZ1Op9nSOwX7nrjCnVVDbgOl
	8fhxSsPAKaH5y+zE1/dycskxHi2jUydnQ2F838xBcJ9W7UuU4ek24LbmcNFGsQxy8bpGvyaZuT/
	9Fpr1D1VSBxxL4ORGHb/s4Zk6az2xh7L5NnP/k4bmwdWz55K8b62F0QSSIpErRwZRwCrIYx9tho
	8Plo1+8zBuFaq3MT4fWynXrYBHFeej4JTX7K1HcrIKd/Ni39IIQQ97LK8xm61c78uIaUAA==
X-Received: by 2002:a05:7300:ce93:b0:369:f18f:34ab with SMTP id 5a478bee46e88-3725d77f97emr2096920eec.11.1794124290231;
        Sat, 07 Nov 2026 23:51:30 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm5627672eec.3.2026.11.07.23.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:51:29 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before freeing f_audio
Date: Sun,  8 Nov 2026 16:51:15 +0900
Message-ID: <20261108075116.251501-1-hj351016@gmail.com>
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

The OUT endpoint completion (f_audio_out_ep_complete) and the set_alt path
schedule audio->playback_work, whose handler (f_audio_playback_work)
dereferences the f_audio (audio->lock, audio->play_queue, audio->card).
On teardown f_audio_free() frees the f_audio with kfree(audio) but never
cancels playback_work -- f_audio_disable() is empty and nothing else
drains it. A playback_work still pending when the function is freed runs
against freed memory, a use-after-free.

Cancel playback_work in f_audio_free() before kfree(audio). By then the
function is unbound and the OUT endpoint is disabled, so the work cannot
be re-queued and cancel_work_sync() is sufficient.

This was reproduced with KASAN as a slab-use-after-free in
u_audio_playback(), reached from f_audio_playback_work(), under dummy_hcd:
with a UAC1 playback stream active, unlinking the configfs function frees
the f_audio in f_audio_free() while the work is still in flight. A delay
was added to the gadget streaming path to make the schedule-vs-free race
land deterministically; the missing cancel is present regardless. With
this patch applied the splat no longer occurs.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c..2dca5cd 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -945,6 +945,12 @@ static void f_audio_free(struct usb_function *f)
 
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
+	/*
+	 * The function is already unbound, so the OUT endpoint can no longer
+	 * queue playback_work. Drain any work still pending before the
+	 * containing f_audio is freed, otherwise it runs against freed memory.
+	 */
+	cancel_work_sync(&audio->playback_work);
 	kfree(audio);
 	mutex_lock(&opts->lock);
 	--opts->refcnt;
-- 
2.43.0

