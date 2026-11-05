Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904969;
	b=08uUOJgIL8mTjJrHaE6Upxxo2Hq8ot+JoyFXbgoA4l5vRpj7WswKoy4IXNJrzj7LgOBJ
	 IYqEXgtrEaQapm/DTSJ06X6embV29sIgOBOh4RSIYdntjDn4bbiHm3fd0yDMvF8PeBtcd
	 STEaGDOjZBH1MQgDHEqUC/X/peeW1bpYJfrfYSWRXUL3qwSTmuVMWyrfUsmaniSFp8T47
	 YJMcers6xaK69jnarVY+kC+6s+Oe31YwIDqH4rrm6VCvNEFnio96bDQXXgMP3r6gWesGo
	 pGfphVmgugze9d3jtrLyDNrptf2HvdidPqLWsc2ywLnggvJBEGglU3hrM/JDag9ZpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
	b=hDILV21TPchxYpmQ4kv61GUG7/YBGyIoCtugNsNhgsZWr/5WX3wGDiW9EP1KvWLq+C95
	 A63sc/YFr9dHVhYDwRlR5eZciWFs51IJAzoOU+0wj72eT4xIdXA/cYqBbFSUP7VHxmc+a
	 Xztecf2/cqScwu5Cde8mBSqU3rI9XKMWiaeBuyaEZvOm/k0uer15m/A/GJYxcsPfWUdgu
	 ys2Fcj6nCtlzl9/OQyUibRiXvqgcq8Kj/CfJbBwanoYXH0/S2Wmz99Uo3xQE2eiyP7yyO
	 s2qfVtGdszudYXZzQw4we2CWUvefl0STwZa5075aBdXXZ69iArxc5fr0m+uOdOFFJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSrgxbBj;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10260A261E
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 18:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A10260A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSrgxbBj
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so5992985e9.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
        b=kSrgxbBjKnJEy90/O9km/EcNAA4SlWHSl0Vt6KmFMtdkOHiwyUVFWav3GmYEY7qMp1
         zLu+S16zFatZ6gctxN5yKWijdTo/J46bnqA5rR4olqZPBaqQ6DLWCldJms+r6Fl85fSd
         QhDuqG01TPv9U9jjiPWdiqTJHoEIJS5eRsDTNpVE/0ovescXp3STEjBv5Y7hGLsCXzbh
         oUzQ4MT46aAoGC77sO5b3JxdUrzvhQjoagxbSFfL5syQx8ArkND6TIZRwi2AG/1t3RDe
         tStSpoVEL8FGpRutliysOGERbbm7BwQYgjlzKellzE08Gg2EpBpnGJul7JVhHWK2dDmX
         P/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JRpOjFd9h9Be46JNorYz6r58ZtExm/xfZM8/HWY0UU=;
        b=WgTAWok9iYc5qYzbyhId1zrnh+tVsfBxkiUDklJDwTqs5Ar+9wMm5apHfDLbGujrq/
         G0CnMiFZyPwj2k6KHcPSX3twkHuMtFYGPY7/6ySxXULjn0SNKQdLUNFP6rJKVz81+Uvc
         51tmLlxA7GXScHK532ThbnE4/wtxqjLIgpQIodCLNRJvfl0ctPYIxSKhi5pL7ECWXIc1
         U2CYLpCFSQi/CXeb0/1kTxFZqEubxTa2h97E9xqsCN03Sp/AMlueC5wcTU07J5Y1OYgA
         /GdnzCXWmR7RVtMJa1Hy4UYNXyc3VqYv286yzKVhPIe7G1mfRTvDsUnSzGB2pnusyXpc
         El4Q==
X-Forwarded-Encrypted: i=1; AKwUvByboQPoTJjY1yXTGhyOJtirs7Tbh/qwy36GBcto/hj9iUqKaKyzLVbyg4LaJR88PxFBfG46bjTfJx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e/7z2KfejLL6rLvrnTp0z/v4PN9E/hGdWfjpL0YXAgtRbq/6p
	vgO4SUMkn1nFR4jITuy0cul8M28+zTeR9SYMGXqbQJ3mxY71nBSJ/Vbm
X-Gm-Gg: AYBFou0l1jzLWABq5mN822O8/FhW/E9QbDvyo7g9ZGW2RuZNf7J6jywdZ4/mzNcx1ox
	A4UczRtFtspo2waBhauW/d2kNAo3UIq7UaJw2Yx42sJSKGwl2vAfhBwfqzn7zBwJ2jvB0xsvv9m
	FSn0XFscnlxko3qqGEpbZoSSAWHNBw0xrM3pt26DJbTTImcWvBeHXpuIHPm/NsUIgV0FkcJ1lLW
	zKrZExjv2qgNQHGQOl3N7eAtkwQ/ZbpHzWYtz2HW/hr20S6tE42mRwiPJ9vlvdUsbx91IYV4ZRH
	wLYECAxcveZ2pMZhVytu9MrXCl5RvJ/Z55mJrFwMYbbMA7J4bXpus4BD6UcxtIcoaR0uxqXKWik
	cfWfamqTMIgM+kcB+J2DZbN08ta8eEo0OMBIqSdZ1rD5SHpfMgU3KZ3FlMnoYW+Va0QCBGOEk7D
	o4NZbvKNvo+BdMB3GvdsPzUNbKfNLbYfUheiso3T/PXC2mudj+BuccRFECb8sxV4SYenwrgBtnJ
	u8bgM9GQ8PsZfXY2Uc5QoKEFEQX5AmQKudnXf1DCIjXi87LRu2IyIAjwOBLhJmIsjKMmPp9CrQy
	jaN9iqccL7NvBo5ZpJiREEc9x5Y03gtXySfqpwQ=
X-Received: by 2002:a05:600c:a04:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4b6df9bee79mr241625e9.11.1793904967521;
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm10404195e9.6.2026.11.05.10.56.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Date: Thu, 5 Nov 2026 19:55:57 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <20261105195557.68e8f04d.michal.pecio@gmail.com>
In-Reply-To: <d0c16945-29ce-48c5-abe5-2d2c6b562d51@rowland.harvard.edu>
References: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
	<20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
	<d0c16945-29ce-48c5-abe5-2d2c6b562d51@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Nov 2026 12:11:43 -0500, Alan Stern wrote:
> On Thu, Nov 05, 2026 at 02:56:27PM +0800, YuanZhe Liu wrote:
> > With the port owner exception above, tools like uhubctl that send
> > SET_FEATURE(PORT_POWER) to a hub without claiming either the port
> > or the interface will still get -EBUSY.  Do you want an exception
> > while privileges have not been dropped, or is losing that use case
> > the point?  
> 
> Well, it _is_ kind of the point.
>
> The only program I know about for manipulating port power settings is 
> one I wrote many years ago; it is careful to unbind the hub driver 
> before changing any settings.

And the other one is aforementioned uhubctl.

Since v2.5 in 2022, and commit aa7fc0a1 specifically, it uses sysfs
usbX-portY/disable interface if that exists (which is since v6.0).
Otherwise it uses libusb and fails with the v4 patch (I tried).

So if this stays out of old LTS releases, maybe nobody will notice.

> If we want to allow this sort of thing (changing a port's power while
> it is under control of the hub driver), the right way to do it is by
> adding a new command to the hub_ioctl() routine.

Probably redundant at this point.

Regrads,
Michal
