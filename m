Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB54C9E0C
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163322; cv=none; b=YdZcCgGKv+qqtN9lcEvXsgSZtCRrKhoF7YDBTi0OrRYozuUarJY2ILT6OjXvo6x/ZHUjP4XhiUpXf7rOnldcAqvZfIFfAsSk6OifkB3QKymfNsVFWkqVkA7bXpCRIib1enj2CmbhqhqjWJnoUjzOVm+KaR8jJ4jfLga2c2r9GJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163322; c=relaxed/simple;
	bh=9U/kkAy5hwvAhwUg9vFQfRBjT/HphVatqeqejnZQ0kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHds9CJa4X0Dav5LrI5N3O13+fKm6wXX9q1+J2PWa9igk1eUv2g6WeCpveFKaT/QYhgTRXX6oD2k0UjU6LdkGL1z18l1N/E5BRcTnKkHbpLFgkK6+8UTkGuCijJx4N0L/NHyGa1R65f3xUSlcVJyE9YclvcRm08hz8JaHBlNCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vSU1U3N2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vSU1U3N2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-534e6545939so22503061cf.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792163319; x=1792768119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTDTxc6bSklEDzSyt9fmhc+/XaQOcj48Uz7ol1WS8+Y=;
        b=vSU1U3N2Dsoit0P4c2DZqgt5QiWmKZ8WApW4JV+0f4E0DWWqlkb6sXQopVNwF+XuJQ
         1jCKJbI2S3iwbuEO6MPykVJbGxR34d28+3mbY4W07t4Vy+G5OTd0n9z+9upqpa9yRLro
         9n24XC9tkp5QDxNzrGnCsKWclSTf+2bSJg2NdVn8GRz0CI9XdUvEovhd3Vz8IaujcBXk
         enQgW3bPUm8MZDEuyTRMNmmPPCYw8K5qrI9ZeB593lRyF1jAnHWvFHpOZT1fJF9nwrTr
         17FcZW3i5tL96kpzlw8gtJF7mWy9QOl2b6VOoxqucKE/2vd+SWUBwvmkUdb3QsGnQ7nO
         paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163319; x=1792768119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTDTxc6bSklEDzSyt9fmhc+/XaQOcj48Uz7ol1WS8+Y=;
        b=mZVwKV+v1L/O4SLYt/RK4Otb4siKfXEMmiB32KzmzQLJzmfNGepmJtuCCq7JxIG3VY
         Q8pybOxkAbxMeLFweqE904N/dvC2NwcAMVIrC2k/qyq+CwaH6hYGd7nDjkInL9VhGF6U
         t6QliNTd53VzCEiXwvAW8HsXOtmxpYHzFO+9RIlJwqTLdETZI42Vwsyd9u60ZXOV/gdq
         SPStN20Tu2TywfePyhw05wPFRdIrVGcEozwINgQhJN4fJldIHrgzstjm7PPV2WRFuxZE
         Qv5454B1cDxYl2fSL1tpHmMo9/EK9jvMGTUvMdpeKxJcZGvaaBRjPuNuN+7HqgrZsnfK
         dejQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhoFH9BvFQi+bFBDh9/QWVcy3q+Zhbfc78kH0hHU++oHnCA/UKbNWi+49w5SrqpFdheLBnzjieOzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaabDemccOKaQ1ANfJphzIdY4i1GbQC6as71dVz8LiHXKSWmsO
	+cZbP3Njw9URj3i8VRSH6gla+t4X/k6Wk5JLdH5cGHGYEoZaiGA2NJWeGYcN31tqiXKs9nll2Af
	Ox/dEFQ==
