Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47000481FA5
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668190; cv=none; b=kvUOQ4WJwG8yh+VsNufw1FdczZ5cafFGBnmSRMJiLCOKRmyBTQ68sIm0aBZ7cBbKTdCOvB8Gn5rLn3IQiU8H8qh2gir1BfiKvKM62Il9nQPgmlJfD5OLRB7UtJctgEMDPTPK+4vvvu8gUv1XikCpsovFMbZjqzO/nwyi/wIVMic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668190; c=relaxed/simple;
	bh=fP7ZVgo77mek34H/l/6QdsjYQ6XTfRYxEZcesK31tCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOZbQi4dazA175B9NwAliSQXJPMWDPHx+r/dXKpndHtodG2uegrSfYpk/PGYNCVPde/XoqfFEFuUYDNP6HfhFm7JBzBCU92pf5eVOTt0E5SCCp78V/Et6JaHoU21YBjNv3q5hL6HssRwR3fFaPlE7+O6qdAV/JbRpN8oMJrKBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M50q8YPA; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M50q8YPA"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44cd237446cso4432408fac.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787668188; x=1788272988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3AWeXIUE0hbARghyBBXHPbPROSf2bjB7jztp6AV4jQ=;
        b=M50q8YPAvwd9gxWyrVqC7MCgQTaefzyFIW5RROnZO5N1ojETYBv37YmW0NlHRxaY6+
         k7u/L89be7/2I9yfCcINfhLCwMGcc9EguifVwDJgALwFqD82W5533Zx16d/l0QwDNDTx
         0oCfpOdUnNCf2e2aOuLdMxHoUEIYmkTUysElZ+JT3C68dglNgiPX+bxyAi8T1q9AYtbj
         +tzDtvKHPFyOg4wH8W9I/rZBn4mv2q2jxB3ohcZlLB5GYdpqhT3vE9jefWsdhGG6Z7Gv
         Fk6CM2WziCYMZqhRDc74tdFenZfNJDsVO+AM4BIoQTbr1bpcC84ygd0YI38kbMLiAxyO
         eLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668188; x=1788272988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3AWeXIUE0hbARghyBBXHPbPROSf2bjB7jztp6AV4jQ=;
        b=Tq9d81O6zMEt/YIDqky2+I7cRL2GfWxDY5TUoMGWZd22MWVt+DXDOSt1JGA0QY+j93
         eoX7KnKp8JTm/yGUTSjfN3unDzOSP4OxYwW2k7h0g2N2c2CDNF5ggrqsgk4A3pERfxAt
         pgORXp071ty70hrTWesNi8oo8RatH4NDP0pvDN2cIXnBpccjrJRZ0Vlt2t4BOkQDQbU0
         Jr3QtxfN6BR/FWIg725h49mVEWVt43eI+YaOa9OQMG+jG0EM77mZHri/bkm9UeR49L91
         p7d/mbeIp5ZSDLej8zW8mnxZ809alYJqnpkSW5YHMb1OrcWgQ+kYS1daIe29U/JsqleF
         qy/g==
X-Forwarded-Encrypted: i=1; AHgh+RrQRM9hQS63Vk4kpgdy9XQVIBzcQwzQSPxnr3zGRYR9W0h4Xh6GuG/Swe4YLgjG5rDzRNL5+dWUZJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mpasifHrCrFU5yZF9nBDnRoRyZt9EL7wTmNwYHcVjq2Vyb6GT9
	N4Pd1h8uXeD/7iIwpVw51EI2dvIPJPf7fpSScSXn7u95fhfx8f2LbCXb
X-Gm-Gg: AR+sD12Ezb2hJVgf0HqLI1aa3a1ahB9hfPq2w1lxF6PNQGFxNyUXWlY9AKs81mpG7Jw
	mtT5vDoDlFPswed9mqAVUzqB3tX9KeCrWxC9uE+QEtpa5J6kkDfkRxLKLX6Sk76SpbEq6FOucQU
	ITdcE1Mh02QfNvpbOwRqBb5QLnXLET3oH32Rhb96e3kyfYp0li1CVpyibZIDPKmuu0k3a8MP0bZ
	QPUvplXXltEy9J68heaFICpp+j5zBmlnJGYGcbvi7uAnC8jXZeJXLZzRXPit2vCLPBQxrMVs2Oq
	4gUAOlk/8ZjRPEMiQy49K9ktm7UiF6SrJ5IzeGUSkxhXil9pv7WGqi9eHrMgGAJ4hJe73LEKQhJ
	N7zTW6MFaAknw9k0dKzI8BXB7Waa3F4d1N5eikqpCYPqCPjR3MXaODID9z7XtSjBlT7brjMV9Lj
	fbSM0O/3Ivm97Z9hKMTjTajkcEgHF9LnIVO6TY7PtrfwoDTZM5Ac8/q2g2Q6FQB0viLsG5GM47K
	43Pyy3Wj05S+xQn2MHaUH7I1e2XU4w99X/DXHnWbILg
X-Received: by 2002:a4a:ec46:0:b0:6b1:63f4:daef with SMTP id 006d021491bc7-6b1905225f2mr5942939eaf.30.1787668187777;
        Tue, 25 Aug 2026 07:29:47 -0700 (PDT)
Received: from localhost ([2409:40c4:13d:8046:4d30:e4cc:47a7:83a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909c6c9sm43089493eec.6.2026.08.25.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:29:47 -0700 (PDT)
Date: Tue, 25 Aug 2026 19:59:43 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: jjy600901@snu.ac.kr, brauner@kernel.org, eulgyukim@snu.ac.kr, 
	gregkh@linuxfoundation.org, jack@suse.cz, kees@kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mjguzik@gmail.com, viro@zeniv.linux.org.uk, 
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: gadget: fix NULL pointer dereference in
 gadget_dev_ioctl()
Message-ID: <ao2mZdrHdkRTypkU@eggarch>
References: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
 <20260825105801.319997-1-lovekeshsolanki00@gmail.com>
 <903f6c28-57f1-4aa2-a111-910fcfbee52b@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <903f6c28-57f1-4aa2-a111-910fcfbee52b@rowland.harvard.edu>

Thanks for the review,

On Tue, Aug 25, 2026 at 09:14:37AM -0400, Alan Stern wrote:
> Why does it matter that you read dev->gadget before the state check 
> rather than after?  If it doesn't matter, there's no reason to mention 
> it in the patch description.
The order of reading it doesn't matter. The important part is to read it
while holding the lock, perhaps the wording is unclear, I'll reword it
in v2.

> Also, why does it matter that gadgetfs_bind() writes dev->gadget without 
> holding the lock?  Again, the description shouldn't mention things that 
> don't matter.
Because ioctl can get a stale dev->gadget before dev->lock, while
dev->state is checked after acquiring the lock, which is the cause.
Is the reference to gadgetfs_bind() unncessary? Or this part of the
explanation is irrelvant?

> Why did you add this test for gadget being non-NULL?  Is there any way 
> it could possibly be NULL at this point?
It seems it doesn't matter since if read is correct it can't be NULL, it
was an initial attempt to fix but its unnecessary now, I'll remove that
as well.

Regards,
Lovekesh
