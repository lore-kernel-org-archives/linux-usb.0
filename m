Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130023EA94
	for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782071381; cv=none; b=KO47+ggVUdsrjLgmIMooojYmNHQoRiwnQ6zOsXEUlGoVd65WY5PkSUIydp80MzOwCasaWpZiTftM840BQLiipxfZfx6ErLmBOwkFWT9JUXovg/BdB3creJWhNXzMHAhNbf/CNXxoEAVN1EVt5DXYnJhXDgl5RkCI/Ry7i/QfRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782071381; c=relaxed/simple;
	bh=chI9OpxNQDNUgM251oczInCTACc4rk/pG3bkjB3qT2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwtDs2Nma5XWGyKbQTBXyVTaaL9CevZIReyLZCGwD0WFQNXLtMhl+4ahnJztTaTlOWj3OD3m0UTfOzXT2n50ffAKvN9EkHs54yBpVSOiTlujRiZDqi3haDqcfo5F7VyY5zwDA4qr3Z99OgHmm2HU9a8XbdfiBFTb4gVqJMP358o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=superscalar@gmx.de header.b=Qwt9qW5u; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=superscalar@gmx.de header.b="Qwt9qW5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782071377; x=1782676177; i=superscalar@gmx.de;
	bh=chI9OpxNQDNUgM251oczInCTACc4rk/pG3bkjB3qT2w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Qwt9qW5ubhHub5XrfrOM5ma7T4jrQDFeuyrSPEPavo/Z93c9yUJvFfoEbLAhGhPd
	 6sUekz/epg2ggnb6Mm/xa0Vb9LnVtVkRNrP6IxNOOTr4PjFGwxkGA9XBWfRPCKj5+
	 CFXOx7urDDl6ROgSF0X5KUfQiJV/s6uDS463V6uDp/nj58IbvGEj+jAYPLjsiHgyo
	 PifTk7IeeaQBz6yfsgAgcnt8DqcrivvyMbQ3COI7P0cjFDvfOEp3lrn5Dqh5m+1Ub
	 OWSw9lxxriMdUmNqgr2q7IeFYoXuIGnWxPZzUi/awfa6GDrV94QZYwKsxP/pNsPpn
	 e63wM9uF8BfWMO1vTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1woHFv47cl-00MzRY; Sun, 21
 Jun 2026 21:49:37 +0200
Message-ID: <5aecf27c-7e15-44e2-a310-13bbb3fa7a48@gmx.de>
Date: Sun, 21 Jun 2026 21:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] xHCI: AMD Strix Halo [1022:158b] isochronous full-duplex
 USB audio instability (frame active: -18)
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <48aadb68-b4d1-4dd6-82ca-76d0846b4ae1@gmx.de>
 <20260621202845.77536cd3.michal.pecio@gmail.com>
 <d7785c3e-4062-4e2f-90ec-15dc86ca11cb@gmx.de>
 <20260621214215.378d505a.michal.pecio@gmail.com>
Content-Language: en-US
From: Ingo Haenlein <superscalar@gmx.de>
In-Reply-To: <20260621214215.378d505a.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/im5uWP7Y/yJboe1bus4Z13WG5zwYrM0sWZ919h2PRZVaKM1rRD
 Em86p1MFJvdDodcTtmBU65w/TX0JwqO5bWpUujVp69WPNMGOyncAsSWkLD8FN/eX3tOXHcW
 pN1jex6uvax4DB5fBBJ+6rMAWlohsdIr3HgqVeKV/J1Wpk2wWe+GE+NNdwfGxpzImxF3RfU
 AC/SMrL0Xv54dat8J68Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NsoJrVW92Ag=;+lPv1QgTjv5SVRt3NZci54uUb56
 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

Hi Michal,

I tested the suggested stress-ng --stream case on the Strix Halo system.

In this run it did not prevent the issue. While stress-ng --stream was
running, jack_delay still showed repeated discrete RTL jumps between
quasi-stable plateaus, followed later by a larger disturbance with ???
readings.

Example jack_delay plateaus from the run:

444.579 frames=C2=A0 =C2=A0 9.262 ms
444.579 frames=C2=A0 =C2=A0 9.262 ms
444.578 frames=C2=A0 =C2=A0 9.262 ms

437.579 frames=C2=A0 =C2=A0 9.116 ms

479.579 frames=C2=A0 =C2=A0 9.991 ms
479.579 frames=C2=A0 =C2=A0 9.991 ms
479.578 frames=C2=A0 =C2=A0 9.991 ms

Later in the same run it became more disturbed:

489.580 frames=C2=A0 =C2=A010.200 ms
489.578 frames=C2=A0 =C2=A010.200 ms
???=C2=A0 =C2=A0 =C2=A0990.580 frames=C2=A0 =C2=A020.637 ms
469.642 frames=C2=A0 =C2=A0 9.784 ms
468.505 frames=C2=A0 =C2=A0 9.761 ms
452.259 frames=C2=A0 =C2=A0 9.422 ms
420.883 frames=C2=A0 =C2=A0 8.768 ms
...
???=C2=A0 =C2=A0 1003.461 frames=C2=A0 =C2=A020.905 ms

After that it again reached other quasi-stable offsets, for example:

451.579 frames=C2=A0 =C2=A0 9.408 ms
451.580 frames=C2=A0 =C2=A0 9.408 ms

493.580 frames=C2=A0 =C2=A010.283 ms
493.579 frames=C2=A0 =C2=A010.283 ms

