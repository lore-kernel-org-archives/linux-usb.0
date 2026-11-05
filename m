Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893616;
	b=CQawAKJYbS7oAynZQ53UzeCti3WErLSpQbbAzh92h0nJCCMC3RXWRbPdeWCVjxATxrnj
	 xlLFxTKAx51SXxjZeP7uoyZZqywM9puJsT3LSuqBtCwpeZkTuvnkl4qQgwTiUn7Cwvk5S
	 Di5WIid4uZBaE6SNcjO01OjWZYMHI2gJLahdu6I81hWRDssECMLERQoUBqbedWD0y/uC0
	 PGi9BAaqDoOo9M5TvyGFtysQSIV3vh4k+VVb70sQB/eqigdi11rAM9Q1n6q67+1nb0CdV
	 7PQvTiv/fKhLws3rggdBJ1sUGUwxCI2GybXFCYfejtTDMMT6TrIk5523zFUIqlSVBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TBNp1pWoAJbkMYCWTBcdKSHHUwKLya4AOkP21cmZXs8=;
	b=vCAsSjR5Y89SuDCoxaRWS8daG3lNrgx5uonKKodreJnZCUuSY68QVnBKPRyXP6Pd6V6Z
	 wg6T9kABHqFOUlDiOvxc8ZEZtbTCFD3RNYqSHFlsYaPdA1hvWktF0yuOQADbg8W9a6U83
	 MINyyYZfkgBvCKHwyhv9Pk2SFh3D/iMW4pUXwi+Cg9fXt6hmp3xxPl/aY8+JX83UMvniI
	 fSegy9XQ4QebW/yRaOOCm92+LEg3j4JkxjwHwR2Z16KvGYQkVDMZrZb9yTdm+vPHm9bha
	 AUsnXvN9A5OL6BduzRSuXLj+dolPt7yEHnpehzU0+DMQ618YdRnr0yWfZ+WQCIbajVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="jRUyJGW/";
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76F606EEB9
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC76F606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=jRUyJGW/
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91e7fc8265aso23824046d6.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 07:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793893615; x=1794498415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBNp1pWoAJbkMYCWTBcdKSHHUwKLya4AOkP21cmZXs8=;
        b=jRUyJGW/4Ep0VNRYpiPLW/QkLzfxb9tExjvlhPCVp4fGnj25CgR7N5VNYk52wTq1a1
         wLkt8UhCh79uGotcV7nxodxXCvKzI9dYw+Y+7hkGxQOmgwS5iPahQ/eAygXhTEJ4dTvd
         3lUd+LuQzlO8MEqrrGKcgP+dN3TyiN3n2bwQp8SCZe0GaNaYNcVG3sj/VRvFGD78JNq4
         xF9gZWcSdI7qsVJw7DS5sIH/7xKPyUfMciyuWatAhfM/hmQs0yH+kZ5QuC1bL4iv5dlq
         lLsMGMAwSvtHDDD591Zmr47XnnoSd/vPc1TBuhzuHgyNY98MWekcj5A+W/vYs8r4+y91
         /Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893615; x=1794498415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBNp1pWoAJbkMYCWTBcdKSHHUwKLya4AOkP21cmZXs8=;
        b=nsiLQITMWh1nWPhvj6J5dtgJ74ekaksQzR/1a67C7jS4e5FUxH9Xl+qVzD0/21ktFF
         WPldI6EWX8uQrbHCwvoYPZmufyaK6jaREY7Oo4uuxCj/WeZb6rGWKgj0djKUrCZ1BQ4S
         EGfUDwBaOP95jvpm+BDFeMwxQp/I98HqvHuPFob4x5wZq7qg1e5nhG9tOPmecBPgjHj1
         PIiB7Y8HRfUwcaWxN01aRNZqP3p9fhZDz8FYpS3UeDLdeyChHFSNZCBixpTSGFiFxnGU
         tHWpKmSgrpTr9rNr3kM8FxMtvH3XxXXMdyeEgQPtAaShUiekgxJngIUpLmAarQ+aYXat
         eJVw==
X-Gm-Message-State: APuU4Z+KhgAjzBgqromy+lGWll6YnTfh6JJWChRBZj/0SYaljHNCPgud
	IQwILwSjsLVgw5DBAijWQCOuFbIqkHtp8xPbghRiH2Ocr9ECota5+6+HCuLSoSutAw==
