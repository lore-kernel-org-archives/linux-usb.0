Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F836C9E5
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929397; cv=none; b=RthKWe+0yanuMRNv7yzy91jVQb0AZ82aXsfpg26lTulInur++KNu3+GHnTyH5KkTVUfAPscwakclPT4DygFW9BY9fVfm2k/qYJ9CupJxfD3xPnkiqfduG/hh1fJYFGA7mtDqxJcxLFNdXT+HU56j5in/80PCTr2xiFPuBam641s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929397; c=relaxed/simple;
	bh=aGkpEpTijLt0R3GXttmk2ZIDwTaP52BLkUHmqoWvkU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU+s8FzB0m8Zzaix1ZCbuTvBrg+N6QreASCOJBsuljp/qh07WumPP3IWUxEr9NWmuC0HVMaCvLD2R2+7XF5gNtWagr0D+5Olcjhd7ocq0ehVg9c5R4WF+IHsfpAzeQzapR4xgpWKOi06ylDdUE1fxhmboWxJALT+TOiSN3MyIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNdzuSIh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNdzuSIh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2616596a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929395; x=1784534195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhytyvXbvQFMyOYt3QqcgjFZGx9N0GayBY1QWmFTxaY=;
        b=nNdzuSIhfW/rWJOA+0UOSQja5ocAextfnvIYQKiM+w3gOmOkXROb0oPRw6nlz9jNqs
         kD+dwXpJSSZQNZFqZNwaPOOs32Xv/wX9gi9BkFzMPCZvpF9c1CvrkW3mK/tGVFZBV0w8
         cUljl3wrGRQVmC3UMEL7A/5oxk9ZD4+1BIcNpT8D8qZJNJ+6g0lddmyLEn6zlY4qKPdO
         dcN0LvLmI+r8DXaD6hIPYS0Zh/y9oX9sGqAwuv5p/FgaKPDm/EI95Wd74tVm0XdGDYLv
         HUE8tg9Y6LajNtkZ7u6JpsucNrIETO7CaEtGZKM7zrxfCGzowzd4Awm/IZfV1V0yyKQ7
         C+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929395; x=1784534195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhytyvXbvQFMyOYt3QqcgjFZGx9N0GayBY1QWmFTxaY=;
        b=JxyoSB8FEdv5w13wqRnZRMpdobQvLDQjkqaEnXM0uq2XODFTv84mYDSCb0U+xFBSvd
         pH2m6hRuRG/NduUhIbtHHq2WDv9UTEWhJpUACXRpjfXYSe8cC44J+U0K9+35rfFUxUqW
         QdiqYTz4GMX+jjq42TpitVqn9GUuUwXZkIijNki8QPljk21cdYHuaSzNTdn/wqr0hZVq
         BniXCXXlMFFoyAKr2sCud3a//GdHJZOdn2Y7g53Ldl3Vtn37NqGLQEkT6p7IhJH8S9aP
         Wv1AhBNRRqVSJ9CaPOioG2TKf/7oTWF1ME1wI/YskRAj/b5QTVjE83bJlEt32uafVfkD
         7fng==
X-Forwarded-Encrypted: i=1; AHgh+RqUJw/49Bs7etGF0AkrVvBhaHhqDO/IHg+LMozFbLaN3YHzrbcm4F3vJJiBS9EWLi7B2waPp+OC1eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCuYmIGDKH9fkz0TUqBwS8vvIpm4jWD61fFxRoq1uHyLRFpQv
	CJR0HNiP2ZB0PgRvz0bJf7mrvfo3JynSAdN93b5DXNFGa9P6F+cTR/p+XH+kuxikaWg=
