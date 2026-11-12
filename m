Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472816;
	b=CJ4fS5Es+8uXsCq0BmVbmiL12xFndqjxUmnRBRbQwIcUY0u2efKihDzPvygsA8nT4kxI
	 B5ScqLOwfiU4cZqgTrIDgbcf3PiJj/q3K5TVx/SA4rheLcEONbtPigZ3Oj4aEG86370f+
	 m/5qlflVuz4ixp1eByvMnIT1xTgl9ePW8zsaLRAdzjSj8dDdTrQvCfANXcdmR0oEGTlZ7
	 8pRSil32tKEcO7y83lavo8tKknnY1Rerun/pOKDRxvCuJhzJMIFU/zN6GupDDscXh6C93
	 co5vLaoLAwUKrqEliMthDR0C63fVOXlFM/Pw5SO9DiLf67yYUeXAOqfSacDYjrauIZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
	b=5WObApVhc4mLy48kYVEOXLKO3aJDm5AWFJuze4FC8zF6oSSQugukstmlPrdw9R3OeJLr
	 XxkfNYAQoJHrZtF7H9GyhDR4QU2Pqx/c+QHiqPTJvnwiatf3zPeX0geSv5KX/JKFXuuR8
	 bmjbc/2Fxs3eta3shMtD5dKyCHS1hM89sbl1JWkW7JXMr4luDaEonOJr88/hdY2+ruLKs
	 H/gNE2cDMy+9NjSBB6DRqyxXJ1q7wWRhbsCtM7sS4bcLnARO4iKobEvUeL5/H6GiU2Swq
	 ZUN6Ey1vAvz6Fw+FvoFxL104rZYvfTeb/PjsSbKd5H7sYyW7re9/Jumya2mR+ODo8Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B80606B3A1
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B80606B3A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA6lCI6s
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2295781fa.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472814; cv=none;
        d=google.com; s=arc-20260327;
        b=as19l3aDNvGgqr0fX+6P7mGZyBNa9+RQ/qz/40PKK4+xCMQV+6U9T0Te4bCfZIZpl1
         WlO580Fy4yJ3uRnS1usDmKw/D7a3cD2fYCi7GR1Ka6+8J+fk26vUOWGuakBC51qzmGbs
         FGZeeRdb0rlIaUNQqZIaBqzr/RQ4tzySyJpBVOZssgat2ieMKjpCW8YINT0GFh1tF4N3
         CJQrZvFj2+r+SmGgnD50v91ZtlBV5vzzwlcBnHu79P4AxG3lEw320boYlP3i2ZDdQML3
         R3HMo8F6YxShitONiNu1RR/ehr8eGHUEi3lpLAoxn1EHW47v5xO/ttaE7+axeMdhVfdY
         SUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        fh=NwO7vvXJXHMWVycQTWH1uN55ft8t5+/YQ4ja0p/FpH0=;
        b=fS31D/NnHuf4R0akz7VgiKZUyhW08pPISWgZJtMN/VNL32JMKr+lV7VhqqI7GZWboH
         vKv2akQ5RW6SCLL8/0jnzqegVp5FAjyRzZ05rlQhAurfcmL3qzshJKePg0szY7CjfDGC
         3Ol+/0YBJduiNy9mMgr6RI5CaXXx4PB0hA0rLAadM49Mq7kX7JA1CyOJhQTjkXpjDMF9
         VatwsbanDJOXaeWuNCg6lPbLotbL+TbvXaYNMrjSpeXjbaMuK+JyomzzyIIVxuvOlIZJ
         g90e+Md9X+HyzZrfw5cMZfHNZ98P7ST53NW9fqr/M/dp0s/4j9mskt1BpIKrFp1yEW9/
         AbfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472814; x=1795077614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=iA6lCI6shaa3+dIzCSrmsWPUPOwk0ok/6mrWjsdbK64wHrR+UqbXcpToprzxcTL7CH
         t/J5qapm1CtbdTMa3Ajj+WnXzY7XmkstHk6gyfQ/Wl6Yh5ZaKeqIjA2uEkjdfj8ita7c
         wuK2PqeUDZOGP0LoT5B/opDl2bT0gvb9fKStuCdbUBN4ZefPMfAq0ZrzjBLMq/wCJvBA
         OnNdAhpIB8r+5i9jv7XV3Wj42nGOasZnyS07GXqVm7/zyaLfaeJSIw68JAGojuvbesEN
         Lu9hbf9DuYexTp9DeBgD687tn4lw6Qj8rAHahNazrNc9L8tHnQq02FbwlSEvI8xcWCfR
         wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472814; x=1795077614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MLHENWIhimnyZAk96Q7jBk87imP7SgqnBM069C44cY=;
        b=mtP0mcccUOdnCpl+BUeQb/AE3HbkpEO1G4oUgYCNV3Ve7+fpiiDuuPs38aW4EmiOoW
         g+k314Dbo46Kl3uQZfGBucypftc9YpGnFjvFtAkw41e2AXwj9JoYTELGWMIaCu8WGAUS
         +OZWY3602HHGI6GCrH611vJzaWlSXqWwDnStVl+PlX1nsqm6N0Djdo7egwoaCnqt1oMR
         QoQAcX/KUDOGn/g7jzYUfanTHre8boS6Oy5uLE2z0pdo9sUq6tekoazDIXNqvzi6XGB+
         gsx3/1HLUzt4TiC581rZfxDaeMv7n7kzd8ZjovW1TL1VnU+2MsA0ROo3/D9JVY76z6nh
         KS/A==
