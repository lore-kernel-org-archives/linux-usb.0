Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511135;
	b=bz9Aoacnd2OpgE/fEZBBR5s0uqe+HTJ1jXI7M54W4/iOssJ70ZUFTNNDTCKbwg8lB0yw
	 6aCPf8bHZVWuzSgwIfCVN9W+xXt8VoxxFpETCuhxfFN84KZr1lUcoTpsb/xOAAUkT+v0j
	 Vj5CYFifKMtwFUnjCw1+Bnk9pU5yo+ZfBklwAaSYEMfGKFM8h4uLkUFwAAd+bTtgsc4E1
	 1PNSSMf+KAyAHOmoycbgF0fUbwe7LcJs1tnX/efSKI4v+7Ngo74PkMnd0rsmxQT4Zz+ku
	 mXmlDiZsD67LptGUp/Vb52bnUTGWZKmWa+o0WodDkUve7miygYNUX/NNJE9AJbzywlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CQ4jB6tQUPZO6LegxC5SlNkrSZPGnxBmx2fZBvCkj0k=;
	b=lqtDdl+hMRuRqjizSPldVRZbUrBkzkAQI+xcYdGIy+3wKQb2aXtPV7fohrtneMLG/Ogj
	 P2mD2vo99muO99mnZIEzbTuM8M86hJP/8nC2/5qxABAudjzAIMUpVCzSVNvlcqOSjnaxo
	 n16sKtvZH5jeB1lOE723j8AXYDcIZNOB4oqWyvccSSkGHBI3+hYl5L+9fzqi8zGWztj2w
	 fs8XJn/jjbjyfMt6S5kT9gYPlDRTJ0aC9h1jAmwuGriUkAKtfue/+IvlucP/uJN9J+Xgq
	 eHeCq+FbFMCozYhnh/Ca9TdkqEOUFpu5GeM3jbixKbvJ4JhnhWqo3dITCUy+qZWd7sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c31W9LJE;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FCD606A899
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 19:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FCD606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c31W9LJE
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed00709df0so1834475ad.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794511134; x=1795115934; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ4jB6tQUPZO6LegxC5SlNkrSZPGnxBmx2fZBvCkj0k=;
        b=c31W9LJEm/rJlOmg3G7E+RY1tN7urBRlM4HSAXf9YPCezRBo13fAas5ICf5qREGHjB
         Nm/ZlTvnwm11PMejW60ZMX2vzCxpSdGtpzxRj3Z3IFADHswau77Dnfo2qcpcP4jF9vbm
         c6CRoD9EKIX81q1tMB8estKUtK4k9JZu13wnIJ6SlgCFmdVIJqS8f9kIkiVeD3loIr1X
         qnI05BnMvjDlOfEmNcZckkEpzfp4BCulggFYTea1upSYnc/aMaN+JF2x6mnD1o4RERzq
         iMW4iOVgH7qtVdCkR9NHzT2v2Hu4A41PjNEY+EBXBB/YBbBHxzt/hArnd9SHfnZ4lKdh
         o8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511134; x=1795115934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ4jB6tQUPZO6LegxC5SlNkrSZPGnxBmx2fZBvCkj0k=;
        b=KckfQ7qHOdGOcJgLJ0x7CxUwcuKiq4/FdtJ7Ce96MzHry8OYzYjAA10lvCG5idyHMI
         0DYOBL0jwBmWF53tqkrsott9BUCLBlX3RqSthBQ7XPLNUiX5+4+VKi4frG6CdHAaIcUn
         XeKgk5xL/iOxjeNFT4FXKWY8xicr8WYviIVjIZ9k3hNXBN8VPoN/nXZHevOHTldMDVm2
         zBK/320LKn5nr76V2CPAd+X4K7vZ2SU1A4avVKLSb/2pb6vfKH/yAqpYZDnbjo1KzuY0
         LwkGHmHswPVrnfKUPm+HRJuldimiQU20ZdDOy/2P+0Lslvx077+54m81OjnklcJXKPzH
         cZOw==
X-Gm-Message-State: APuU4Z/xWy2Ev4iIoNPZDJF8b/B7KaahxLNTAf/JIrby2mPVUkqfyG37
	kDsCoJGHKoKppuXu9WwnIRZGm2XyUFC3I4E2br+QhpHcFKogL3nZb8QzBQVGg4kp5HUi+1irw51
	c6box2K1rKw==
X-Received: from plbkl7.prod.google.com ([2002:a17:903:747:b0:2eb:3675:626c])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230d:b0:2ed:e35b:7ef
 with SMTP id d9443c01a7336-2ee0dad1302mr3283865ad.29.1794511134118; Thu, 12
 Nov 2026 11:18:54 -0800 (PST)
Date: Thu, 12 Nov 2026 19:18:50 +0000
In-Reply-To: <20261112160448.41566-2-lui2012qwq@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-2-lui2012qwq@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179451113091.3909038.17914676412025517919.b4-review@b4>
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
From: Neill Kapron <nkapron@google.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	nkapron@google.com, tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> musb_stage0_irq() can schedule irq_work while handling stage-0 USB
> interrupts, and the work can also re-arm itself from the session
> recheck path (musb_pm_runtime_check_session()).  musb_remove()
> cancels irq_work while the interrupt is still enabled and the IRQ
> line not yet freed: an interrupt landing after the cancel re-arms
> the work, and musb_irq_work() then runs after musb_free() has
> released the struct.
> 
> Move the cancel behind musb_disable_interrupts() and synchronize the
> IRQ line first, so no handler can be running or re-arm the work past
> the cancel.
> 
> Found by static analysis.
> 
> Fixes: c5340bd14336 ("usb: musb: cancel work on removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
> ---
> Build-tested on x86_64: musb_core.o compiles clean
> (USB_MUSB_HDRC).  No runtime reproducer: requires MUSB-based OTG
> hardware.  Fix written with AI assistance.
> 
>  drivers/usb/musb/musb_core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 73ac25f53698..c71d0c7f1bcb 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2630,7 +2630,6 @@ static void musb_remove(struct platform_device *pdev)
>  	 */
>  	musb_exit_debugfs(musb);
>  
> -	cancel_delayed_work_sync(&musb->irq_work);
>  	cancel_delayed_work_sync(&musb->finish_resume_work);
>  	cancel_delayed_work_sync(&musb->deassert_reset_work);

Shouldn't all three cancel_delayed_work_sync calls be moved to after
synchronize_irq? Seems like these other two work queues are subject to
similar style issues.

-- 
Neill Kapron <nkapron@google.com>
