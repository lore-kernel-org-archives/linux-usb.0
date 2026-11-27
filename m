Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790015;
	b=ZZCSmY9hun31hz64N28cHnPYLY4Ybu2uqDVs6CDYRLlPRGjuJiQ69SyNk3/1NhFhHumj
	 lprhZcq8KgG87zEuIdyHKov49qL3PYpl0tz+WBBwnKNwf23MkSCHsWN159QZCvX6q8x0k
	 Le55ammIfczrNPxPvGob8fuAjfLNMlVIQYqV1PfmGSFZc9voHvb95An3f7lcMZARioh7Y
	 1zVcdFD09p/jTd+rC49Wa3M3XYrzXZjQjmD1hJzAWu6XuaM2F7LoepwTYYH8ie2RALTrf
	 29982OwRT5TT7sjvQCd/DyoDzfPFW0Nl1HE/STDsRJEK3vfsljXTaa5qw8AjBfbrLyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=N+fOG5iNycUKvsMpwDzxTkj38NFy4WPI6anIvLifc14=;
	b=sEl76xT+2Yq8XORT+Ptb38QEH0Tgl7Gw3HUAcpeTURMqnpTj0ivmb2blaiPat0dW42/+
	 bbSDc7K6bdnOc99zxmcHYn9B4ZdhMGVmGFhFfeVE1aIxcypEwuBXh9UlTlzd4Cjokzjrd
	 qq8yekFGu/UtFaIc1KPzAyOCC2+jFEb3g90wWvehn8yLafAYJmEHkZ2HEkSn0XWe1kukU
	 JVn5bPvnQevJLpChTDD41jXPRsbNcVBkN5YVZqQQUydm1xYm7JBCGiJ3VoA9PtmldhsKc
	 9mrCfK+UOpZ100J16QBILW9/oaq5hhzBt0qSQp9iRYw/R3wCnMNC/evPMzpAC3quvHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krOBwnyf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1E606A69D
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C1E606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krOBwnyf
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67990a45e02so8200797d50.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 06:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790014; cv=none;
        d=google.com; s=arc-20260327;
        b=QFXQhA8efa7aLzDDndAhvqeKXuSR6nKoBGj9qCbMcIp/YHbJPe1TGl6as/b7f/kmdq
         p+ag9W4kDOEXzkUQ4gBFuwqVlrlbGC+PW6qRp1TAj+VoY9Gnxl52/wj1woMlKajfiVTI
         8wmylXvbj7erRdv8h2b42oi8tGWarwhzRI+tatqOAOX9gseMCLSl2Kl/axynyZAvQyqP
         h1Vb3aIIH/bmwerhltfIx12RKtCqcv/NgDSSLHxqVkHNZOfO5L6MYwBTw0tsI6ZbE2F2
         3GnO3+ZjfZIZtAXst8ErsR239+WVZ/ZZLLYCOpMfiOYg5dILtUa7ZIYkGZSuqVwQLDDe
         K/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N+fOG5iNycUKvsMpwDzxTkj38NFy4WPI6anIvLifc14=;
        fh=VVeCjokkS6F6figxqIrG+Xt8alWL4O1DS6KMHHjmPwk=;
        b=nMISGkQR3Q85BJFG9CmxA83jK6uX5+wdh6lxREzXrkVtnSswVnPYa/EDKmSD0eHpJW
         1yVpYf6KnkmLxueLc0ABs+arrDMwkKtrfQa+JuyloLCJ6UxuKVlETbLnfn+Tnt0UBvZF
         aUh93VU/3T1pUVr4o1IUnF0Udqh+rPV+QC16l858yN4Dt85wyRZ+4l39ITOnyX0a/sKD
         pADogaE+pvbjSRjSDAYT43/vWF0E/2XepBbwJVr14BYTClZnn3JZOwfcvTlK5wPO2p43
         ZdW51ov92xg0lHVna3/i/TpKR9zWD2QdvoyYmzFG0cp6VfDAMM4boDuMiboDMzWWp/2g
         ci+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795790014; x=1796394814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+fOG5iNycUKvsMpwDzxTkj38NFy4WPI6anIvLifc14=;
        b=krOBwnyfkozg2P8x2NENuPgEmpyU2uHRP/sRc5bXg7cdHP8XBCb3avRYWFx7Cd/n7W
         LBajRawtsiyuC4XH2kMCDl/leUBWfFJWKQrBB3i5NYFTs+rAY4vedXO6fsSJeYK8Q7Pu
         BIn7Z5lV0VcAUDLc7nEujpXzN8JhBSNzhwFHiwJmM4Uip0Y71BVSektKo8fGl/n6SdWk
         poPbfTxwpmb+j6v54dKdFBIvaub4joKtOpl0bVIMwvHHgPS3X1ZUk0GE2p2fqlMMTKL4
         adtygH+fs6JWYzqj2dtyOXJHlHWpQ4CRUIGMvUIM73W4v+ozaVbTMwubVp5wxiBY/fLv
         UVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790014; x=1796394814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N+fOG5iNycUKvsMpwDzxTkj38NFy4WPI6anIvLifc14=;
        b=ufg/hYr3WpWmm9Qg/swBTJoPikhs7A5l9syU0RsJtXQBajizfsoLeM47/VXGVo23dT
         lxMPHQA940gPs+lU7ZxCb1T3JVi9NTGFXS+eDBEk5VgNb8qQo676st3TPp0FcYlSUb/Z
         gsz71XQ6NJSHQlkCQaohXWi5DlChGrmEfbskBHLSIOrssyo6LMytt5lVWt6GfkGbQ77/
         /mY6rFZ5FKzaZI3QZ8nu1NSpp0DOvHgVloH/Nxphy6Hr5J6NjiM2cKjbFS/LlDFVCjzN
         Fbl2vyFHhoUZItAgzRpDJtuEx8b8N7NKF8XNfszAxyhFye4WkjDZIeuT8G7H4XYenWnK
         Y2ig==
