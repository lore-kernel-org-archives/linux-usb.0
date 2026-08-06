Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70EB33A9F8
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026927; cv=pass; b=SWLpx3Xivumvk/UVTpVtfxhmwsNlq7zcKd61l1vO1QqyRiOozrAMucmkw/mJplbK9M9rVseZ5uhjcJVmwV3F10xgfrJLa4lRGcEAgvFw0X4iWt+bq/atqSgyzJ4lCwu1Bf8WOUYzC3VuouXYv9QFO2NKK4FLVC1cDKT4lVwBzlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026927; c=relaxed/simple;
	bh=NdtH1xFFGcgiYjV9sZ5XIzxrlxNCQSywITJ/BUXOvX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JncxhyIQFQA2ZExk3fM1M4BltSG8RKzqGO5L5mbEfAveiUcmqLY/DDqO1zBoYn3tMCMbZ/xF9vv48ijm1XMvTVJupyiDeDhPybrBgD+qBma+RACK/WU4izov6vLKeEQ+hfJKXuMIqmPjDBx6179HMfNYutOW2XwBuSO48geqTzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zu0VHNqw; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zu0VHNqw"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7ee125ec926so1637495a34.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 07:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786026924; cv=none;
        d=google.com; s=arc-20260327;
        b=Ic/UCWLLCwJAN+7uECky36phQe6tJlldMtNCB4PkTs/xjMkPhgDfpHHfFyYf9BMzUc
         owBSzb09oVLcabYr+VbV0YR2PiyrnntUWy5JKbr2E0z1rkPFgB4fRcCFFjumvutq3+So
         gQQNKP8/s+NjuqIuPrPIigj/CwzPknsPpvu0zKSocGYRb6DwSZKXxxCEWXMYA/VTtt5A
         nCWYpQUJ5bnI3JJ1ebtS7L5McWWsoT+HqCIp7/I9vuP3PBDh7dEWsvJLQr+ZZX6Snr2E
         PuqBGZWZvrS+YfEG7tnmd7qwqoPuTVJGTHcph2vHEsnErMAzHvaRk7pi4ZIcOB72zTu+
         XgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3KxyFK3uoZ3NfW+v/d3K2ISGzYgFiPPlZtOpBCS9N4=;
        fh=DjnoDMKMHIriSJAEsNnQGrdoGprl0pHW7UGucztMXMo=;
        b=OkkAXs1Ebo1j6ncCyb0KxHeF3nBiPx8XZ/xHbpARy2OJ6AcbojRBSnsRy6QorROwQt
         36b1jcgLE4bLUmWQf+BDvMSJ0sNmuzvf8Rwe2hSIbVpJhqXl3tCQE0IuNrPCKg/Ab5M6
         fozhEXZH5iGRQ+ttiwThNT9zQtGhPNI8Pby3lbwFb6ZToCo1thkxrWYOWnkmSEQRFI47
         +7BIOMpZ2CLV8IrMas5UKblYzLoHs9lInEMMnKNfhfUTt6YKFwVREyNN0qIWUVWxWUKi
         bHV6fGa5ESIp1VOUoBj9XSinprq3dmBozNp8Ts//xA9oA1nBupKhCB3OzkOPsI45KH9a
         VYqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786026924; x=1786631724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3KxyFK3uoZ3NfW+v/d3K2ISGzYgFiPPlZtOpBCS9N4=;
        b=Zu0VHNqwz3rC6i/JWfRJlAtdFwLLpnKVOxO+FLd6k1gA1Xb5z+mXDvql0ThPiTmUad
         h8HO3vU3r9X8a4FzOv8hmDxuFH5dpE1Q+uAZ1W6Cqy79l8G2HV5HK+N9mxE+fYRVzVdc
         5XdNi0cgG8l9VeK90Ihfuqi2EKNfWl1BZzMRCG5Xwx4WpD083ai711+lCOnEc2p6z7t4
         56fqLCIvny9q4r9kHtNFO1c22cSWQij8UqSn2x0IyQIDJek5Wbtsic0G7b3zr6tDTuhj
         JCjns6YYic8itQPepp9oQe/SXKUwY6F/8VmxmlbiS+b6tN6CyFPWNQwjoAzF/ye7HgR6
         dNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786026924; x=1786631724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3KxyFK3uoZ3NfW+v/d3K2ISGzYgFiPPlZtOpBCS9N4=;
        b=nWH2EblxQZShBUdjFQcNN4txMtcWczrUrP5uAGO7GwJldXFpPORMjtUzasDAYxk2nH
         xVYe6eoDJ3mYARMXwRK/HxDvLbo1qKNMuLpSoKG9Dx4COwnnV1WbiWoO2BAAE7w+Ci7D
         5B39DJ0tnt7MCpTxbwvaOaePkoXgjO8r1AB7canWM1ZOj+S26leHD1YEkovFUX4pgfZC
         0eS0J5ldQEXFf+BgIi6jWCFYqpAzB8qvKLgA5uLzLwhZbDOq/SDi0FDcfamlfydw9udk
         g/cZRtJFTJkCgbicUU2H+rK4TJT9baRcPuJ5W04oXjZWAH1eUKNRvDh1eqY0c0TsVhVe
         BSEg==