X-Forwarded-Encrypted: i=1; AL+hErFrIporc/Ejo0Z/WK0NSqn1c7fEbkilwUr1keBszxaPt/CPwHmTcIabXp+1PZlnhqE3UJfCnLq8ESM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zlCGigVpRau/PWsognpe8ifYYgwuwR2+uSJcUbQFZ1z/mjczE
	kyI66XG52HwaXcAvRNjBg/goff9XukHoJURWX0eNQ9cMSSN3LJakSoVpT78+j0MgYnr2o8rm/Gh
	P41jbuQCNnCfxTsavDFIrctVQ2rOfIiI=
X-Gm-Gg: AYBFou1sCla7ljlDgehOnLtOWHWBs6rPKg43gPBGHyvtMJWlWN1xOgoBVES9XQigLpk
	zUxMVTeoLWYO4a+yrxXmUdwKRN/m/s80oDGd0rG56WfCWFlzK3YsDMUEZa3n/r2Mx8dsTuEDHt2
	wagZkiqP2F3VzwBHTqXP9ioR3Lz7HerDlLXIuZ/HHGyH0b7rAhazlZteFQ0KUYe2SigYP5lS08W
	v19fwqke68EatiNJyr6k/ZA85MpiyVy1jtJvQ3qdJ0q+l5IVim1/IbjXF0QcApCMXkg15eXwag1
	QIZROufMltKKmoU5W/rC4R1A3XTbPqLyKSPhCXASrFFJ509H5sB/+GiIVBwt6f4dL/l9mv65sxP
	Q9Fns054nXLf2QCgtZjS6mc9GnfgeOWcF4qg2NyP/hZPhWboGwbO2BI8o6M+jbcNh1XKszqk=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1980194e87.3.1794472814061; Thu, 12 Nov 2026
 00:40:14 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
 <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com> <20261111121556.1871-1-tvlad744@gmail.com>
In-Reply-To: <20261111121556.1871-1-tvlad744@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 00:40:02 -0800
X-Gm-Features: AclHuK8Qkz3X25XXdy-9C9EEdeN42WIrLnKNtjHkZvDmYTXrW3Oj8Y0wgyVcNBI
Message-ID: <CAEy9hNXYymaNAkNbSY-hnjXhWGxSedSnmnoEFtLO7ad4zc5U3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn
 down, across suspend-to-idle
To: Vlad <tvlad744@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlad,

On Wed, Nov 11, 2026 at 02:15:56PM +0200, Vlad wrote:
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.

Thanks for the data point from SM8750. I agree, and I have dropped
this patch.

Its replacement is an opt-in: the core keeps the host bus in
suspend-to-idle only when the glue sets keep_host_bus_in_s2idle, and
only the Rockchip glue sets it, for RK3588, whose PD_USB has
GENPD_FLAG_ACTIVE_WAKEUP. SM8750 and all other platforms stay as they
are. The RFC credits your report:

https://lore.kernel.org/r/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmai=
l.com

Best regards,
Arun

On Wed, Nov 11, 2026 at 4:16=E2=80=AFAM Vlad <tvlad744@gmail.com> wrote:
>
> From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
>
> On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> > Suspend-to-idle does not power anything down behind the drivers'
> > back, so there is no reason to end the power sessions there. Keep the
> > core, its PHYs and the suspended ports, as is already done for wakeup,
> > and mark the device as being on the awake path so that a power domain
> > with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.
>
> A data point from a Qualcomm board where the first sentence does not
> hold. I have not run this series; what follows is the existing "kept
> for wakeup" path, which this patch extends to every suspend-to-idle.
>
> On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
> node is a wakeup source, so dwc3 keeps the core in host mode. The USB
> GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
> set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
> the same. With a USB stick on the port the xHCI then comes back like
> this, in 3 of 3 cycles of 150 s:
>
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0=
x669fd3200, fsynr=3D0x370011, cbfrsynra=3D0x40, cb=3D5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint com=
mand
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume d=
ead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
>
> With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
> same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
> passed as well.
>
> This is the third point of the Sashiko review seen on hardware:
> device_set_awake_path() does nothing for a domain without the flag,
> and the core is treated as kept although its power went away. I would
> expect 2/2 to bring this failure to SM8750 controllers with wakeup
> disabled too, unless [1] is applied.
>
> [1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