X-Gm-Message-State: APuU4Z8WQrm9NU5fxjBuNHlTXYMJPvFsZTAyzvxYUZegN5cd4dbhccvK
	t9+KfOU3ekGzX7C8f+ffvA4Q+Dno04XnZIAMLwlU/X4MT7rubUSt7Q4bpW2O4ABC5Rc7IdsQRRw
	KLKSbkSyTcq0eW+v3yj6RGhb6aRhMqAM=
X-Gm-Gg: AZFdTZd/O6+jm1AIaEfeRC0x4zEJHE5eWJyr/dLp9pg2V0Xb5xSOoOPnpPhgqPieJ6x
	0sh2wNofgXrdtwpdp7G+INqIPeWKB1uwxYOJshCruf4WUzxyG/1iSXL0eJ9AB3kY6K0sPf8EOV6
	EZhLUvB1rcbbAQeB774HcKybmqHH2D4mCSJoHaoRquQaomkwz0c1QMpTVWQ34aV/7QMaQAMDjHU
	Nn0ULbivHFeDJ9dD71Zp/g19vYZfeKy/0n9cXqKhE7imopS8GNAeACaRZuh1SiLSaqcopExgSKS
	2qWoQAsWLfNc9Q73gK0DVoCVzb6HrKyt9EWdGDo67BXa0cX3NbSzk5O+uA+y9eOP1af+AYt4FZU
	BW4VO6DIXoz2IOuU4wJpwWPa4wZx+g4Gm3eDUrEiBT4041uXcqVbmGR/xuoNuhUlg+ybgECCrlv
	qszcC3GsvXpUsVTPYK4LYpEA084qSV+0hRzEVmqKYdGrbmGuNVCd5m9CHRDowXqxbg+OefRrwjN
	GtxO9GaO0vFAuWKoQxxhtgkFQ==
X-Received: by 2002:a05:690e:1445:b0:67d:a102:b8f7 with SMTP id
 956f58d0204a3-67df42b4ce4mr13896462d50.6.1795790014010; Fri, 27 Nov 2026
 06:33:34 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
 <ausGNtWlRzZN29ux@black.igk.intel.com> <CAPv=dGA6ygdQ8StHwht6nPJZyb2FTH0n03txOOWhb4SSHkG9zw@mail.gmail.com>
 <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com>
 <au4TbIvSBLxIWxnQ@black.igk.intel.com> <CAPv=dGC9FCbqW1hBnRz8Axy8FmdD4vohFZ+Q03fmsz3pDRod4Q@mail.gmail.com>
 <avR7Akf3n4G6QKtz@black.igk.intel.com> <CAPv=dGA4CoZrBVs7RGDmuXfb5YqPcR5hmYh7uUVsRcShbeT6hg@mail.gmail.com>
 <awBfrbFPUvcrS1Xg@black.igk.intel.com>
