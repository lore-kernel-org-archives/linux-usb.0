Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022945;
	b=Yd/XSI19GPh/zaFR9156BP21OCayspDXdtsvUrqwXuIqSoEMIPU9Gs6eF0ZZ5oWC9yjD
	 eLmUrH426Mma1GG1WcAes91ElEpZOaKwaqmZu3v0qVZZco8k/mXWGN0A4E3vECBgRxXhX
	 lRDaT6SdhBkw8WI1i/N5YF3jThvexgh/lLAbYTdetbMtm5dBFx7NghyYu1lDcd2aVCvqe
	 2Eal9KaPXu2zooOCdyg49zr2FlTTv2GqeYHhQ11iAGzdse2IjR9cKj2NqfuFL5gGZeDqq
	 +/atiiOVo6MfOb3DhlCoyZwH71xy5LlCMJY7h662qG+gPa+DaoBuc32/h5o5HHr2v3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022945;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=XDgHXe6Bb8w42VA4k6FnS9eFPPzrHsfXQRQSjV01KlI=;
	b=WrDGdOtpKr7IPVYNCGL7QkPtJluCzCv5r6mkwSL8V7AcY9ShmTkGN+gp8tcSYs4kPBJI
	 aF4buw8XVwMcHKCZO8/dyFJIVZb7k+jqsEHnmtSDz5YooIAdrkFAAisk5IWeDKCQALGTi
	 uQOoc9+98hi7pyd3bBER56PZAXu++lNCXtRO3rmedTmbeH/dl9ielhEW61sGl+t3g990F
	 dALa1OORLxI3z9Lc58z0nys4T++KhXT1i2r7/d3sDPCI9c1m4hjAD91KG/RUXYrgKfiOd
	 83TYH0BCHKhSFkLvPHfu3JTSlHprI56lp6wd06EQKoPXKF3qvAa5gFxii3TiD80/Paw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=PDSImRUN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H1I7pYNc;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2DB606A31E
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=PDSImRUN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H1I7pYNc
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 947F27A035D
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:55:43 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 26 Oct 2026 09:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793022943;
	 x=1793109343; bh=XDgHXe6Bb8w42VA4k6FnS9eFPPzrHsfXQRQSjV01KlI=; b=
	PDSImRUNraFPxspJFstOieCRLxcYWjaGPltk0xK4YHyvenBFoTRTgOu4XOpWyCWj
	3XgY6PK9Jh05u4b4KzS2dyIWPqTtVZSgekIQuJz37geq0yOYZftoKWQ3Nj7MH4Fu
	9o3vJ53sVcin9+0fv45TZUwftkz7ou6A9W04ylkDyVHIZsqhk0t5tKACzC4u2FhL
	3woWJqttvJOPzy0ZLW8bRFsXdyhcugQVObYUxNmYVUnftwXdB63+aNvG2peWs9h9
	2D4nBCwr3jFDVQXnY/8BfB4niBf1SASvYLWxIPgw1LiBnAZWn9KK+1IsrCHKo+mb
	JuXo00Dkk5omFW5dxcyRtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793022943; x=
	1793109343; bh=XDgHXe6Bb8w42VA4k6FnS9eFPPzrHsfXQRQSjV01KlI=; b=H
	1I7pYNcZ5Bp7WnhTswWf+wIl0En0cFMZt4HUTSYiWkOGmhvz2qevLQnjsI6WSsHm
	B+bmYr6nrXGE4XbCjiaAh5XtFLG9RpQ3QPm3w3XwllG1V9MgXdzQMyh29SxHMUaI
	Oozw19ksBadqy1gk3LrADMnnY+lxI0/cH0CNY8MdX885sk4nqQl+KqUu/D/oBZdu
	9Pegli41Ep1tdmcfP9XzxI1nGawKZFxpzZZSPBQrKNTDABhQAHl4Hm9gPrJpcCM+
	BtzIc/Gbl3SvWQiX1t9P5JktCmfOuMmEnezmYlMDT9vcKvuK60rLzUgc4n3J7XyZ
	YcMwGk35fO59wpl0zMUgg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793022943; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:RmUm/2/8l2Y5iZRW+nTfgst5K1bSOpxUV7w95j84SoTwA53
	ngaAnk8TVHvLPERMPpbK45j5AZxXO/WJxKLpBYhHlTAy012PPJ0VGXmCHbNeUCA7
	FYAJK6Gry/WhV30aKi4AvkOfNZrXm3tmq2kP4XOd51KOrbB/vZxVa7GeG+6qz9E8
	yXhox0l1Gttqd+AAu1u3TXcfZ8cmevQqEgPLfTXCuFgnZtlrB0GHq799ZU1XlKSZ
	0/qDsu8U8oYSubBl+oY2yBol2vE8w/G1lYubnzm2bhzoJ3gDxNxn+Fg9FKo2D5kS
	MKNA17fxTcFjFyfKHfa3x45PYWuks8fuI/fE5WA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3ZWIBykMeTC1diLgBK2MYFnuIjrTm/VRjt104hh4Ajk=:YfjXOGeT+hUjCybm6dHkssJVoSU1Pbc0LCDJTRZse6w=;
