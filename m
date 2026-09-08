Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F574C6808
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877737; cv=none; b=sAkXk4sbhdhZkD9XgSjdHlH24HKQ6NDLzmtFBn/XD1QIL9+u60r5bCaKuUdqqvOCv3XJTs7yghADMCdlMMhZ/kX3Z+pVvtJ9NfvzIk+s040pE883X0ZljjBDpin0OPLn7+sK9QPigX431k59lRjRQkJTdd2WvKsF8cj87pAETEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877737; c=relaxed/simple;
	bh=QC894VVNFE+QX5jLEROnGftXBpYdqetNtogv05DAenA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYVhcgskGwEr4Ch2qIl0zPS34dl6YUrES1XbfPZdeufr8Ya7RDktkuY6f5EaUoBUFqrbmHBKI8IkTq9aeeE5FFmfBCGbFx6XMuPzQw80KY5NASpuO1vntZwshHFz1k4fI9UJpY10S4Zk7UtV9ck9EVwlU5iWWCyroRInd0QodbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MnYu/qrM; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MnYu/qrM"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66fdf2a9aacso2445707d50.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788877725; x=1789482525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acTtdIUeHcaQmOCcZka3aZUMRILgrgFwPSEMa3ata2A=;
        b=MnYu/qrMA3+CiIOMdWTJ5x9LeyVMOgtag+CCtfQcT3x/n1H7JZQ+l+fHJ6tFzcmKYQ
         m9gCQXanFUaTQb6/6/0vCCMCb5H5dFJ3nEOUwEdI9VCgI9Xc/hvnkaiV/PfABewmiqSB
         mIR6omrmp0tvMBoa08xVBCe/92awHvpEA6NXB6hgTS3wabCYKBiSGgfMVRBdU/sKYQz/
         LR65ADrpfgTnmcD/44aJYDzyFE0s6BdlH/idkm+kx1UBo17waMwBZzlwgjW40coysEMU
         221WR6A3Q17vcBVDfl4CndA7twzwKweaztPHf+jwb2U9iaZHLUpphSqHSK20qocDroWH
         I7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877725; x=1789482525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acTtdIUeHcaQmOCcZka3aZUMRILgrgFwPSEMa3ata2A=;
        b=P0fPyrRp0OpZlqH30KcVQlUISu5t0QMjx1mUDoBcNq5CPn1NCx7TI9/F5G+5cV7jV/
         nSWm3hrxGsluhOvP2AMSOWGAYSoq8n5GCd+NXwrQNQzKHUEviufmXzws6s4aXQlR2Sye
         1y8grnyv9mRe0nW/1h4u/ADbnTf1NqR7Zq+2VR+nkGVhoGIuaKJ2463C6vyBvnjp4Aeh
         K2qqbcd7MuFh+0fLUeq8PlJLJn1aYcy+1NbaAAB96lpJ9wAp7dpNZURrhLOIWNxP+MPB
         5oZBbpzKCRyKefAy5rACvvdF29s4SmqaFI8boy+sGQlnPTWKd3/LHY/REpBsd53QsyKI
         QAaw==
X-Forwarded-Encrypted: i=1; AKwUvBw8KDBmUhzzjyptodMEKCJUGWoNvlNKxlSntRpM5fSYX5lDbT12HlYsPoj++Os6MGyV7+TmLCnmO7U=@vger.kernel.org
X-Gm-Message-State: AFuF++neeDQr1x3CW+zPsIF+rBXL8visxEXTegIK1lK6hhLS0n1l6P3T
	rcdxOb298uLw1nPHmM/dbaxlbLSn2ySlut6jXwPSk6gUsQUuQxbC7xDxDAmQCWkY10oZGrkM6wy
	hanuUIQ==
X-Gm-Gg: AYBFou1J04O12EzrZXbCIrLVxK2l6yB8YnFrMhVbUOpI0B232pgWmNWo3lumSs34t01
	uXkyjSOQZz3KvLupaklw19e7s2xWbCaxN8ktJl2u8jQ93DnX2/rJ/I7S+ShFOODILy8XWYhmBnL
	j20ew1BT6ps66mmiwGCVrOoUY11+c2L6MXU9M21hZJhHrAk0zcprJXjROs348VF0J0biD1ilr+3
	v3DrgfrxIEJA62UFMpqEzZTEYzM6eSkdBepZx34u0/xU+TxF7PC4qeVV63jBfedD4uLx/sLDDck
	Lcs0adC7v95SZeJxYzIQuKy0j0GnQHzs2g2k1FYgc2p2eD4PQ5jcn1sFD3Bs/mpu9z3PNox4F6v
	7V8k99oqG8Ybcji/6Xr+u+eyK0bsy79MqFEIqSCyHtiKkUgsf0qjs4DWqEy6Zv//8JO4DEqHdEI
	uZer3N4mnbRvt8VHrdYKXwPGwGZ5wV8h5Ua9QxkAbHK0GigtyYCGsSTmBidVffPg==
X-Received: by 2002:a05:690e:c45:b0:670:78cd:16f0 with SMTP id 956f58d0204a3-67078cd178emr3118595d50.73.1788877725242;
        Tue, 08 Sep 2026 07:28:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104064a2f8sm118085886d6.12.2026.09.08.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:28:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:28:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Keisuke Tsukuda <catnyaaan@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com" <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com" <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Message-ID: <142bb935-adef-4881-adb4-f1ba158e7130@rowland.harvard.edu>
References: <20260907085806.52647-1-tkdkei@outlook.jp>
 <20260907085806.52647-3-tkdkei@outlook.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907085806.52647-3-tkdkei@outlook.jp>

On Mon, Sep 07, 2026 at 08:58:42AM +0000, Keisuke Tsukuda wrote:
> SET_CONFIGURATION is handled asynchronously by the mass-storage thread.
> A class request can arrive after the composite core selects the function
> but before the thread installs common->fsg, or while the function is being
> disabled.
> 
> fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it
> through fsg_is_set() also emits a warning. Check the active function
> directly so normal requests during a configuration transition are rejected
> without hiding fsg_is_set() warnings from other internal paths.
> 
> Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")
> Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d31109047baed8f3b590
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743c..52d486a 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -463,7 +463,7 @@ static int fsg_setup(struct usb_function *f,
>  	u16			w_value = le16_to_cpu(ctrl->wValue);
>  	u16			w_length = le16_to_cpu(ctrl->wLength);
>  
> -	if (!fsg_is_set(fsg->common))
> +	if (!fsg->common->fsg)

I'd feel better about this if there was a comment here explaining why 
calling fsg_is_set() is a bad idea.

Alan Stern

>  		return -EOPNOTSUPP;
>  
>  	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */
> -- 
> 2.50.1 (Apple Git-155)
> 
> 
