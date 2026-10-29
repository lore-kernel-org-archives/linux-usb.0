Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793240730;
	b=N1RJWjpscO9/RRf/mHta9uTOqeMabf/3uicB2FwrUTFrfNeqLIcgvKlLIWifx+apyIYh
	 2VTI0G2wW4SynmcP4gG8A/dbaKKO3sjC8qaZ7NU+y8cXqV8Q3qFoZBdy2Vii81fZSbkWr
	 xEJYUkoexvlzP5znVEZg1zz6D5BWXejdL708CXI6n+jMrntRH9Zg+UksygvF23EKt5E9j
	 b5eelk+E7zrJTqQvdq4jUJfQMnpJm0MMEULW+t5nkC7TLFbBduEqzp61jBghoXDOg2Gpy
	 sV9DzE7qcIB0BJ9AAe89hirQNd2gsmj5mEcvcRP/Lqsw23NtQUA9b69LWJx6tW85hSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
	b=Cb+rBPc2H3AAB4z99yUv26csTI5OpLjU77KVJXwFBGZV174H9l/fG947i6LQL+nlT/OI
	 CUkaTbq1EAs+kziVpm9AgCrg926vbYQttA8M2320zoiSSFemuEPadihEjMMCwaITAZw2N
	 OjrsTW6VIsNcJUUAaEYViys5Prk6iGSAbzUGsjMUYqYlY/CjARmS1ooDcpxKlJCHmzyXK
	 Pmr9tYu7eUJQsuaBIHpK5DqQF/aQZd+3j9s3Bd4CFQ7uozrZ2orGPQm55qrfd38PR2xlp
	 h8eUNURM5qhedA/M+ZThcSzuUt7eXo73hx51huc9xIepRBto1LKj0XHtzcCiIQwVKcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLqpNHP;
	arc=fail smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F62606A31D
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 02:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLqpNHP
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823b938464fso1129978a34.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 19:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240728; cv=none;
        d=google.com; s=arc-20260327;
        b=qNalVUNOYu3HrMNyZ6/6AZ7OnesE7OeTGSr0eovZymaSNUVL4TSMREHeYoQo4mDkr9
         U8Niq4xL+P50gJbRizLPoMMzMRahnzxZC5vSlPA5YG/PLIYX/Dx8mTdmEQM1oRL6vqr2
         bZVRH105iDCkHVnPHc1IOs41vf4rkyVEbjFXFLo4Lv17zyF69eJnBT75twwVzXjKez+m
         ltJiER3kvVfBVdInP0FqpV1xkP97ge5WR0EzgFJfjhPWHQEIxr3RWips9XgXE92bCZQ0
         fHtyod4wwmbTk7xlAnwnA+Ga55bF9ftHqkM6MsH4i+3Ehc84aB+gecct+5pgHj7YP32C
         at1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        fh=WiLY1PjGVBuTwpRTb+eHBQLBaoU/reSDzk/OECNiti0=;
        b=aeGy6w/uw3wQ6grkvfh5W7rx6NAcz8ltRCxtm3RGwzEYgfqaq8r5EIQ+/7e1PeSCJR
         7rbVrGqDOHpIGsXTGAW4u5Z1ooxFsjR5y7up0RRVapvmvnYibIXulHE4OU1Hzxb03Nu+
         LZ2e6ig3Y0Q70j9OzfeXxc0Pd1rupdMEcSgoAgPhqVD8vCqud9SJZjKrXvvNKyb5freP
         qYLjhDUkJdtsZVR1DNvDbkjm1Ij3WzC7D87Jw04RL8bdDz3JghDM0vKxMhlR3IJPxqBg
         qqX+7AAGrQkfjYkqNBBSm9fkIBzXhUgX3TE6g+YUk9rKG7EdIt4yaCx3Eseu4eCWyHH9
         Zp8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240728; x=1793845528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        b=rrLqpNHPmoyjvTVXcgriO7Urn3CAdbOtl6SWdtR2Kc+m39GbUjHB0sidRN8ITutXYc
         KUSLc6jY5wffVfDNJhoFFp7X9FCSQA+33STiVTZ2FjFkYp8TSG60C6r1S+5BRcFKSmei
         bheGuhffuNW0FZTbGs9Bxn3WpAk5NRs5I7L80b00rCk7gBTXAeKH6fIQkvR4IH5KtdHd
         /IKH9a5lixQsscIAf/sh1pxqhLTlFPbkYl/4usF3Pv2lCj4kvNANqpOs5wwmsj4HpkkF
         V9mowesznZzsM6SUMZa3cdijtzeOqgJRB8W11+B7X4pt25XqSPM+diKqkMIYUKYs9Ae9
         v7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240728; x=1793845528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        b=ScyrMO4btCO1Z1H/7PNbZP94X55vzO+J/AiV2H+/BqTAcKW/fdrB7j/u9YjngSsGk/
         Zhn5ws4hD46XqeQWGGF3BRqXSmIdvmBFvEPuN2ob4Va9dJbG5yMMSriaFADQta5K6L/U
         tOSuPuURDCstxGptL9MK7CHOpU/1VR3V8G5WUo0ODPNd6co+VURKdRkliDRvEgAHaI0a
         lDptq9q0VOABMVF581JvtPKyGy4hygoHK2M9EhxSS6LnW+X2ozOyrVzETMc4ShlvDV83
         c6Fe/1/3LSGE3rnUpC44XvU/abZX5dNLAr/LIoNYxxhx36g8kDWipyBDKj6cQcBtO0Uo
         Z3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxNLtDsQqL0JS4ubXtvvpaCmAA0p0SlELIHDvyZBatQpDCTFkvTH4B9x83qVujww42e/5SG234dd7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU4iiXwnvRkf1jTGQ8JomZB7FIieR8BT/nXMtME83Z0ibyebj4
	CgCqaY2pmgTgQyc4hQuvx9b86+1ZiVrRJC3VrBtvrG28BY+JsgI1cmCl7euc6PDIc9DvnFRDUMG
	XnVxyAW1N0JT/VIDFVgpkwhMqBFaomXf5R9Kr