X-ME-Sender: <xms:3lvfaiqjkR3Zy8xgjY0inVBkIt_zF1tFR_lmruVU5A0c3fw16qee_g>
    <xme:3lvfarcI4SF03t1ltFN-7_JqTGFvpPV22LGNEy2FbTmYeQKXCrmZDgXt3bWI-stgp
    QZy-xTBtzWGyIhUzDGgSoUja9CQXJISBCZIOsaEPiw1Xtr92M1S9aL1>
X-ME-Proxy-Cause: dmFkZTEqaSni8ABq8jCpoKO1QPNM2vBAoTvP9lr3TsSTCxdUK62OkP3sKDELIr5/2r9KPo
    ilgFqYj3BsDuyapthymMoQEKR20RUi5666xPGsCPSIhRMqtpq3pIQZPQiZTV8/STyNKZXa
    j1rPjwI2vAmHWa9XWxWWkQUVFEaHmq5zbr9hcyjbc/8wNDyihpT5ak9ZNV3NkGGcPhXoua
    F4Y3GcWsua3mxlAoYUMESvfhWoNxK+Dcjxnfb3bjgLsuhHvu7bTA3a9/ZpzXM5Fy4WYFiO
    lLquBlWE6Hy8AhvCtI5nwaxe9oVE6mhitpeEFTEZbMSXfgp2F+HsDBmUkPpOfAkD/1zAiy
    8601QTeNThfZxEwObMxElBvVvgs/KKmKhe9mzinuUGbUhQRfK7d0GBzSUjWsQ//I8R/Tnb
    Eph8aynahhrsSY6DIR95x/5MYn4KBAVFmC4JOcm9D0YQee4TkBpwWu1Q1FRtkZCTZmb0BQ
    lUsoXECOp954Tt687dmcrjD+YG9mZZ7A0aUcouH1EfqdKLZpUQBySJMgfxyqO02BLQDVSR
    dledPDm4PUAH2CdShpRLey/QXwDEnVSqGsMa+zxDpww0Ud5tjwBxJjw9li/TK6XxCne7uv
    N2u1h0ONeB8hi1liCK9pMghi4cYvsczGl2jWvU4nu8/hzkg5yvcR5d/FgbaQ
X-ME-Proxy: <xmx:3lvfagOsYqIAKAhZTF2S7VUqC60lPWR0CBnjtPBzQHt-mgUsBEENkQ>
    <xmx:3lvfanFw4wEUi3YTiqEvjSehpC884iuMiBoQJgcUWju5o9XO7TDTQg>
    <xmx:3lvfavNv2zgxS7mRRK9MHyS404VL4C5I8EvTeoFr13YhiwTtl7KtBA>
    <xmx:3lvfag-9Na3qOKLkn3CMlgPPe8x7egwEkXqCYFzHbYcM75KGkA6sBw>
    <xmx:31vfap4lkGwQOa_mugXMWsQ2eflg15HP2BRwaNF8WjJaHFQtEdpuPNd8>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 701DB2C00080; Mon, 26 Oct 2026 09:55:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AquoY0LMIP2k
