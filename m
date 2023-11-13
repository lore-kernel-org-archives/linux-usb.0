Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05123743
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJDQYpxc"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4F7D56
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 11:19:20 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso39357565e9.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699903159; x=1700507959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9bS8OQ6rZKHeb7cdblEOVgjsj1wH0/oUn4pTD2y3iLw=;
        b=QJDQYpxcq6lkNKAAokEtXJL7/HgoSqtvCxiwrB5FZy9QFIFF0JUBr7jg9PDkRaeqvk
         cO147Tz/lNoPKaSWmt6ZBSBCGFLcjyTMXDADje7HatKVtrBCAe79NGrr79hZnLjNHA1V
         VKEbai8QKTHCVhX5eK2QWO5I4jzzDDyG3MxEXtV0S5rRRQGILURu1EMJat5GxRo5VQ1+
         /eF3m5z41GW0KYlfNMNzqA0VIUGP2D5tsqcXCHNpEGU52GyXKoqrQd2URMkzs0I/p6Mz
         8Se6b6w7qUXdvwd6vHjBMw+Lec5TyRVwy1KUVDAhxyvv0jc112VaoeAkMoabXzhSVl3q
         +h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699903159; x=1700507959;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bS8OQ6rZKHeb7cdblEOVgjsj1wH0/oUn4pTD2y3iLw=;
        b=a09TCyFwx7n4pGXSxTjjKUUfDs/0s7jPx7MeB8sg8949ZCfdMzrsVqRhvgScnsQDZ3
         54Xl2b4nfOFdBrLg9YZo0e/2hA00q8/emZpJiBg4QwvHmrrLe1tvt8X/nRJ3TfnpON2r
         gbgXT4rSg0Qt3idhoWKMbtTCkuTJOnO8c/4KNAai93MdbsfCCnT6058fzoXa0qQd30OA
         FSrtWO3Whzmqo9dmjg1agSIy8aKCul1+6uxd8P7UazLOjogeNjFssl9IEKFWHB+S84uP
         2GTWeTZ2jQzvG9nhBZJD+MsVPwd1FOIGWhvD1wvgjLOtZNEfEgBDCmbpJM5K30ZIjbct
         8OzA==
X-Gm-Message-State: AOJu0YzqzWK+OT5R5HM+pbh7KBX/O+G2vPL7FPjuWqfuTvYoXvnVSCso
	NnI+ibIzMSc/T6nboVCdcbkv4O4anww=
X-Google-Smtp-Source: AGHT+IFnB3yECFpwuIT+PVh0G0iuS7wiUQIiB1Fyze3gt3l76/ndONNW2TKzRK8fIcMCjWJzGOKoTQ==
X-Received: by 2002:a05:600c:3b15:b0:40a:49c1:94d9 with SMTP id m21-20020a05600c3b1500b0040a49c194d9mr6176061wms.27.1699903158738;
        Mon, 13 Nov 2023 11:19:18 -0800 (PST)
Received: from ryzen7700x.fritz.box (p200300ee973f6100aaa159fffee94020.dip0.t-ipconnect.de. [2003:ee:973f:6100:aaa1:59ff:fee9:4020])
        by smtp.gmail.com with ESMTPSA id z22-20020a1c4c16000000b00403b63e87f2sm8889703wmf.32.2023.11.13.11.19.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:19:18 -0800 (PST)
Date: Mon, 13 Nov 2023 20:19:17 +0100
From: Andreas Kempf <aakempf@gmail.com>
To: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <ZVJ2tTupjAqLjR0U@ryzen7700x.fritz.box>
Mail-Followup-To: USB mailing list <linux-usb@vger.kernel.org>
References: <e478e2c3-cc43-492a-989f-21bce674b1b8@rowland.harvard.edu>
 <ZVCxDvNt3ERzZBpu@ryzen7700x.fritz.box>
 <c8868479-2fc7-4891-a008-bd9b685c6b48@rowland.harvard.edu>
 <996cb993-447a-41f0-a9c6-5ff37c360746@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <996cb993-447a-41f0-a9c6-5ff37c360746@rowland.harvard.edu>

On Mon, Nov 13, 2023 at 01:23:28PM -0500, Alan Stern wrote:
> On Sun, Nov 12, 2023 at 11:28:47AM -0500, Alan Stern wrote:
> > On Sun, Nov 12, 2023 at 12:03:42PM +0100, Andreas Kempf wrote:
> > > This whole issue is extremely confusing to me as I cannot really figure
> > > out a pattern. Today I tried the following:
> > > - I plugged the device in on Linux: issue occurred
> > > - I plugged the device into a different port on the same machine on
> > >   Linux: issue occurred.
> > > - I plugged the device into an Android phone: played audio immediately
> > > - I plugged the device into a Laptop running Arch on 6.6.1: played audio
> > >   immediately (?!)
> 
> > > - I booted the machine on Linux with the device already plugged in:
> > >   played audio immediately (?!)
> > > - I booted Windows and plugged in the device: played audio immediately
> > > - I plugged a keyboard and a mouse into the port: no issues
> > 
> > Yeah, it's really hard to tell what's happening.
> 
> Here's a thought: Maybe the problem is caused by insufficient power.  
> That could easily explain the odd behavior you see (some computers can 
> provide more USB power than others; the power available over a USB 
> connection may vary with time; the device's audio functions might 
> require more power than the simple USB functions used for enumeration).
> 
> Is the Sound Blaster card powered solely by its USB connection?  If it 
> is, you could try connecting to the computer via a powered hub.  A 
> powered hub should provide plenty of power over its downstream USB 
> ports.

It is solely powered by the USB port. Unfortunately, I do not have a
powered hub at hand. Maybe I can borrow one somewhere. Still, it seems
to work on Windows...

> 
> Alan Stern

Best regards,

Andreas