In-Reply-To: <awBfrbFPUvcrS1Xg@black.igk.intel.com>
From: Peter Walker <peter.walker78@gmail.com>
Date: Fri, 27 Nov 2026 14:33:22 +0000
X-Gm-Features: Aa3M54qBs8n6NnqIjVDLR3rkCFfa4yz_jIRx1ROvStEgagPNqhLOXDJCEHc_9GA
Message-ID: <CAPv=dGAmc_ifS84U1YHbJ34FAACVrEob6N-MSCHqgN-L=z2bSA@mail.gmail.com>
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
To: heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 03:56:45PM +0100, Heikki Krogerus wrote:
> > Not until now, sorry. Reported to Acer UK support today, case
> > 261119-000931, with the readings and the SSDT31 disassembly.
> > I'll let you know what they say, by 3 December either way.
>
> Cool.

Acer have answered, and they won't fix it. On 23 Nov they said the
laptop is only supported with Windows 11 and marked the case solved.
I wrote back that the connector count comes from their own firmware
whichever OS asks, and asked them to pass it to the BIOS/EC team or
tell me plainly if they would not fix it. Today they replied:

"We would prefer to keep the firmware unchanged, as the device is
designed and qualified to operate with Windows, where it is
functioning as expected."

I haven't checked how the ports behave under Windows myself. The
factory Windows install is still on the disk, so I can look if that
would help.

I'm happy to test anything you send.

Thanks,
Peter


On Fri, 20 Nov 2026 at 14:56, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Nov 18, 2026 at 09:30:30PM +0000, Peter Walker wrote:
> > On Wed, Nov 11, 2026 at 03:26:10PM +0100, Heikki Krogerus wrote:
> > > Okay, but it would not help in any case. The first problem is that the
> > > PPM reports the wrong number of connector, right?
> >
> > Yes. GET_CAPABILITY reports bNumConnectors 1, while Acer's SSDT31
> > declares two connectors under \_SB.UBTC, CR01 and CR02, and port0 is
> > bound to CR01. Both USB-C ports are on the left side, and connector 2
> > is the rear one: with the charger in it, GET_CONNECTOR_STATUS(2)
> > returned 0x000000000000000153851545222b0000 (connected, PD sink, RDO
> > 0x53851545) and GET_CONNECTOR_STATUS(1) returned
> > 0x00000000000000010000000020000000. Those readings are from 6 Nov.
> > The BIOS is still 1.29, the newest Acer offers, and the DSDT and
> > SSDT31 are byte-for-byte the same as on 20 Oct.
> >
> > > That is a pretty obvious FW bug. Did you report that to Acer?
> >
> > Not until now, sorry. Reported to Acer UK support today, case
> > 261119-000931, with the readings and the SSDT31 disassembly.
> > I'll let you know what they say, by 3 December either way.
>
> Cool.
>
> > > Can you share the complete dmesg output?
> >
> > Attached: the kernel log for one whole boot on 7.3.4-ogc8.1.fc45
> > (Bazzite), saved with journalctl -k -b, so the lines carry journal
> > prefixes. ucsi_acpi and typec_ucsi are the stock modules; the taint
> > comes from Bazzite's gcadapter_oc module. MAC addresses are masked.
>
> Thanks!
>
> > The messages started on their own 0.9 s after "UCSI_GET_PDOS failed
> > (-70)", with the charger plugged in. On this boot that error was
> > logged once, not twice as before. Later in the log the charger is
> > unplugged and replugged three times, moved between the two ports, and
> > there is one s2idle cycle.
>
> I'll try to take a closer look at this next week. But it sounds like
> the PPM is not behaving properly also in this case.
>
> Thanks,
>
> --
> heikki
