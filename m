Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755706;
	b=cktH0Qh5wZzYLo6fSOOw99wxdBJMabgPq5iGEtHPnFaoi8P6TWFTqVocu0q/x4IdU2NP
	 Ygz1Ty5srXJYFskw5dWGQrjp+wojmQf9QSiUmL3cIiZAMUuvTNk4p1ItcGi0DXj4aZxEo
	 grEG3W7U+CDykswqSpoYkVbJNDJn386hvr621WRNPlZ1aEFPXyi94Ah962vIjtjU7Fvcm
	 nVh84ce5co20ZV3ThgfFGRtipvUnpHDSQt+unXFxRUit6Fkj2/g/8L8CqpE53JEvEhjVs
	 PjsjpDvNESWoNPKAoYnf67wCA7MDxwIs5BiEITruAydttWWr8oGPM7YcVayyR7i8m0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
	b=4R4Sq8DBendYaOUQnCz7wiqCWF1bpLZCPJMq52ZoYrLHmx7KEoj4/d33TkT1IfI0zyEA
	 9EeJpBYce81keivBawByYrE7KvTRmwUYQg+OZza6EmiLQSqfXfpKSD8S0qZjnFQH9QVYA
	 tmvStRx+O9xJDO5D688hbu3FU57HGakajoBQAh8ThMOIHLYv68Dx+aGh8LtTWMCZ3Xl7I
	 5UHWcqtP5eUki4r/JfHtMgs3BIRj0tHZAtfilxgWT8BjkH9FTVcD+jzvYvqyzOVUluMxa
	 0YCf24t+lSEqN42ujJuw54RJDN+tmAHKGWc9Qy3Nao0hIn8Rft7cxJ4qPVw7WrsWG1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJhMxTyc;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C3606A331
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 01:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788C3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJhMxTyc
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so83021f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755705; x=1794360505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
        b=HJhMxTycCUfqPBAbNdRZq0fbvxLcBFVmpm5hNmv4XI85OBDknpn28HOhjyn6y+wipA
         7ZaleVLYsbr/Q3fg8neLy8Wg/iPAKLxTRUr6Akl9CY8JgJ8YdrZX2tpVyILH66KhQUDJ
         v7fw3y9y4flULZb3UJ+zvN7Pr9mH5UNIylfOsVNm5gUfoekVspPGrVbyquiLfqp1gkbm
         xxE6PjWSQWBpZfQm3eZ9RhEehwjYoZhYIC7mgyQnLRk8ZmziAWC2FcC3rV5e26YXNtT2
         fEddyhh6+d0MYJLF5GWE9ngWw7oEAW7+uMOaYUEZSK82fsJO8rsWgUa0hEK36NRW1Pdb
         t45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755705; x=1794360505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
        b=Uj0HSSi8VGsd4GsDQgjHwMMTc9ApMBZ6VVmMV48AtO0OMx3x5qKpH6mqiJ6XvB+uk4
         SyX34yc3dWm4d61OBpPHghi7zkE+rDQZhPNBmlsmW9otaPGvPTyx71JId8JlFymtyNl/
         EzqgBIck8OnmVXBxMZw1lCRxFq/sKugsTqJJkBS1PBKwkWeJH5uij9uiGY9LoSEBDEjc
         MhyBy2BC/9OJQWXIZ4MZt7rc7StT4MO6LoSEFSBqNBfivEEfHus2xyjppmFPeH+oWY5J
         Icy+Y7vbdR/1fyIjnf29x6d0OgFruOFHw57WfKw1St2NNtT1GZTOS6GMA/ZfOR0o9wju
         v1fg==
X-Forwarded-Encrypted: i=1; AKwUvBy4eLfpcaBMF2IctOeoNVvLpxB5xJu/EWcx/nAhG+xXjRP6D0HLC1m3yy8kTgFA8bJrtAL47ORLFY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CtwprYxP8FMVKrjNI5qCI7WVY9XEu9GGl9zHFF5GD8b2pPRu9
	7Nqb2x2lCZLoGyTFprsI9APGx2mYBFlLzdyasHi78PNRROfGhR8BSSU=
X-Gm-Gg: AYBFou24+KmYDH3LvwsImGENrYYWI5p6MCAWg6217AtDDMZ+1AjQWLScDkmNHLwMTHG
	B0faztuxZjhHSs7GkNcHaAUl9Oxczwo+PhJ/GjnCKZfl34zjWa0TsMEsN31YST0UvK3tFpm6rpN
	q33pve8kUrMc4iZk814HT3/DudmQolfZEW3Q/2MHAygBNNIpS/vcxYOMxyqYhRiW7F5WwKN8qz7
	xkAe5ASsbNRqoVGbtQRp3EHNVWquJissW5i9hzxbTFOWyPi+z/VBZhgWzOofmrZSwQZeQZKksh3
	/xSiOxik3S6fNv/m1fNJ7l+5XdHmZC0E8Gv2vwX2oTU25up2HWGYINcA3evICJUYGlHbCnLQX2P
	M7SR++q0PPAVfAN+M7yS6F013z3ck8s8gd3koI1lk+jG9DnwV4EXXqu8wHc+7DHkKEPPrOI6ndI
	XSH543g1SN2u8vLrJWhjnFn9vrILWBgK7qne95rpTZNmPmpWuLllKeJHP7j0gyLLQ4rMs+VPaOq
	LuElaYQa/rFY6JjJeQVGtivV6IT6b3oHH4CUAFWMY2U/uiaddJP64evhF9dBcLBxUxoQEFf/A==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr33085390f8f.56.1793755704707;
        Tue, 03 Nov 2026 17:28:24 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm898557f8f.47.2026.11.03.17.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:28:23 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan Wu <cooloney@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2] usb: gadget: f_uac1_legacy: cancel playback_work and drain buffers on free
Date: Wed,  4 Nov 2026 01:28:21 +0000
Message-ID: <20261104012821.3253258-1-tristmd@gmail.com>
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

f_audio_free() calls kfree(audio) without cancelling playback_work or
freeing the queued audio buffers.  If a playback work item is pending
or running when the function is freed, the work handler references
the already-freed audio structure via container_of.  Additionally, any
f_audio_buf entries remaining on play_queue and the partially filled
copy_buf are not freed.

Cancel the pending work, drain all queued buffers from play_queue, and
free copy_buf before cleaning up the ALSA card and freeing the audio
structure.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Drain queued f_audio_buf entries from play_queue and free copy_buf
  before kfree, addressing sashiko-bot [Medium] buffer leak concern

 drivers/usb/gadget/function/f_uac1_legacy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..9fab3f9c8b9d6 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -942,7 +942,15 @@ static void f_audio_free(struct usb_function *f)
 {
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
+	struct f_audio_buf *buf, *tmp;
 
+	cancel_work_sync(&audio->playback_work);
+	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
+		list_del(&buf->list);
+		f_audio_buffer_free(buf);
+	}
+	if (audio->copy_buf)
+		f_audio_buffer_free(audio->copy_buf);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

