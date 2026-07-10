Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42B3F8245
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677216; cv=none; b=AsfK2JIlGMrIxQK5w/GWHlgDlGn4eaSDa8RmCM9XnoQpQ7SvrvllhjS/cNglRZIQt1k0ZGX4WcnyDpbLrsN/MbIqRlxa4Hu2jlob0TbBiegmejSUoU73nbzPDVze0r9bYXdILV3L7vQVpGAiP+qsRb0HGpE4khK6e+ax5o16q3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677216; c=relaxed/simple;
	bh=IPotQd9/0KdPhm5+/ZiEJ1zpHdGt8sKV9oR6K/Crj6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZYugyS9Gct5riMCYJ2IDyxxg7ySjH8C95v28mH8JbVJKs4Pn7zenBQE0s5VoG81IOBVEPDTcVVWi86BsxcxXcqMwNwreczjPIhNEpLBppHaBDwbt5uSfwq696BZmJEF/xF61wBi+163d0iPyzfxvuFqLkG7mMg+cD3RApM0O8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ghvJJTwN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ghvJJTwN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ba701891so5819355e9.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783677212; x=1784282012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2vMl6TMTZInWK5MDvh/DgoAE2fsUyLxxIJImnW4fyo=;
        b=ghvJJTwNu312lOrqtYycqQttOL9D296I1W+LpH/5F8Adja8CzWxGeiB0WC413phH09
         7C4x4WXrrG8AsY5cQcb9Zza0wW0UXTuGf5WvsR53Xnnk3qTS+gn2d5mPIBhkdygVjOTJ
         fp1o40ZLqCjlZ8SkTe+xgUL113BeqRbxXfB9JwcBlkCGQxG+42yIvrgc3r6lh2iycffd
         2uhv0dNA52NRmcMmxZKA+RXAy9K6GKtfE5/bT54tuBj+Tep65KdcAk/ZzSQCjQ3iMWUN
         J88Kyf/dXRQUQZR7/IsyMCs0F2yIrEMToJz7EWVonjatPF1D8CY6WSPbAlbENYzKWqwY
         E6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677212; x=1784282012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2vMl6TMTZInWK5MDvh/DgoAE2fsUyLxxIJImnW4fyo=;
        b=iyB78guVd8QD42YzcUe+plWVUjPGljpH5oLPNWoE2prkmYy2jimgT/rN5aJozPrrr4
         2lOLRQc3UmBNaI5c4vbHObm15GK0MbcCdwHkkb2wrv7h5RbkYiDbzOdbUxHlDjAGk31v
         BO6l6xL5GlKYqwON+Wycu9k3IM9E8PpwzRa+lSTRXs1V1J6ZvD/WDLWV7pZu6eNsHolJ
         heGYpX+u5MkqxMD5WDtw5epFbzDwNbMBAF0mY/np+84ulucTx0JItO25yAv+rse9qHaG
         foVmoSedGfN8iL2r7P/r95EWv7ooHtrC/l6gKvxk5FqbnCPAHMdxdiTqfO8unZ8vQrTK
         WQhA==
X-Forwarded-Encrypted: i=1; AHgh+RqW5yZ1bjOAcXiFQU+e4jZJ39r85ki1kIemFMtJnZpy0FmdsYkmvTG13pdxSXaNb3YR3FfKsDhJSYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPjzZTpUd9aYOkBzCLLCYqA71IeBWzsevpTuk+gsqeNfMoGGh
	TLxRih3z1fCto/+CkerQXnfdRKzeVmZ1GyCbA3S5DXIRE/81pLZqilo/XXp7e+XEh1rc4LSfdWn
	BUyLd
X-Gm-Gg: AfdE7clg+apeu/8fAss+ixUJ4oxIkM1syQ2EV5rXHRIekCKANR/pbyac8v+o6rz2Kfu
	N1H0FRnSX/7eO5R2+bbRHplw/oNhBmW+EmS/CaGL/JJKu9rxOrhdc6cHyJYQ1lrNHavRTYmS++n
	BZ916HBTaWaDwOQVEfCaCfSClGSUNKu3JPTmFocXKm0FwYxOPQ5OPdItm129iqr7PXi8HOiyycp
	9vL40spJ3+D1VTkMpZShVX3VZVJKVTKBI4HUx+jE4Wn+DWoIScpv0FLJB8gs3TqCCJfcJ2QtY9w
	0k4ADVF5/Jevp7a/rD6xYAKN7EZ/scjIm3gHBRR7LHQSSTPlla89WQcyWDYPpqTSTBujmfE2jRQ
	bCljVFdNHI/z2Jb57xNcxbg7iJSw7Kn4SphnRRT6W1a3yPOG9wpgPczyeWqkOUlnnfiFISDD06+
	yWc4Y3ghaCEGUOygX236mLYkPfN0WLcEPfcB8sRG4C3ECkWTA9BXtm
X-Received: by 2002:a05:600c:821a:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-493e68bef51mr108059485e9.20.1783677212605;
        Fri, 10 Jul 2026 02:53:32 -0700 (PDT)
Received: from ?IPV6:2001:a61:139c:4201:d685:3a99:8468:482? ([2001:a61:139c:4201:d685:3a99:8468:482])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f3a60404sm39143655e9.1.2026.07.10.02.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:53:32 -0700 (PDT)
Message-ID: <58b55e55-652a-498a-8f36-145d9ad58e9e@suse.com>
Date: Fri, 10 Jul 2026 11:53:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: cypress_cy7c63: check control transfer status
To: Keshav Verma <iganschel@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, kees@kernel.org, o.bock@fh-wolfenbuettel.de,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618203053.4725-1-iganschel@gmail.com>
 <2026070835-thorn-doable-8c28@gregkh>
 <CAPE_3zK0Za9GQaCTX4ZJu4_8Qvq7=c49MXtPduUwHVzQpf1t_w@mail.gmail.com>
 <CAPE_3z+DKGJ6yKGD=E5_T+9HCMeUnFBpWdjnB12Mt8UpU4Kquw@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAPE_3z+DKGJ6yKGD=E5_T+9HCMeUnFBpWdjnB12Mt8UpU4Kquw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.07.26 01:30, Keshav Verma wrote:
> read_port() currently ignores errors from vendor_command() and always
> returns the cached port value. This can report stale data when the USB
> control transfer fails or returns a short response.
> 
> Convert vendor_command() to usb_control_msg_recv(), which returns 0 on
> success and a negative errno on failure, and propagate transport errors
> from read_port() instead of returning cached data.

Hi,

Thank you for making a patch for this issue.
I am sorry, but this approach mixes issues that are real with something
that is not a problem.
  
> Fixes: 9189bfc2df0f ("[PATCH] USB: rename Cypress CY7C63xxx driver to
> proper name and fix up some tiny things")
> Signed-off-by: Keshav Verma <iganschel@gmail.com>
> ---
> v2:

> -       retval = usb_control_msg(dev->udev, pipe, request,
> -                                USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_OTHER,
> -                                address, data, iobuf, CYPRESS_MAX_REQSIZE,
> -                                USB_CTRL_GET_TIMEOUT);

This does return errors.

> -       /* we must not process garbage */
> -       if (retval < 2)
> +       dev_dbg(&dev->udev->dev, "Sending usb_control_msg_recv (data:
> %d)\n", data);
> +
> +       retval = usb_control_msg_recv(dev->udev, 0, request,

There is no point in this change. You just allocate yet another
buffer for no gain.

	Regards
		Oliver

