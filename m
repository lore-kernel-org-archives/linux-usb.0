Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C353A1C9
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 05:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786772447; cv=none; b=lksMGw6RLkRTao+d7wS+K42h2uMoIgpY96SHzqNyz5L/ohFzAivHUOQjcgffhIui1B5PMoBDO6nXhK1y2ClLNYJrJv1MsNw4qNsq5WrDPyls0MR8GjbC1EW5P2d3MvjOA5gTTgAm3peol5tN8WrJCl4Kr4OXt86/cFzuDUzCOc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786772447; c=relaxed/simple;
	bh=RKr8wDx4vfIVDxaydRzoEQ7U5kq6zGMwRmAGuw0kiFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lbeBOMy0fMONJVYVen2OwsjbRh3BRGu63JO0KAjDO076ecBYwlRPPt7dqpLibkj0hZSXLJZOS1NIj3uIXMz9KBEW7SJyn6KCp9WvdZnEwrZfD0OPy/qPEDtxpvORu0qX4ADEAloMbv0jUg0VQmJTQ7WmyVySCPdbPSitv8LuRtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqSFZx6V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqSFZx6V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc97653887so29313095ad.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 22:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786772445; x=1787377245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRZrKjh8gSRFHQ09WnLqzB2J4uOH4YDnOZFIpu3HY00=;
        b=QqSFZx6Vi/qMcrp+18GwQQlQv7VzP2kxObCUH5kH0AsBU4tsGpKFb7MKOg4QwvK+y0
         H6vobr1vPQ+Kminc2iuX73uGHwNpkh0jA9LDQEFhn0ebyt3MOGKromX2O5Z+1DxyJIk/
         shKxzYzOBiIeWCVTBASGZq3KhqhD7Kq1r/OXXB26LgjWX5ZnEu28xGLBn3YhDQcjAGBR
         BFWgdvC26uu99Yze+QECbiL+MbGChCtqc0i7vznLbxDOlcxBUzkT8bX9mPZNQ/9o9GOR
         tcgE9hHuFEWP9WhjJsVLAq81uR/GVs+iBQTeEUPrNXr1g+l8ZlaMmKeNcMnHwMRDs2Kx
         Mgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786772445; x=1787377245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRZrKjh8gSRFHQ09WnLqzB2J4uOH4YDnOZFIpu3HY00=;
        b=HPF/tAjXQqiPVY0RQUJcH6LbWgEFpomE5LwMz+Hjpn/6AkGmK1Y0pwlemoWkVAScNs
         cWMbKsKGvueWYmhfaxdjcDtUjv6ysyYn/7Odq2t3FatStpfgwSZOFpcB3bEag3iEBjJB
         c07UjRZ5cfvr4jKlEHgZA3AJ345EJcLGLAgrIDI4PMkPCfDl/N8Es0C7Zxpw2YWql6ST
         ArH/2+R08enbFBfEgSvPIMfPEC6iDTzRFiEEnF8j/Vu6yNvdlO7plBCocB0gOvEmpvuB
         chTBOW8hHJASWudV0CwC6VAx0MEzG328O/4bCz6uRhAz4OrwO7/OwHplp/85OIgOXMKd
         Y2vg==
X-Forwarded-Encrypted: i=1; AHgh+RrwNdsLwCcMf8oVPookFTe5ZGmzrTJ4e6vFLYH/Iy8QCNiHXvDw4fn6Dab523jtQtEDdN/rI+rpfgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZCEnS6F9BlXBB+wlMgJuB6cULwpFW3YZRN+jAayxkcnCariC
	ZJkHpLF/kS6oc9TUEKr7xK1fF1jAJ7xi9iljJG8zTZPZs/vOAKOuh9ns
X-Gm-Gg: AR+sD12d91ljh9H7tgK7CcuFAmv32+TKBgkIPG6jUWAL7kOTAxANJELHXn5pQjjjWGM
	peNdXQngQCiRK7HRwaJ0GH3+/4lXsflFMVSahxdOUjje2T5adxn5m76MyUK0Y2UzQFKBqqNyISC
	uSRylSYQHolJi6xKhIxaGZXGGo272zz45+ylK39pud++ZZDv4RHSBGzFOQ627H/5MImEcpQVJPM
	UfCf49OCq0lpi1aWoA1IFoPyD17zyWFMyiXQPSXph2Ot/M854NdlnMjDV8eEqzrBmPUyyypoKBj
	K5iMFZPtEOwU6QZPQpylZzGQEqI/uR3n+RN3C8yBTRqRqH22zqkzSMZdatEvCVcgaGlIbvX1Fbh
	i6nc9k2c8r0bkXd4xOHAWu0Ff6+PolXU7xHZlNDrJCBDwdD1u/wAbbUHjqiv/NaEkfULvEtnFMF
	bwvwp/PPlgiV70k1KjibE4HHm/qa+gaqsamFbgaUCPWm+pzQouFwwRgx0cWKdE49yr4/15NQmhv
	T2QIR2YqQ==
X-Received: by 2002:a17:902:fd90:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d3b0d16339mr129547175ad.7.1786772445466;
        Fri, 14 Aug 2026 22:40:45 -0700 (PDT)
Received: from Default ([2409:40f4:103d:c2fd:25e5:83d3:7385:6296])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fd3sm11025097eec.4.2026.08.14.22.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:40:44 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jeffinphilip14@gmail.com,
	victor.krawiec@arturia.com,
	fanwu01@zju.edu.cn,
	christophe.jaillet@wanadoo.fr,
	kees@kernel.org,
	balbi@kernel.org,
	tiwai@suse.de,
	dave@stgolabs.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+d5fa3d224505c8610702@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_midi: initialize work in f_midi_alloc()
Date: Sat, 15 Aug 2026 11:10:06 +0530
Message-ID: <20260815054006.102325-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_midi_alloc initializes free_ref to 1 and it can only be incremented
when a sound card is registered via f_midi_register_card().
f_midi_register_card() is only called in f_midi_bind() which actually
performs INIT_WORK. If f_midi_bind() is never run, work is not
initialized and the if condition in f_midi_free becomes true,
this results in a warning later in __flush_work as work->func = 0.
Fix this by moving INIT_WORK from f_midi_bind() to f_midi_alloc().

Reported-by: syzbot+d5fa3d224505c8610702@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d5fa3d224505c8610702
Fixes: 8653d71ce376 ("usb/gadget: f_midi: Replace tasklet with work")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/usb/gadget/function/f_midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index fba8cf787d6c..63fb6ee70a3d 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -879,7 +879,6 @@ static int f_midi_bind(struct usb_configuration *c, struct usb_function *f)
 	int status, n, jack = 1, i = 0, endpoint_descriptor_index = 0;
 
 	midi->gadget = cdev->gadget;
-	INIT_WORK(&midi->work, f_midi_in_work);
 	status = f_midi_register_card(midi);
 	if (status < 0)
 		goto fail_register;
@@ -1377,6 +1376,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		status = -ENOMEM;
 		goto midi_free;
 	}
+	INIT_WORK(&midi->work, f_midi_in_work);
 	midi->out_ports = opts->out_ports;
 	midi->index = opts->index;
 	midi->buflen = opts->buflen;
-- 
2.55.0

