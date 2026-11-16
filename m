Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853051;
	b=4FZBXk8M+ZoujkPYQd2pYkL6TE2renZKn+1A0HrPdVYsh17vlnQpVwVNF/0+mTcE9SmM
	 SDia8X9FoL2pgmruSKiJ/3gX7L4WBfgplhV7oqlrjhE3JL32smV7l1hhHEAUdtlmSzqb2
	 +1jXhfkE+WVzrDowhtFeuvpmQnaGmqEFfAHV5Sl4CqReC4oVeP5CjwSrv8MMnwOIOxa4G
	 G7Djy/d3oyoq+PQSSMTdCJWujU5xpMRMzcEzhMSeo4OsH2xD26IUolXPCnLkiY7/fB4h2
	 zUCRrtr26V7KQa/wXDxYW5zoCjKQXN/gLJU8B61jRLjBuRywdlJWXoNXT0mdNAuBo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
	b=UUapUhMZbtPTlfbm/eKH7gPGfQGrrt7Pn9lk7a8XUkBDaFUeXcgcMpju4OnBexLPjtsm
	 H8VrhnnWVNznkLIARouVLg+OfPrqns9s9toLLmsi434G2N6k6mggn4thHND3xica+wNpZ
	 OE7fo04Fq0HxANeqJklkx27+kYKTkZm2vKMTuf5v2wVQz4kdhaXfIPwQhieajebp0tvDy
	 eN9bA9iOghk7T/LNZVRiJE8ixqrKAUGOuOm/BJJnhMgDVEbZrpatkEELchzGHuDvHwwwu
	 Cmdty01lxDQYU6uDlo9sGeGNAaQvfmvqo32h7ll+zhQD3ZK2DB9G2WUIal4opv2ASbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Da6Kge7S;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4F606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD4F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Da6Kge7S
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so43492886d6.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794853050; x=1795457850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
        b=Da6Kge7Si0XQaqs0hLt29Ig5onh6sX47qlUBFimNdQ/J74R/61zY67zbSrQu0666nt
         RVijZ3cH2s4QtLeNLMXbDm2RCg8zxckjjerL1hkUkJMKsPCo+xQaJIot4VeNmHiL9mio
         VRp6I8ZZKTtPrikhXSyL2B5tcASHt3RwJZmdww/6j0Agnve6auIKZSt9HxWX4lq7VF0T
         vBNDFE6jyul2VfD0Gvyjyi/1lhKGCPTfEXBWTpf94yaAO1DK7BoYPckgFLRhKPuI9+O6
         xMnU/pRVGVXQ8mEScIldR2+3p+ATz4vEAfhztEA19435CbPc3kTD9EDCouP7X5Dw+K/M
         Dz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853050; x=1795457850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RScUmkvDYyZGQ7cdGuOwgEgkZcBLN0w6tko6/je2Xu4=;
        b=BNGda7hiKFTwpUXcgfM13YEb+k1BozJQIqL0t7+yLsH4Gs8kaDsn1mEt7/QjGaX0yC
         WBw41SviQT3SUtdW2Aau8rUzH9xSJFbynbFIWaxjEI389QFp71Z6uZH4MBr4Bpp/TGZs
         dbkrrzeG7nb/1K4/WdUU0VNTxtTLDTHj959w4KlHcwypnAYZtm5Ud/cZfG04gt0+Tsvo
         RA/9f+xPNlcV1mtVi4rhZcHCkErzzTQqqcCDaRLtC3YuaNF1VnLIDr744q6hvhG8NIcB
         7SZInu4f48AJb5o5J0H84Xmn7X5nd/ZUUpsf17osLBNKudSTvQDuhkT1Uw5U7uvvvXBF
         Ytag==
X-Forwarded-Encrypted: i=1; AL+hErHQF5FKakBJ/hlyo+Qgupsxt1uVQcSgDUBxYNoEAI4Pf7ByULtzg73MQu7GVprugvonLzMi+UVW2Y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jlKi70bjr6MUfpICWghMICupe2zMkeOvnk8WLwdIJbFQypOBW
	jJka0YIqQLXDw8w0C9boXOy509/rwstW2fBjtvSd579Xa1X1RTymsQ97HYg8nHsSTw==
X-Gm-Gg: AZFdTZdHZBpJJbbSruDcW/xhjxGKNOkRn3UDTPq05OV3aNeD6uzk/yyvOiapYwe9ztF
	Bysuwao4sa66bBCjRVMHw/KFqqD74HAvXfYbxqr9idG24w4jh7WseIm7aV9rnk/44iKfcD1xVi2
	GEEko0kfJw0INFZxmjn/kuTN4OpFNCl332PlTqPNuefG/tE6QaGSll5nM0m+XFrH7bDFj1oJk5Q
	dMxZg+n4a3WgFRYEVGtyrc/LZrhcMT5zNx42TnJyV5VTrAZonikshL2y1z6xsKYJe7wU9nz47uP
	HszK4zmnXOk/cptN0Ye6CYs87oX2LbklQoPqA6WWVzPYKN2W7MiPWjKmuudqg6tcWaqvgpw5zub
	IGvJGqXySjp+XbXWlyenHTaPkBT4si3r7fFyVcxTuoiq6Ho/SEISf101bGg3Lq5XluDDOMUL8Iq
	6draQFVyBaavnyedqDWBcn8d47CYPc0zFMuQe/n0Kp7wgXsP//L7VZ6a/lER12ew/PWx0fHDI4g
	svJBb6jtSUNZZwe9/0r5s9Thyx0Tj8Z47Nu1W4WR0tsiWe5fGxmbU55Ql59VGfMeYC1DP+keeHq
	1CEBs10CDMPELrtWD3E8ni+F8SWNN/d78UY6XUPdo9ofLpB45dk=
X-Received: by 2002:a05:6214:226f:b0:91e:a46f:a58c with SMTP id 6a1803df08f44-91f24015f47mr185903906d6.8.1794853050082;
        Mon, 16 Nov 2026 10:17:30 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920ee3ccf23sm21285836d6.7.2026.11.16.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:29 -0800 (PST)
Date: Mon, 16 Nov 2026 13:17:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: reject SETINTERFACE while suspend is allowed
Message-ID: <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
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
In-Reply-To: <20261116060549.370140-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 10:05:49PM -0800, Cheng Yongkang wrote:
> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
> 
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
> 
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
> I used -EHOSTUNREACH, the same error checkintf() returns for a device
> that is not configured. Please tell me if another error is preferred.

-EHOSTUNREACH is fine, as far as I know.

>  drivers/usb/core/devio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..6463ad2b1fc5 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1533,6 +1533,8 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
>  
>  	if (copy_from_user(&setintf, arg, sizeof(setintf)))
>  		return -EFAULT;
> +	if (ps->suspend_allowed)
> +		return -EHOSTUNREACH;

How about putting this before the copy_from_user(), and adding a comment 
about avoiding possible races against an unlocked reset occurring 
during a device resume?

Alan Stern

>  	ret = checkintf(ps, setintf.interface);
>  	if (ret)
>  		return ret;
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.34.1
> 
