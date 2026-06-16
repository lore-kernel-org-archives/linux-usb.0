Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D34779B3
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627813; cv=none; b=nzqA1szDlv9b+qBJOjh/bffDQlVdxGD+vKtAx37odIcnqxBw7ynuNFnsbmAS7whctA/+G9DQEs2uDjJ09AyGj1k3Uz3yelFDbfU07MUzglVi24VmBDONVgEemieJi61AldGaMeVKRuskL+59ZUgYt0MeYpV9Pbe/mr8vBEPLVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627813; c=relaxed/simple;
	bh=KWyR6lLbfsKyvj+2Veq9+Tz9SdQtZ+iqwrafWa+Suds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQfcFBI1cMYPUWVEX/mA9q4FBxj0o3XoyKpuzaCL7JWOIs4GzhZB+ot4TrD9Te43+ACjr5DEdYOus/aDb3Hx5pZW0dFKjqftm/H/5rrCUYkk9oz2AUElp6+vLV2eo2/wuVjw8A68w6roqvFS4UyN5INMR6wJavTLs6ATmq7u3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8OzLnNo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8OzLnNo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3618257f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781627811; x=1782232611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFaNAqinUgkXjh92IVLXqIUVWHUv/aOY2jo/+DQ3enI=;
        b=q8OzLnNoElAWU3fsuzcwCUfaZKNeOh7J+FQAKcnPUYW9WCIy85AscFgi5+RtdHNFjT
         GHzW12HlzeSkhoOnIDlLU01NzA1C5e69mYZvw+L0OboqdPUxipUEgVVbju4AO9z/Dune
         lrXkoOh3I/CjqlM2ZOIbfxmHQ63c2FuPTtGdkkW0rJidw/j2qFOxW1YxcajD3Au4GyDL
         pbbDKzQMu9iaoUarth/02EL0nAMhEyAOMLp1Jv6e6n9wOSglDStZGzN0Q2QEMFefsZ/z
         bpf0vnU6G+HS6CGR5+hgSIizfjY62xvnjMkG72fFH9BoS3bXXdhyXnUA92f7NcG7bTAQ
         oxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627811; x=1782232611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HFaNAqinUgkXjh92IVLXqIUVWHUv/aOY2jo/+DQ3enI=;
        b=fkHIKFb7YaArPh3YCKZ+j4tbIf3C6nm0GPUxayjcVm8xpIuxvIGrEJ7b9GX1Ggg//p
         qo35QS3MhrEb6Uu9MjvIisWjZh8Z3u8a0mCXLm40SWw8IaZxk0h3Whl+L123CAYJQGJd
         E6trZ2rXAAhRV+c/NbKwN0+5EX3Uo9g1qbi3ubfk68M2XnfeSW06iA8TlEcFPjz9ZMmc
         cpm5MRLTQwKtuZzSKIDue2nH69smOwV6yjrGfYTmG9evgxfQ3IXqHg7Xlpns5dXjm91Z
         i7ztr9MpfetK8iF3dU0rUs6F8NNSo36R996hsoKGuTPOs2M242BGBUlZ4vZE5KBlP0zv
         Y1ig==
X-Forwarded-Encrypted: i=1; AFNElJ+eURiOd3Q68G9di+4ox2jrgPkGkKaystG26PnmO4erslyy1vCFYDlvLC5PQsq4ddvvw5985EPaNCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNnrtuit0+BI1HihH/RO5SJcyjgfpr12wvaL1sa7Touy2OoK5
	ygJPZD11kE4oPuw/GdeQBfK39DP4q3czuFjfZyyv3CYN5tAPcutBNfGu
