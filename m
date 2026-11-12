Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499507;
	b=UH/dKhn+GNh9I5QvBbhx1QX4GxhDxHYO783ovno9r5hRBpgP6kHlhYwYjGG91iwx3uBF
	 Wnz/2mW8ggUDT0SvXx/wSBN8W6PlPgiOXdhUOqiw8AT6Rzl0BGaat2CBpuFeit3fAZArL
	 VzCnoo4sSjukfle7XN2Pz3f60sgSkVDzHuQh3Yu3SbawO7qN+Uaw6Somlk9dsIUkp6Imt
	 9NLEn7mc9q/M+dEEkFG5uUzMmpUEr75XbSbeDi8pwDiOiKrTf6BzPGQdJFpj3HU+eqUr6
	 Z5Kr7kFpEGmKw5h99bdtdEcimJ3a/hiMufnSen5gdYA8lMzl1JlMvZrwkrCaWYhFNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c5fUWHXnz9/d2cpHdb7ew9JGxO2bNNQHDUJStnqKQgQ=;
	b=IPQGDoLxIO/0LmZE3P1GYnKN2Uk3bF2jIPwM99lgMg5INo7grGfTtVm2rzaRlT1+SxHc
	 Pb+gUplfBB/KMErGYpkWfNY9gNHFXWBMrvLAuCRxqH/Ic4q+GlE3W8vrGI7BkmHjIm3dl
	 3EpKpKzdUOKSwZvI0jAJrD9Vy2wh8mtCHAHVV/HoQ3y9EHA1tAloElrtHuH5G85dUTGyx
	 iZEQphbRC0XlpIMD1utCza5Q5pZ+//IMlCxyAnyHZI6s0bmDWf2Lo06OYm3L4xT2R6iFR
	 CbSAba+A4/PI4XIsYf9+meyVx191NhF0XGMWV2pAUmiudsmIj3noIw1R5B8c9Jn7goQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgxezAXx;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CE5606A336
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CE5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgxezAXx
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dc4797082so1218eec.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499506; x=1795104306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5fUWHXnz9/d2cpHdb7ew9JGxO2bNNQHDUJStnqKQgQ=;
        b=RgxezAXxzugSUgmEKKuaXhj1uqmjMeLkQpSgnb9KDNlzU+jE3UU+hP4THbr/bFvPeI
         k1y0wSZv2YIJQvL/+WX2WxbhPzT/lRSMOfJ8ZU7xcWwGZdeSb0qweWJwn15y+2jBI81D
         yyw2gR1RWk5tHj0CD/SzEFEnE8vz6dbZqQaQXjBekG87IlvhTqfeAajkeQxo3MyuzReL
         b+dGFdPsfwiIMt0ngyGZBcqHuvU7RE8ob/0SqAxPf/V6JU14kx2Kve+ZchnBNeh2VBC2
         +skZga7FN956o3knCntxYOZ6uWICgDn5hzgOwwk0uG3v9PKaWwsNolHiho5F1R9OYNca
         mXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499506; x=1795104306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5fUWHXnz9/d2cpHdb7ew9JGxO2bNNQHDUJStnqKQgQ=;
        b=N6gtAfaFcWwafQDg8EBtjEwgOiII65R1PLszBDysIyS0GxIFua2Ri6g4xOoV/liEeV
         FaymLL92oDTDzgB1mWWHmaWXNC1Ng3rm7XJ633WjWTH3LgT2AF5l2MTqQh8YpozK+J3T
         +jPrfNACB6Z5n465RvGHwEVMV1VOOf57fWEicjubCrjrU004A+Y0SJ/3eRqEwqNpLCjZ
         57kSHX2mL7Xp1LYpKYwpCh8egAPw9eswueP3qRBc2OWBmJ6tVbzZz0CA9uV+J3JzfzCj
         /+vGPySG3C4o6M6B5cufZ4IWr8ibcaiJbkbk9BY0xpJVRFlpbJa1qvFrpajOEvvTtlWb
         g1bA==
X-Gm-Message-State: APuU4Z9EgILOocsRdmn5hhx+68w1/P9Dba2Brly1REQJ1mWUTF8I+RdE
	oC0FNa6vRNToDYP+t4fHVk/6RLXBWgFlcHHPtlCJD/RitJOlbq9NOaDNBYspTlOGEWM=