Date: Mon, 26 Oct 2026 09:55:22 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Vlad Mykhailichenko" <dywedir@gra.red>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Message-Id: <d8120cf0-0244-447d-adfd-0d457116a01c@app.fastmail.com>
In-Reply-To: <ea0ed395-47a3-4982-8eb7-54059726e6b7@gra.red>
References: <ea0ed395-47a3-4982-8eb7-54059726e6b7@gra.red>
Subject: Re: ucsi_acpi: ThinkPad X13 Gen 1 (AMD) - VERSION reads 0, and GET_PDOS
 returns one PDO per command
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026, at 5:55 AM, Vlad Mykhailichenko wrote:
> Hi Heikki,
>
> On a ThinkPad X13 Gen 1 (AMD Ryzen 5 PRO 4650U, 20UGS2K101, BIOS
> R1CET86W 1.55, 2026-05-08), UCSI never comes up, and once it is forced=
 up it
> reports only the first source PDO. Seen on 6.18.56 and 7.2.10 (NixOS),=
 with
> identical PPM responses on both. The relevant code in ucsi.c looks unc=
hanged
> in current master (7.3).
>
> 1) ucsi_acpi probe fails silently with -ENODEV
>
> ucsi_acpi loads, USBC000:00 has _STA 0xF, but the device stays unbound=
 and
> /sys/class/typec is empty. Nothing is logged, even with dyndbg=3D+p. A=
 manual
> bind returns ENODEV:
>
>  =C2=A0 # echo USBC000:00 > /sys/bus/platform/drivers/ucsi_acpi/bind
>  =C2=A0 echo: write error: No such device
>
> USBC000:00 is not in devices_deferred. The silent path is the version =
check
> in ucsi_register():
>
>  =C2=A0 if (!ucsi->version)
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>
> The firmware's SSDT (LENOVO UsbCTabl rev 1) declares the mailbox as
> \_SB.UBTC.USBC at 0xCC235000 (0x30 bytes; VER1, VER2, RSV1, RSV2, CCI0=
-3,
> CTL0-7, MGI0-F, MGO0-F). Its _DSM read path (ECRD) copies CCI and MGI=20
> from the
> EC. Nothing in any table writes VER1/VER2, so VERSION presumably stays=
 0
> unless the BIOS fills it during POST, which it evidently does not. I c=
ould
> not read the mailbox directly because of STRICT_DEVMEM.
>
> As a workaround, an additional SSDT from the initrd (not a replacement=
 of
> UsbCTabl) sets VERSION to 1.0 at load time:
>
>  =C2=A0 DefinitionBlock ("", "SSDT", 2, "WATTSN", "UcsiVer", 0x0000000=
1)
>  =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 External (\_SB.UBTC.VER1, FieldUnitObj)
>  =C2=A0 =C2=A0 =C2=A0 External (\_SB.UBTC.VER2, FieldUnitObj)
>
>  =C2=A0 =C2=A0 =C2=A0 If (CondRefOf (\_SB.UBTC.VER2))
>  =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If (((\_SB.UBTC.VER1 =3D=3D Zero) =
&& (\_SB.UBTC.VER2 =3D=3D Zero)))
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \_SB.UBTC.VER2 =3D O=
ne
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>  =C2=A0 =C2=A0 =C2=A0 }
>  =C2=A0 }
>
> With that, ucsi_acpi binds, port0/port1 register and are linked to
> usb2/usb3-port1 and usb4/usb5-port1, and no PPM errors are logged. On =
7.2.10
> the existing reserved-bit check also fires, so GET_CAPABILITY from the=
 same
