Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396075;
	b=n7BBa58Yd4FWFdIsdwu2kEQUcXLOzJzmzT0X1/aSvFIze1VTA8fQ8q57AUvfXSaQCOs3
	 3Fzg4K/9k82C1uf+pUI7msjRyj/PM3IWvaPej3y3QdVfzxFOhiBJSy17ZYgU9m5966RJH
	 JjvX58PlzCKf8ZEn/P6KQ8m4ACNkky52iGBEP1WxNzvuF21CJtWUWlaYkbNiPmrvQ4JLd
	 MYUivUn+UOTN0TcQP6xi9x2DgTwyxK4m9BYtYmB+NfbwjfKHeIlAZR39UigoDGY5V3B5q
	 Z09DrsjoFtYsdHWVkzTbRIaUd0xUxexsxT96Vfwsh4F8E/n8brdl5hqyyqHkm+6tGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
	b=dcyxzs4VQvTGgy4ftMZo+vN8C4etk8fMFIwv/U4D90p8ywJSFxrhhiUsvNRGjtxviGaR
	 HkmCmqmGFvKfP2NOznfxueZLkZw77ZPzCN0kkgUrA6a/ASZ2DXQ2dm824RRABO05EkoWv
	 FDUYYb1UpIbbA2hu/qMn+9pcrND1VYxRNntPlGukGwS5VdCRTjm5tub2KRGvAPS6YKcP2
	 DwN+pNiFqODgpgh23rhEAPHPYxVcn9Ruk/d67SVTZKyxdhfzUsO9ton062feFyjqun1Mu
	 cqPpL8UTP3o0otqXu1f+P1cL4xChJlzxTz8flTQxPfIifNanf0MouGFnYTRHN7IGybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Us1b9MPK;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36865606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 21:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36865606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Us1b9MPK
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67d4bbdffso871742a12.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 14:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396073; x=1794000873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
        b=Us1b9MPK2UkdFkcu8FM3bwwt0idTT53OhPJL2rsEaQj/4F/vgFNF26WjmBSFnyq4v4
         MpfN1SoSaQygsuMoDR5WtCIWphUmN86VvhGEQCkY+DFQiKoildphuWY85vKqM0Dh4yqG
         1DUTmVa2NxREgzm0rXCanf/YexfUlUokBAEyyzLnUmW1NWbgpdFhuRsSkOp98zAu9XT9
         KXj3Vy0l1Msk7esBJDjWmYWdx239d7IZYG7ds/Pt4hcfhwy91zZCvpryWM1X6kynDvjF
         jAiJ8j5AJTf17Sa7OntEuJ2E0VXmTzYTru6vIGA8l9h1q755yD+m7vbUtewBmXNo20LM
         Ay/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396073; x=1794000873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfyuaHVWliYihnuN7VxgyTXmn4J3zXZExhdUzMnnin4=;
        b=0bFR99KOBOSFD7sAFw8fZChFNh/Hxx9Jz+xPAbN4pxbcOb4QhhuBlZxWw8P2kyDPeU
         i/3G1kKmrcSsFNa/Nsz62eHTsg9FDkp6C61fXg2yceYBepPASGACFpHXVfrlEYdXXbQs
         KBnmrKYsaBdGtMJJDJvNXET+4v0xFkDUxTkjWtdZwA41np5cEk+FmT6Jo01nWc105HfW
         z5jjKR1i1qHbZIKG8KOKKAkddD1Ca5asvty47qcWkt8Tl5mvrbhVVVBXon8DyIG1Hcyu
         7ypX30RHBHX0xl6E/s25noPSgvO0tP/MAJBnwi6cfzE09kNI7whVdkMNFBHW5ERs0Vsf
         jcWw==
X-Forwarded-Encrypted: i=1; AKwUvBzrSJIgacTaxWpe2ql0djB20278h1avUYuR2VgfeoOspb2CWeWad1kLBL/ya+VGX9vpWbd4bPK7qlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgy4m5KDKr/BXHZ6ftPyGG47mLgB8k8EYaMhEcRoRGPa7nplVQ
	ld4xU19Z6vig2CtwVLGnC0yauJzPkzNx2hqo3AShtMCgslr7qkKBFjrvt+ucK4xcd5gnstQRiF+
	8tNkgVwQ/zQ==
X-Received: from pfbfo7.prod.google.com ([2002:a05:6a00:6007:b0:89e:861c:6b1f])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2583:b0:3e2:86b6:9be1
 with SMTP id adf61e73a8af0-3e928ac6de9mr3264932637.70.1793396073279; Fri, 30
 Oct 2026 14:34:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:34:28 +0000
In-Reply-To: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailer: b4 0.17-dev
Message-ID: <179339606875.2659781.13239690891562364438.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_hid: avoid copy_from_user() under get_report_spinlock
From: Neill Kapron <nkapron@google.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> f_hidg_get_report() copies the userspace report into a freshly allocated
> 'entry' before taking get_report_spinlock.  When the report id is already
> present in the list it then copies the same userspace buffer a second
> time into the existing entry, this time while holding get_report_spinlock
> (acquired with spin_lock_irqsave()):
> 
> 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
> 	ptr = f_hidg_search_for_report(hidg, report_id);
> 	if (ptr) {
> 		if (copy_from_user(&ptr->report_data, buffer,
> 				sizeof(struct usb_hidg_report))) {
> 
> copy_from_user() may fault and sleep, which is not allowed while holding
> a spinlock with interrupts disabled:
> 
> 	BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:169
> 	in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 3481, name: hidg_getreport
> 	 __might_fault+0x4d/0x60
> 	 f_hidg_get_report+0x155/0x310
> 	 f_hidg_ioctl+0xbd/0xe0
> 	 __x64_sys_ioctl+0x120/0x170
> 	 do_syscall_64+0xf9/0x540
> 
> This is reached by issuing GADGET_HID_WRITE_GET_REPORT twice for the same
> report id (the first call inserts the entry, the second takes the update
> path).  On a non-debug kernel a userspace buffer crafted to fault (e.g.
> via userfaultfd) would sleep with the spinlock held and interrupts
> disabled.
> 
> The data has already been copied into 'entry' before the lock is taken,
> so reuse it instead of copying from userspace again under the lock.  This
> also drops a redundant second read of the user buffer.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..520892bbfbef 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
>  
>  	if (ptr) {
>  		/* Report already exists in list - update it */
> -		if (copy_from_user(&ptr->report_data, buffer,
> -				sizeof(struct usb_hidg_report))) {
> -			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
> -			ERROR(cdev, "copy_from_user error\n");
> -			kfree(entry);
> -			return -EINVAL;
> -		}
> +		ptr->report_data = entry->report_data;
>  		kfree(entry);
>  	} else {
>  		/* Report does not exist in list - add it */
LGTM, thanks!

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