X-Gm-Gg: AYBFou0JqWBEXV51Q+2WPV4fHJ3j/JHohqJxluO9qlrVAAoNZ8WS8vK3h3ICMY34n/L
	HOXm8qF8uLdMbA+Su9CCvyYIJHqa3O62uS/EIPoad7Qr9puLioRE7H7/1Nk2LBPSIw17tdAqfza
	Py8Xcg8lfI4nPP1hWEVE7XRirD08h5Gl933URtRXxJ7lGxf2S6VtsFdBX+f5XK8KcCQIrpDcooq
	Ap8S3QLSDizoCB0aExg7RpJ+CeF1h1JpUD7+tnKMpbPrCXnBpB/LBxHkcBW7m9gVSabjBdjTy8A
	8gIsHTjhEjrvirYEntuH/jSXYixe4/1WBC4yJOdqHfX+Qp9hUb2iR64Qc0mxcza+hoCYuDOERHR
	NTir/V3J+jEhVaFKcI+pMpgYa/Xr85n+TvK+vO3gZGPzpV+tu4SkqbSYa9sBH8g49dt2xTUAKhK
	QmH9iJYBX6MiJ8fQjq70kzcv2Y4f8t1qJSXukoc1TPW7P0ivMFgtCzcKf8tO506+0qmG6aX8uM/
	xPhpGA4x4zR9Oy6tnGCCLhFOkC+wptYxEi/jwnyD1QviZaynMz1hxSA1TL0lZNQJu3udhAn3new
	wq9tKaJeaUfSxwhB2lhseWqOtLsi
X-Received: by 2002:a05:6214:194c:b0:91e:97a9:cf10 with SMTP id 6a1803df08f44-91e97a9e3f5mr32883476d6.53.1793893614305;
        Thu, 05 Nov 2026 07:46:54 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9f2a9bedsm10173536d6.35.2026.11.05.07.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:46:53 -0800 (PST)
Date: Thu, 5 Nov 2026 10:46:51 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Pengfei Lv <lvpengfei20@huawei.com>
Cc: linux-usb@vger.kernel.org, michal.pecio@gmail.com,
	gregkh@linuxfoundation.org, sashiko@sashiko.dev,
	xuhaiyang5@hisilicon.com, xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <42954744-812e-417c-94a8-d659f5add27e@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
 <20261105084159.1495843-1-lvpengfei20@huawei.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105084159.1495843-1-lvpengfei20@huawei.com>

On Thu, Nov 05, 2026 at 04:41:59PM +0800, Pengfei Lv wrote:
> Alan Stern wrote:
> > Quite right.  Why wouldn't the device reply with a standard 18-byte
> > descriptor in this situation?
> 
> This is the key point, and it also answers the later question about
> why the device ever gets through initialization:
> 
>   - For a 64-byte GET_DESCRIPTOR (wLength=64, the get_bMaxPacketSize0
>     probe), the device sends exactly one 8-byte packet and then stops
>     responding to IN tokens.  It relies on the host's short-packet
>     detection with max_packet=64 to terminate the transfer after that
>     first packet.  Both the 5.10 and 6.6 captures confirm this; the
>     device's bus behavior is identical.
> 
>   - For an 18-byte GET_DESCRIPTOR (wLength=18, the
>     usb_get_device_descriptor() read that runs after SetAddress), the
>     same device sends the full 18 bytes as 8 + 8 + 2.  The final
>     2-byte packet is a short packet regardless of whether max_packet
>     is 8 or 64, so this transfer succeeds on both kernels.
> 
> So the two GET_DESCRIPTOR transfers are not the same request and do
> not get the same response.  The 64-byte probe is the one that hangs
> when max_packet=8; the 18-byte read never hangs because its last
> packet is always short.  That is why the device can complete
> initialization (the 18-byte read works) yet still hang on reset
> re-enumeration (the 64-byte probe does not).

Okay, this is a good point.  It should be mentioned in the patch 
description, demonstrating that the problem is a real one.

> I agree the device is not strictly compliant (it should continue
> answering IN tokens for the 64-byte request).  However, this class of
> USB banking token is widely deployed in enterprise environments, and
> the regression breaks a configuration that previously worked.

Mention that too.

> The purpose of ff33299ec8bb was to stop overwriting udev->descriptor
> after registration, to fix a syzbot-reported KASAN race.  The ep0
> wMaxPacketSize re-guess is a separate concern: udev->ep0.desc is not
> part of udev->descriptor and is not the field involved in the
> read_descriptors() race.  Would it be acceptable to keep the
> descriptor-immutability protection while restoring the wMaxPacketSize
> re-guess on the reset path, so the xHC ep0 context stays at 64 until
> the real bMaxPacketSize0 is re-read from the descriptor?

Yes, that would be acceptable.

Alan Stern