X-Gm-Gg: AYBFou3tP0KmhdYivSz1Etrlda54t9rXdCP3/e3XGyfBdSDm2L7GjsfkkH3NbyAHXXy
	fuJYjMlN+pXav9xng9nD/tQ2wZFGPCoGVx6Ede76NOEzuqIiEIOakr+FgInT3bADe1/BpNRhl0T
	L72q5HXuKogRDZdH4WTcHZbB7/NbNFABAyvclVrbzteaoS/sFfr2qg6QFr5GzEoyw7nDT+trGJq
	GtYmay+zcw4COv7eK4b4JEcheTlMJiW7z2dKAUVVtjZDPsEHNA37h78Dab3p/rcTYKfi1tOWnDl
	MX/rLu6Jo5QY038cb2F2UOnC+urna4MWnM24gSybg3PGUagn75gXUwtJsMxZ1H4MuMpbDf0VOvW
	1JxJpDgszE9JnG2dEUL/LkGJxYlHFxxLLtcZsnrg=
X-Received: by 2002:a05:6830:2b22:b0:81f:22fd:6ed5 with SMTP id
 46e09a7af769-85ab929bea9mr4207273a34.21.1793240728513; Wed, 28 Oct 2026
 19:25:28 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
In-Reply-To: <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Thu, 29 Oct 2026 10:25:17 +0800
X-Gm-Features: AclHuK9d_Y4NwcLAID_WoSD1jcWekDk2VdLFqupARR4n9WQETwi-Tu-aoyzptUQ
Message-ID: <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply.

Kuangyi Chiang <ki.chiang65@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=8818=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:58=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> Mathias Nyman <mathias.nyman@linux.intel.com> =E6=96=BC 2026=E5=B9=B49=E6=
=9C=8816=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >
> > On 9/16/26 04:33, Kuangyi Chiang wrote:
> > > Hi,
> > >
> > > Thanks for the review.
> > >
> > > Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8814=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >>
> > >> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> > >>> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out =
when
> > >>> the device is connected through an Etron xHCI host:
> > >>>
> > >>> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2b=
df:0280)
> > >>> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (ex=
p. 26).
> > >>> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : =
-110 (exp. 26).
> > >>> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> > >>>
> > >>> Testing shows that at least 125 us between control transfers is req=
uired
> > >>> to avoid the timeout. Limit the workaround to the affected Etron ho=
st and
> > >>> USB device combination to avoid changing control-transfer timing fo=
r other
> > >>> devices.
> > >>
> > >> Any idea why it happens or why the delay helps?
> > >
> > > We don't know the root cause yet, but we did some more testing.
> > >
> > > We tested delays of 50us, 125us, and 200us. The issue was still
> > > reproducible with 50us, while 125us and 200us passed our test.
> > >
> > > Our pass criterion is 30 successful plug/unplug cycles on each port.
> > > So 125us is the minimum delay we tested that consistently works.
> > >
> >
> > Are there issues with the control transfers already during enumeration
> > of the device, when reading descriptors etc, or are these issues only
> > visible after uvc driver is controlling the device?
> >
> >
> > > We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
> > > long and causes UVC initialization to fail.
> > >
> >
> > Does it help if you as a hack set udev->quirks |=3D USB_QUIRK_DELAY_CTR=
L_MSG
> > _after_ enumeration and uvc initialization?
> >
> > >> How many other HCs did you test this camera with?
> > >
> > > The camera works with the EHCI host we tested without any delay.
> > > We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
> > > host (1b21:1242). This patch, however, is limited to the Etron/HIK
> > > combination.
> >
> > I think we should avoid usb device specific quirks in the xhci driver,
> > especially now that we know it's not really tied to a specific xHC vend=
or.
> >
> > If this is only an issue with the control transfers sent by uvc driver
> > then I think this device specific quirk should be in there.
> >
>
> Thanks for the suggestions.
>
> We'll do some more testing based on your suggestions, including
> enabling USB_QUIRK_DELAY_CTRL_MSG after UVC initialization.
>
> We'll report back once we have the results.

We did some more testing.

We don't see this issue during device enumeration.

We also found that the timeout is not limited to UVC control
transfers. In one failure case, the first timeout was observed in
a UAC control transfer, followed by UVC control transfer timeouts:

[  961.127402] usb 2-3: 5:2: failed to get current value for ch 0 (-110)
[  971.367443] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
2 on unit 2: -110 (exp. 2).
[  976.487473] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
3 on unit 2: -110 (exp. 2).

As suggested, we also tried enabling USB_QUIRK_DELAY_CTRL_MSG after
UVC initialization, but subsequent UVC control transfers still timed
out. In addition, UAC control transfers may already have timed out
before the quirk is enabled.

So far, we have reproduced the issue with these xHCI hosts:

ASMedia ASM1142 (1b21:1242)
Etron EJ168 (1b6f:7023)
Etron EJ188 (1b6f:7052)
Intel xHCI (8086:8d31)

The issue is less frequently reproducible on the ASMedia host.

The camera works with the EHCI host we tested without any additional
delay.

So we agree that this device-specific workaround should not be in the
xHCI driver. Since the issue can affect both UAC and UVC control
transfers, we plan to handle it in the corresponding class drivers.

Thanks,
Kuangyi
