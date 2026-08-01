Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEAA19DF62
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606750; cv=none; b=CFNRm1a815M8/RZT0zC5OYbylK9PP38lOAjDN+kxYEt9R7slUY9LV4VRtXRxr408AiaBODTeVEziB0XT2pPqY0eT3zX0CpDnqxlkDob8sUUn48Ky31TCbg7DIMolkVeof5oczBksW5eXVzMX2x8RGkcFmwB3Rycwh5IAjk/4bc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606750; c=relaxed/simple;
	bh=CN8lCbjOPm4TOFV9nJyVIO99LhiZFBhrHDxy0j4KWHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR2scDpH+bx3ulI0bPRUQRI0UXNGVqiNlwCgyRs7WWjMCf7yldvZq6l5vX9jov8wcboHFszBAOv6gY2M3Sf4I8Jouao90m926ven5oe+VofBQK7FaoHuva3xg4NwqQ4Ln6wWW4cFEmZQIUdzgvHzNGMTFxQ1pNWvYAFMGntRd7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sNa7Trds; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sNa7Trds"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-529a1ee0e62so11398471cf.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785606748; x=1786211548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9OH2yC46tYUCnGBhL3FzFc0UA4QFkh4JjS1u9WIUcE=;
        b=sNa7Trds/47yolpS5l+ux+3cqlj9UaaiBB4G9cVxNzS9OR/BH/Y5ZZa/LaHWUycugj
         azG/YZgBuiH7Gecv8c2weG/wrJhh5GfS7coJc+4se747FXaLngwuZbkW7nXm8I2B0RAw
         LueFABqnB6lDD2MqSsmWaIjiTEwcXl5WEPC+DjNeTyqaM3Q/znFhOSOwU1+jIqXWuAmT
         xmfqgYNFwR8wKarvcyWJZVcE1o5y8drD2smK/NaxnQ6VraVXWCMX5rBKl5kI/8kDmbQm
         kxp4CXY7N9rZAXj9dZYvNqWBTJJ+FXOzS6Og6c8ifpueGh7zspGh61U7bvJ4D6ZbR9VN
         Suqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606748; x=1786211548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9OH2yC46tYUCnGBhL3FzFc0UA4QFkh4JjS1u9WIUcE=;
        b=WG6NB+BAm/peGxaZY1FNUK6mTQ8Eh9ZE5JaboOm+17CTySd4gjXf8/397ODdfTkNM+
         zSjDxYY9j/zl1QEdeuZMjptgiubv4JM0YUtCLz/B/m6luS4nZDvX07odhXkFsqhdrkj8
         VMr2SsqG7yzr4WEntjQYSbBUpdOVLUNARxmllRNAQFJZyKrnHBa/IKo+jlmZt9f3tBm1
         rTRR3FuSd2InhMcTJaMH40mBo24wdg34LOOf0/K6jwHPjJbThRIkE1DEPJOi9Q5gc/57
         kMofoC2KcoTzF9se71PdpcePthi6+puuWdo7ZghwgdP2z2C29+XNwv+mh+YKSXXUNp2t
         Dr3w==
X-Gm-Message-State: AOJu0YwtNVzJVcK+Bu/rtN7gdem6nBHiNaG8dpoVRGm2lQMNzQduOFxV
	gXvVxJl44SEvCQAyEYl3DV1hC8G8tc9qmN2h2RAAyRNiNQ8ehERLBVV8bHCMYVdcMsQRS4E6Lp4
	qhoOB8w==
X-Gm-Gg: AR+sD13/Nvwer7DtsSEXuYXTeCgo8rOuHMqD210VAqbO7KJ7qt+YH7lqpW8qyW0v/N7
	MRxSAVUxcHMJfM+gwy9GdjkP+sBf+wNYIQ/w4kbEUYUEJrdeVDLNfidKT8DOPogOH+7OJJiZ+YE
	OamCJo5LEsWykI4c3jKhLu3C70exQ9CfmDBSNPXNhtqMGdLVw2YMKsosZiKQvYhKFaGpR1Tv3Tn
	kAdjTknwQXIjU7YkI8u8j11gmSTdDqIElZOwD3waI6GzuaEbcyDHcR2lb0XZO6Ij2hRnCDviRbH
	5nL2/9vBWwkr4OqapYy9EoPrkynCrovvQbrRCIpFuWGf32XxqXwNclMcvw2e7+Att5rkSA/4msU
	WmbjcO7gZVnkfTA1A1lCzBPDVXW37g7c5R5sStYcqAZ0SkfjB7Pkt7jfdvnp1fDPJ5G+fwQZbcF
	WneAHPshqMaJ6heCuqpVsIhPEiGLIBoAJ5ZIZqj4ujpPv/YkBAOO1yp96uFEixCA==
X-Received: by 2002:a05:622a:c07:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52b56845401mr96623791cf.41.1785606747551;
        Sat, 01 Aug 2026 10:52:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908432a0d8esm37605456d6.9.2026.08.01.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:52:26 -0700 (PDT)
Date: Sat, 1 Aug 2026 13:52:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb-storage: Add US_FL_IGNORE_UAS for JMicron JMS581
Message-ID: <c2a338e9-cbe4-4f53-a2ea-fa6838352b26@rowland.harvard.edu>
References: <20260801104751.277572-1-chris.bainbridge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801104751.277572-1-chris.bainbridge@gmail.com>

On Sat, Aug 01, 2026 at 11:47:51AM +0100, Chris Bainbridge wrote:
> Enabling UAS results in a 30-second boot hang when using a JMicron
> JMS581 NVMe enclosure (specifically SSK 'SHE-C325 PRO' with a WD PC
> SN520 NVMe drive).
> 
> Fixes:
> 
> [16.603548] Bluetooth: hci0: Device booted in 26690 usecs
> [46.617796] sd 0:0:0:0: [sda] tag#28 uas_eh_abort_handler 0 uas-tag 14 inflight: CMD IN
> [46.617859] sd 0:0:0:0: [sda] tag#28 CDB: Read(10) 28 00 0d 28 fe 10 00 00 20 00
> 
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> ---
>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index ac22fa318734..26f3a5809712 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2184,6 +2184,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
>  
> +/* JMicron JMS581 / SSK 'SHE-C325 PRO' NVMe enclosure */
> +UNUSUAL_DEV(0x152d, 0x581d, 0x0000, 0x9999,
> +		"JMicron",
> +		"JMS581 NVMe enclosure",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +

Please keep the entries sorted by Vendor ID, then Product ID.

Also, how sure are you that this problem affects all enclosures of this 
sort?  And that it doesn't depend on what kind of NVMe drive is in the 
enclosure?

Alan Stern

>  /*
>   * Reported by Alexandre Oliva <oliva@lsd.ic.unicamp.br>
>   * JMicron responds to USN and several other SCSI ioctls with a
> -- 
> 2.47.3
> 
> 