X-Gm-Gg: AYBFou2szxFH6fy4qZMjxLsSsoefnuzCGY+wl7qKhXcnLha5T/dKjPiSc5XnonLD9X+
	7YuntoZ+8nSASMLakwfTRg+fQNyU+e89F4sRyQt6R4oRS1mJlLFRpYEG24+glpudrkA5DL8xlLR
	p+FATYteVMguv1c5TE/u2V57+H0ULBWGdDIeIcG+K2RSGSNWn5scWSX7wDSH39/l/5vKlUtKSW7
	41n0H3qVpYon4ETaj4aL3gO53RxkLSLg6PsLfAW1gqLUP65vVnJDTsXA/4YKERPz2Zvl98j5fHp
	Lq2mlh+KVJesn/4xK5uD4b74RKss5Lr5TK58al0xFAwiukYKq1BqtktrtrchIypHlFVxVHRp/Zj
	r40qrlYtMhunh2u/1d/VAJzXH4N0XEh0DapJXkcjh6awFflBdpfU+h7H9Ajxn0owU3WeH6vqC67
	CNPJzr4hy5b1IWUX8gvPRyKlq9lxZFYxlQ5nBWGPmhMKhZsE4j+8D/sv2Q5KXlOOd+SKkKsj8=
X-Received: by 2002:a05:622a:2445:b0:535:6a51:1f71 with SMTP id d75a77b69052e-5359fb86868mr362986661cf.54.1792163318743;
        Fri, 16 Oct 2026 08:08:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm24682156d6.33.2026.10.16.08.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:08:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:08:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: usbtest: reject transfer lengths the allocator
 cannot serve
Message-ID: <e75fa62c-80b3-4a8d-a82f-1b21033e0cd1@rowland.harvard.edu>
References: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>

On Fri, Oct 16, 2026 at 05:48:48PM +0800, YuanZhe Liu wrote:
> usbtest sizes every buffer it allocates from the user supplied
> struct usbtest_param::length, but it never bounds that value.  The
> scatterlist tests, the queued bulk tests and the unlink tests pass the
> length straight to kzalloc() and usb_alloc_coherent(), so a large value
> reaches the page allocator as an allocation order above MAX_PAGE_ORDER:
> 
>     WARNING: mm/page_alloc.c:5340 at alloc_order_allowed mm/page_alloc.c:5340 [inline]
>     WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x4ae/0x1fd0 mm/page_alloc.c:5397
>     ...
>      alloc_sglist+0x331/0x500
>      usbtest_do_ioctl+0x2686/0x5880
>      usbtest_ioctl+0x440/0x720
> 
> A run of "TEST 7:  write/-7 -2147483648 sglists 3 entries
> 0..-2147483645 bytes" asks kzalloc() for more than 2 GiB.  The queued
> bulk tests reach the same warning through usb_alloc_coherent() and
> dma_direct_alloc().  The allocation fails after the warning and the
> driver then returns -ENOMEM, but the warning itself is driven by
> unvalidated user input.
> 
> Reject such lengths where the other parameter limits are already
> enforced.  KMALLOC_MAX_SIZE, that is PAGE_SIZE << MAX_PAGE_ORDER, is
> the largest contiguous allocation the page allocator is willing to
> serve, and the unaligned tests add at most one byte on top of the
> requested length.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
>  drivers/usb/misc/usbtest.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8759df49be28..8f2a4752b9c8 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -2192,6 +2192,15 @@ usbtest_do_ioctl(struct usb_interface *intf, struct usbtest_param_32 *param)
>  		return -EINVAL;
>  	if (param->sglen > MAX_SGLEN)
>  		return -EINVAL;
> +	/*
> +	 * Every test case sizes its transfer buffers from param->length,
> +	 * using one contiguous allocation per URB or scatterlist entry.
> +	 * The page allocator cannot serve a length of KMALLOC_MAX_SIZE
> +	 * or more: the allocation order would exceed MAX_PAGE_ORDER and
> +	 * the allocator would warn before failing the allocation.
> +	 */

This comment is longer than it needs to be.  You can just say:

	/* Don't allow unreasonably large transfer-buffer allocations */

The details about contiguous allocation per URB, MAX_PAGE_ORDER, and 
allocator warnings don't really matter here.

Aside from that,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> +	if (param->length >= KMALLOC_MAX_SIZE)
> +		return -EINVAL;
>  	/*
>  	 * Just a bunch of test cases that every HCD is expected to handle.
>  	 *
> -- 
> 2.34.1