X-Gm-Message-State: AOJu0YzNF6Vbg1PjAK5hdOiDoZKNWvKs3oenKoUk1BOCUQCxL5qjrAi1
	PN4HU9yh+vNpGMikIwW/38bHcwa+iGp7K3DASBet13Q16hF4mGsI5XO8hnkOTjaDsxaSYpSV6sh
	Xf8Nvy5i580d1BelEAsZ8PD2RfKkX1+pm94pZfIhi
X-Gm-Gg: AR+sD13BWkyurlNVsElFkklqUSLT1Y8WSqkYpyvYwwGbS+EbeDgrzkvv9ajUsT6LdvE
	H4r5YbnLzNR/Etlg6L7NABh/Yud7zpIPV/8H4WmZgif4SIYZRo8uCCMGt2jSkjfSnMtMWa8NbKC
	F6I3ONLT5gaYwdaHDMkfCdbnTzaUtS0hOz9g9AAVllRpQGQj+mQrdJTObjsthcxh2xJTXF+JLkq
	r2RcAfsCCKC0uMbweimleMyPyWmtRHIb2Ztj7qU2tBOvizWnPjWJGGfauAKQRdAtANaij5fFe3i
	+HbW+c4x0nlEALYjFuNIbns3sPVjv+wby9dGYiyQnoDWttt8KTJVmeGVpaxPDEe0ovINWRwdXHs
	AGupQpW25RxD5pOgE+pat/cK1yeqfPehFuu0lUgk6lo7Uc1eZCGjEIbAJrLQ0Xk3MHWRKa/FG/B
	/h2twieoSfntjx
X-Received: by 2002:a05:6830:6b0a:b0:7eb:c933:efef with SMTP id
 46e09a7af769-7f1e5f012d8mr10558769a34.14.1786026923999; Thu, 06 Aug 2026
 07:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026080322-obsessed-daringly-e6df@gregkh> <20260806142511.2337081-1-nogikh@google.com>
 <2026080617-gave-widely-c5dc@gregkh>
In-Reply-To: <2026080617-gave-widely-c5dc@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 6 Aug 2026 16:35:12 +0200
X-Gm-Features: AUfX_mzZPSC-0Q8aRJoqm5lwHTUm-1lAKHvE0QUwHrgLy3cPWtCKW_UfrQkGQko
Message-ID: <CANp29Y7R1OzK3mo_i6uBxLV6zCgFUVxMgrfozAT-QNivp+gHMg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: usbtest: disable dynamic ID support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, syzbot@lists.linux.dev, 
	syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 4:32=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 06, 2026 at 02:25:11PM +0000, Aleksandr Nogikh wrote:
> > The usbtest driver relies on the driver_info field of struct usb_device=
_id
> > to point to a valid struct usbtest_info descriptor. This structure cont=
ains
> > essential test configurations, such as endpoint addresses and test mode=
s,
> > which are required during probe.
> >
> > When a user dynamically adds a new device ID via the sysfs new_id
> > interface without specifying a reference device, the USB core initializ=
es
> > driver_info to 0 (NULL). When a matching device is subsequently probed,
> > usbtest_probe() unconditionally casts driver_info to a struct usbtest_i=
nfo
> > pointer and dereferences it, leading to a NULL pointer dereference cras=
h:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >   0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
> >   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f=
]
> >   RIP: 0010:usbtest_probe+0x3b9/0x1280 drivers/usb/misc/usbtest.c:2822
> >
> > Because usbtest strictly requires pre-defined usbtest_info descriptors
> > to function, dynamic ID binding via sysfs is fundamentally unsupported
> > for this driver.
> >
> > Fix this by setting .no_dynamic_id =3D 1 on usbtest_driver. This instru=
cts
> > the USB core to skip creating the new_id and remove_id sysfs interfaces
> > for usbtest, preventing invalid dynamic ID entries from being created.
> >
> > Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D7e1e5911f9eac50bedc7
> > Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
>
> Shouldn't this also get a cc: stable?

Is there (in general) value in cc: stable without a Fixes: tag?

>
> thanks,
>
> greg k-h