X-Gm-Gg: Acq92OE5Qp1PUbz3NKHTCeYGAe8Pz8H9zpmOO+foJtzPOwWVkeJfueVzQ2lN886lfxi
	YH5SbGFMe9Y9yhlCS3n9Rq5huwrJYmKi9urFKFPHDkmqf1WOy3c2g4yeNgOuPh4cwH13jfAMwfq
	980fbH0WvypKr0H+KDdQJytnJvVHdiArEQY/qTWNp8OHD+pDCIu2NfHFudew6MRgkpOL7xY2Ffr
	roZYnFUmPRBK6bIgHTnGBKSBdFG/y3m6FoQFD0MsUKUKxZdEbyD75BL/cwCMgQ3v0L8T0mLZzFo
	GQ16N5OJHQ4thJNyZ0Y9YK4NghVtpSeAhPIdjlYZA67pW4hkG0BsFl2HzN+x36TZJSxRSQDB/ju
	GjGiH29SRPkMnGONkxE9BtbRoH1ektB9alaCp4ZsfTc8PHMRG8bZyKNe31b+kZhwGsEePF0YDAj
	qVCbHQfr1DILh08Wq36nhlDxDelyc1zFWk
X-Received: by 2002:a05:600c:19d3:b0:492:2100:aba2 with SMTP id 5b1f17b1804b1-492333ba311mr4589965e9.4.1781627810369;
        Tue, 16 Jun 2026 09:36:50 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm42606551f8f.14.2026.06.16.09.36.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jun 2026 09:36:50 -0700 (PDT)
Date: Tue, 16 Jun 2026 18:36:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260616183646.4798516b.michal.pecio@gmail.com>
In-Reply-To: <573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 17:38:32 +0330, Amin Vakil wrote:
> I can confirm 7.1 mainline (installed from AUR) still has the problem:
> 
> dmesg (kernel 7.1.0)
> 
>    usb 2-1.1: New USB device found, idVendor=17ef, idProduct=721e, 
> bcdDevice=31.03
>    usbcore: registered new device driver r8152-cfgselector
>    r8152-cfgselector 2-1.1: reset SuperSpeed USB device number 3 using 
> xhci_hcd
>    r8152 2-1.1:1.0 (unnamed net_device) (uninitialized): Invalid header 
> when reading pass-thru MAC addr

Was this junk always here?

>    usbcore: registered new interface driver r8152
>    r8152 2-1.1:1.0 enp0s13f0u1u1: renamed from eth0
>    r8152-cfgselector 2-1.1: USB disconnect, device number 3
>
> >>> Hardware: Lenovo dock built-in Realtek RTL8153, enumerating as
> >>> USB ID 17ef:721e (Lenovo rebrand of 0bda:8153), driven by r8152
> >>> through r8152- cfgselector. Host is an Intel laptop with xhci_hcd.
> >>>
> >>> Symptom: on the patched kernel the NIC enumerates, r8152 binds
> >>> and the netdev is created, then about one second later the device
> >>> is USB- disconnected by r8152-cfgselector and never returns. No
> >>> ethernet interface remains. USB, HDMI and the rest of the dock
> >>> keep working, and plugging the cable straight into the laptop
> >>> built-in NIC is unaffected.
> >>>
> >>> Affected vs working (Arch linux-hardened): 7.0.11.hardened2 works,
> >>> 7.0.12.hardened1 is broken. This commit is the only
> >>> RTL8153/USB-core change in that delta, and it activates a code
> >>> path that did not run before on this device (note the new
> >>> wBytesPerInterval message in the dmesg below, absent on 7.0.11).

RTL8153 was one of the chips specifically targeted by this fix, but
it affects the CDC configuration which you don't seem to be using.

I have tried linux-hardened-7.0.12.hardened1-1-x86_64 from Arch repo
as well as my own build of 7.1-rc6, and my RTL8153 (0bda:8153) in a
different kind of USB-C dock still works with a few xHCI controllers.

So it's some weird problem narrowly specific to your system. Now that
you have built your own kernel, please also revert the suspect patch
to verify if that's really it.

> >>> I can provide the full dmesg and full lsusb -v output on request.

lsusb -v of the NIC may be useful in case it's different from mine.
lsusb -tv of the whole dock, because there are other recent patches
for Lenovo docks and I'm not sure if they apply to yours.

Regards,
Michal