X-Gm-Gg: AfdE7cnUfg3TSYEkts4bdmKw6GW0XzrmgunPfK8ONm2kW6lhbqvcVOqJQRjodhwghq4
	pBnQsYHsTjzunX83T38S4W7AITyk5z2ucbAYbwTkoTY5jBK+0SFMDzTc6vX7SUVvJkTlEHNtC23
	Jh94g50eVDPc48Im69+Cjj2Uh5YeO+E5kZVrdo6yur/SJBV0sbqJkaEqmjB/h6x6YKWKf58KKZc
	ajJreFcRNzIYyUe7HwabS+Gc8kiP+jAmWOffaIz/qJG13QQzJ5j7K/3pwjNl1eCT6WRVA2wKXZR
	nICSTSVejIbUlZ8u5NVQ3YX9Q2adcsEFNUW6cO5oe87YRz0Jak63RlKSLCVGsmS4l6do2P6VrIl
	3JVu4QHNbApBZKYwxOgF5QjhFKkxBOHTH9udhGWYhegQ1+EH+JXXghmLgy12h7iG7shkTf3jaA9
	1bYRlQWhTosE3XegU4dv0lBH9TrqjzCwIU7q8y50BqxsL5MdDlC0uVtyfGKspOpCGMW/6YcPe92
	wmkR3ZKiNqR/Vq3WLseW4KF9admy4IAX6bC+/MY2Vgmu4P9kqRJgK/PNBpHXXyEiy4st/Aj+okE
	nm1qXxXsfIqT9oLo/F6naBj0rnGQAEjAAL1+TSaJy7Xw6GtvhwYoJpPFitLpIkFLWctUSMiGPeD
	GeScqtZl+TOYTV1cbEZs5ebK2BSoTWxKUEw19GRod86s/dA==
X-Received: by 2002:a05:6a21:7007:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c0f093fc0fmr14622290637.15.1783929395089;
        Mon, 13 Jul 2026 00:56:35 -0700 (PDT)
Received: from HEXER.localdomain ([175.157.29.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm43194336eec.12.2026.07.13.00.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:56:34 -0700 (PDT)
From: Kanishka De Silva <kpskanna1915@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kanishka De Silva <kpskanna1915@gmail.com>
Subject: [PATCH v2] usb: adutux: take buflock when resetting read_buffer_length in adu_open()
Date: Mon, 13 Jul 2026 13:26:16 +0530
Message-ID: <20260713075616.1625-1-kpskanna1915@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
References: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev->read_buffer_length is otherwise only ever touched under
dev->buflock (by adu_interrupt_in_callback() and adu_read()), per the
locking scheme documented in the comment above struct adu_device.
adu_open() resets it to 0 without holding buflock.

In the current code this is not a reachable race. adu_open() and
adu_release() are fully serialized by adutux_mutex, and
adu_release_internal() calls usb_kill_urb() (via
adu_abort_transfers()) before that mutex is dropped, which blocks
until any in-flight adu_interrupt_in_callback() has returned. The
write in adu_open() also precedes the urb (re)submission in program
order, so the callback cannot observe or race with it there either.

This change brings the assignment under buflock purely so the
field's locking is locally consistent with the driver's documented
scheme, making the invariant easy to verify without having to reason
across adu_open(), adu_release_internal(), and usb_kill_urb()'s
blocking semantics. No behavioral or functional change intended.

v2:
 - Retitled and reframed from "fix unlocked read_buffer_length write
   in adu_open() (data race)" to a lock-discipline consistency
   change. Discussion on the RFC (with Oliver Neukum) established
   that adutux_mutex serialization plus usb_kill_urb()'s blocking
   semantics rule out any runtime-reachable race here, so this is
   no longer presented as a bugfix. (Oliver Neukum, Greg
   Kroah-Hartman)

Signed-off-by: Kanishka De Silva <kpskanna1915@gmail.com>
---
 drivers/usb/misc/adutux.c | 3 ++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 1111111..2222222 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -337,7 +337,8 @@ static int adu_open(struct inode *inode, struct file *file)
 	file->private_data = dev;
 
 	/* initialize in direction */
-	dev->read_buffer_length = 0;
+	spin_lock_irq(&dev->buflock);
+	dev->read_buffer_length = 0;
+	spin_unlock_irq(&dev->buflock);
 
 	/* fixup first read by having urb waiting for it */
 	usb_fill_int_urb(dev->interrupt_in_urb, dev->udev,
--
2.43.0