During the same run, dmesg showed a large burst of xHCI missed-service
events on the affected controller, mostly on slot 1 ep 4, followed by stre=
am
stop/start recovery.

Excerpt:

xhci_hcd 0000:c5:00.4: Miss service interval error for slot 1 ep 4, set=20
skip flag, skip now
xhci_hcd 0000:c5:00.4: Found td. Clear skip flag for slot 1 ep 4.
xhci_hcd 0000:c5:00.4: Miss service interval error for slot 1 ep 4, set=20
skip flag, skip now
xhci_hcd 0000:c5:00.4: Found td. Clear skip flag for slot 1 ep 4.
...
usb 7-1: Stopping sync EP 0x81 (running 1)
usb 7-1: Stopping data EP 0x1 (running 1)
usb 7-1: 1:1 Stop Playback PCM
usb 7-1: Stopping data EP 0x82 (running 1)
usb 7-1: 2:1 Stop Capture PCM
xhci_hcd 0000:c5:00.4: Stopped on Transfer TRB for slot 1 ep 2
xhci_hcd 0000:c5:00.4: Underrun event on slot 1 ep 1
xhci_hcd 0000:c5:00.4: Stopped on Transfer TRB for slot 1 ep 4
usb 7-1: Starting data EP 0x1 (running 0)
usb 7-1: 8 URBs submitted for EP 0x1
usb 7-1: Starting sync EP 0x81 (running 0)
usb 7-1: 4 URBs submitted for EP 0x81
usb 7-1: 1:1 Start Playback PCM
usb 7-1: Starting data EP 0x82 (running 0)
usb 7-1: 12 URBs submitted for EP 0x82
usb 7-1: 2:1 Start Capture PCM

There were also later overrun/underrun events and further missed-service
events in the same timestamp region, for example:

xhci_hcd 0000:c5:00.4: Overrun event on slot 1 ep 4
...
xhci_hcd 0000:c5:00.4: Miss service interval error for slot 1 ep 4, set=20
skip flag, skip now
xhci_hcd 0000:c5:00.4: Miss service interval error for slot 1 ep 2, set=20
skip flag, skip now

So on this Strix Halo system, unlike the Fire Range report,
stress-ng --stream does not appear to be a sufficient workaround. The
failure still reaches the xHCI missed-service / stream-recovery path.

I also tested CPU keepalive load:

stress-ng --cpu 32 --cpu-load 20

That did not prevent the issue either. So on this Strix Halo system, neith=
er
stress-ng --stream nor moderate CPU keepalive load appears to be a
sufficient workaround.

So the current result is:

- same general error class:
 =C2=A0 AMD client platform + USB-audio isochronous traffic +
 =C2=A0 xHCI Missed Service Error / -EXDEV / stream discontinuity

- but different mitigation result:
 =C2=A0 generic memory-stream load and moderate CPU keepalive load do not =
avoid
 =C2=A0 the failure on this Strix Halo system

Regards, Ingo

On 6/21/26 21:42, Michal Pecio wrote:
> On Sun, 21 Jun 2026 21:19:39 +0200, Ingo Haenlein wrote:
>> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Miss service interval
>> error for slot 1 ep 1, set skip flag, skip now
>> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Found td. Clear skip
>> flag for slot 1 ep 1.
>> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Miss service interval
>> error for slot 1 ep 4, set skip flag, skip now
>> [Sun Jun 21 20:44:14 2026] xhci_hcd 0000:c5:00.4: Found td. Clear skip
>> flag for slot 1 ep 4.
>> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 5 active: -18
>> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 6 active: -18
>> [Sun Jun 21 20:44:14 2026] usb 7-1: frame 7 active: -18
> OK, I see, it's "frame %d active" and I searched for "frame active".
> Anyway, it's sound driver reporting EXDEV completions, as expected.
>
>> Regarding the related thread you pointed me to:
>>
>> https://lore.kernel.org/linux-usb/18b4e4f7089aa4f1.da8dbe994ae3bb77.445=
e21b98b0b205b@GordonMsi/
>>
>> I checked my Strix Halo system against that LTC/LTR angle. I do not
>> know whether it is the same root cause, but the error class looks
>> similar: AMD client platform, USB audio isochronous traffic, xHCI
>> missed-service / -EXDEV.
>>
>> For xHCI 0000:c5:00.4:
>>
>> /sys/kernel/debug/usb/xhci/0000:c5:00.4/reg-cap:
>>
>> HCCPARAMS1 =3D 0x0118ffc5
>>
>> Bit 6 is set, so xHCI HCCPARAMS1.LTC =3D 1.
>>
>> However, lspci -vvv for the same xHCI function reports:
>>
>> DevCap2: ... LTR-
>> DevCtl2: ... LTR-
>>
>> The upstream internal GPP bridge / root port 0000:00:08.3 also
>> reports:
>>
>> DevCap2: ... LTR-
>> DevCtl2: ... LTR-
>>
>> So on this Strix Halo system, xHCI advertises LTC, but standard PCIe
>> LTR is not exposed on either the xHCI function or the upstream bridge.
>>
>> I do not know whether Set LTV would reach the AMD fabric through an
>> internal sideband path on this integrated controller, or whether LTC
>> is USB-link-scoped only here.
> No one knows outside AMD and I'm not sure if it would matter anyway.
>
> You can check if it's the same issue by running "stress-ng --stream",
> which is supposed to "fix" it by keeping the SoC out of idle.
>
> Regards,
> Michal
>
>
>
>