X-Gm-Gg: AYBFou2ggYmnJzcdYl7KjAjdawzni+Eoi7pj7MeKa7gfWdbWhtz6Ysg+d5VpAUsrX5U
	RWIW6xrHOkmjkHLrjNK91M9r+4miQL7miHF2zV49WwLfXHlFAl4jO5TaXkXshUTHvw6gfoVwG5F
	MsPwMNPwfRvu+d7Vu106uJk7KamTQ+xGQUluOsEqkvEE6+bzTV9RgZFJRBojMbQodDSEqLX6PxQ
	aBFAROMnCD7jBmXw3geDAI7sAbKSxSZaFl8yqSL0nBLDGtr+9QPO9ZaiEVy4zvqmEvarIsxYbMh
	Q9eKWWDsE4uLJwp5VpZ3GP/4+8atnz3mLpKj0Smu4ZtymPMfgfYacMSmkMkRlSUzmIrYBRa9Uqi
	ya4Lws3xuIaYVHshVnSjtEB094H+1XpuAmLe9uCJZc1Wn4q4rvGRZrhjjV6CMWi/NSauieB0N4D
	VW2vKVCMsaRpQg5eCnLiwRJPAQMgWQhstgziRwrKPwAXR/votL8xqje6Efbhzj5T4cIeeafhxGo
	aW5C3J+1HQBQcCmqu0OCSM2oaY0VZM73JPYzQaw23jhw8cRhz828YEBLztgLk36FKNMXenG+0qi
	FCDXdElEcLw0Mj+nUXghh6NfM6AdsT+VpaGZzuE4fU35rPZ7cTHFwd6c5jQCR3Q=
X-Received: by 2002:a05:693c:41cb:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-37680a60bbdmr9273913eec.0.1794499505681;
        Thu, 12 Nov 2026 08:05:05 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922d49049sm613673eec.1.2026.11.12.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:04 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: linux-usb@vger.kernel.org
Cc: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	nkapron@google.com,
	tony@atomide.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	shimoda.yoshihiro@renesas.com,
	robert.jarzmik@free.fr,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts in musb_remove()
Date: Fri, 13 Nov 2026 00:04:45 +0800
Message-Id: <20261112160448.41566-2-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112160448.41566-1-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
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

musb_stage0_irq() can schedule irq_work while handling stage-0 USB
interrupts, and the work can also re-arm itself from the session
recheck path (musb_pm_runtime_check_session()).  musb_remove()
cancels irq_work while the interrupt is still enabled and the IRQ
line not yet freed: an interrupt landing after the cancel re-arms
the work, and musb_irq_work() then runs after musb_free() has
released the struct.

Move the cancel behind musb_disable_interrupts() and synchronize the
IRQ line first, so no handler can be running or re-arm the work past
the cancel.

Found by static analysis.

Fixes: c5340bd14336 ("usb: musb: cancel work on removal")
Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
Build-tested on x86_64: musb_core.o compiles clean
(USB_MUSB_HDRC).  No runtime reproducer: requires MUSB-based OTG
hardware.  Fix written with AI assistance.

 drivers/usb/musb/musb_core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 9b63b56edc45..eea43a20a1d0 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2630,7 +2630,6 @@ static void musb_remove(struct platform_device *pdev)
 	 */
 	musb_exit_debugfs(musb);
 
-	cancel_delayed_work_sync(&musb->irq_work);
 	cancel_delayed_work_sync(&musb->finish_resume_work);
 	cancel_delayed_work_sync(&musb->deassert_reset_work);
 	pm_runtime_get_sync(musb->controller);
@@ -2642,6 +2641,15 @@ static void musb_remove(struct platform_device *pdev)
 	musb_disable_interrupts(musb);
 	musb_writeb(musb->mregs, MUSB_DEVCTL, 0);
 	spin_unlock_irqrestore(&musb->lock, flags);
+
+	/*
+	 * musb_stage0_irq() arms irq_work, so it can only be cancelled
+	 * for good once interrupts are masked and any in-flight handler
+	 * has completed.
+	 */
+	synchronize_irq(musb->nIrq);
+	cancel_delayed_work_sync(&musb->irq_work);
+
 	musb_platform_exit(musb);
 
 	pm_runtime_dont_use_autosuspend(musb->controller);
-- 
2.25.1