> firmware sets bit 7 of bNumConnectors as well (0x82 for 2 connectors):
>
>  =C2=A0 ucsi_acpi USBC000:00: UCSI: Invalid num_connectors 130. Likely=
 buggy FW
>
> 2) GET_PDOS returns a single PDO regardless of the number requested
>
> With a 45 W USB PD charger on connector 2, the partner's source caps s=
how
> only "1:fixed_supply 5000mV 3000mA". ucsi-source-psy-USBC000:002 repor=
ts
> voltage_now 0, current_now 2250000, current_max 3000000, voltage_min/m=
ax
> 5000000.
>
> GET_PDOS via debugfs (partner, source, connector 2), one PDO at a time:
>
>  =C2=A0 offset 0=C2=A0 0x400820010 -> ...5383ff01 0801912c=C2=A0 =C2=A0=
fixed=C2=A0 5 V 3.00 A
>  =C2=A0 offset 1=C2=A0 0x401820010 -> ...5383ff01 0002d12c=C2=A0 =C2=A0=
fixed=C2=A0 9 V 3.00 A
>  =C2=A0 offset 2=C2=A0 0x402820010 -> ...5383ff01 0003c12c=C2=A0 =C2=A0=
fixed 12 V 3.00 A
>  =C2=A0 offset 3=C2=A0 0x403820010 -> ...5383ff01 0004b12c=C2=A0 =C2=A0=
fixed 15 V 3.00 A
>  =C2=A0 offset 4=C2=A0 0x404820010 -> ...5383ff01 000640e1=C2=A0 =C2=A0=
fixed 20 V 2.25 A
>  =C2=A0 offset 5=C2=A0 0x405820010 -> ...5383ff01 c8dc325a=C2=A0 =C2=A0=
PPS 5.0-11.0 V 4.5 A
>  =C2=A0 offset 6=C2=A0 0x406820010 -> ...5383ff01 00000000
>
> Four at a time, only the first dword of the response is a valid PDO an=
d the
> rest looks stale:
>
>  =C2=A0 offset 0=C2=A0 0x700820010 -> 0x01100200012000015383ff01080191=
2c
>  =C2=A0 offset 4=C2=A0 0x704820010 -> 0x01100200012000015383ff01000640=
e1
>
> ucsi_get_pdos() reads one PDO, takes num_pdos < UCSI_MAX_PDOS as the e=
nd of
> the list, and stops. GET_CONNECTOR_STATUS shows the RDO selecting obje=
ct
> position 5, operating current 2.25 A:
>
>  =C2=A0 0x20012 -> 0x0110020001200001538384e1202b5b60
>
> so the contract is 20 V / 2.25 A, but the psy cannot report the voltag=
e,
> because the kernel only has PDO 1.
>
> Questions:
>
> - Would a dev_err()/dev_warn() for the version =3D=3D 0 case be accept=
able? It
>  =C2=A0 would have saved most of this.
> - For VERSION, is a DMI quirk that assumes 1.0 acceptable, or would yo=
u=20
> rather
>  =C2=A0 this stays a firmware problem for Lenovo? Mark, is this someth=
ing=20
> that can
>  =C2=A0 be raised with the BIOS team?

I'd missed that I was tagged on this until I saw Heiki's response. Apolo=
gies (so many emails...)

I've created internal ticket LO-4726 so we can see if we can repro this =
and follow up with the FW team.

 - As Heiki notes, probably not suitable for following up on the mailing=
 list as it is a FW issue. Would recommend either a ticket on the Lenovo=
 forum (forums.lenovo.com/linux) or just follow up with me directly by e=
mail

 - This platform is old and right at the end of support. A heads up that=
 it's going to be tough to get the FW team engaged at this point. I don'=
t seem to have this HW on hand either so asking my colleagues to see if =
we can repro. Just flagging that getting a fix in FW, whilst likely the =
right thing, is going to be a challenge.

Mark
