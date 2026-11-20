Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170623;
	b=cbZLaUkP3gunSE2ci+L3EYLodH+TPYpx/r8Eh8X4HvPGngu7preR3YBb+TSrlnwJfme/
	 CBWclbEmmnfeSDl1/oz2MYymrVFqGwcCFHn2lpChjBWQS+1EaGGCqRDdvGxAlzkSeWrc2
	 Zh5vi9bbWdImvqognYzkT6PtvXBxTkdM88egHcWTmG0/iuU9URclTwFT6qDI/yV7bR7NZ
	 7FolCAItzLMJtKGdk01mbZXPVz9zloRQTAaGzgPfXSVmPJ76E8W5r/wxCc4Ln7B+U7OQf
	 vjWe3iw5U3cBIaUtZghDJKKl2NMljU3QPz75zsKt8b1VmmDanV1gNVhOmgdAKYlqIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ACOXYDQIswtjrnc7wo9QC5PrAvG9FslAUISL0do0xVM=;
	b=lY8iT98z+kp0olk8xredSsZX2pfzLguvtQ3kwBo3xCXVmiOwJHwueXiIexcKgGXjbQ1E
	 M3SmEYUg7gGsV74/h6TSkEEkOQLTVvGIeZVJZ8J7Vy7YaMZkmnMokeyVYIP89vsTorSgC
	 zgUf9DCrZl0CZ5y9yuwWo57XOQwC0RDNniyCGyVZ785m/Uj+RS/AzpRibWeOHssqZId+W
	 UZNmFaRp3exS1yRIeY4UP28hDnOoF/Bofz5W7hqTnxj98n+0diPgqzF5qLAZoxukG/Rgm
	 /lPDwkoFub/vxxjGiWWBWUFPHTpfab0HNFZIaXEkuUxgOE/qw2hTIbJ9ZwWnIHMYq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6pzZnUn;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1C606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A1C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6pzZnUn
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso453202f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170621; x=1795775421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACOXYDQIswtjrnc7wo9QC5PrAvG9FslAUISL0do0xVM=;
        b=T6pzZnUnyysKnYPXiiJVvAsuA8rGFTQUtgU2V8mb3DBJWuk8lmciPbspmfTt1FhEzF
         1z17TLHFhGgMoLSfAY+PVb/MAMlXRr20IQ67QQNQnPX8eIllipwp4nAKNk1vXLpE0Z3g
         ClZoGMYcYH9x5slfQjguvgByjR7eYRGyX21a4w2uI5eweKn5WlqrOTgU4to2FSZUrBCI
         /aljavXtRIGCDxb2U7W6Vt2hLtbdG/8gk0STX2hQE3LXn/JXkuh/UTQWDgdDKjDWtkcj
         9mJ07uuC66KNpj6ytLmTlqgULo3TZIWlAbHKQHMNGMcF28Dr+exMvZYnuGM/G0D3IJI2
         /6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170621; x=1795775421;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACOXYDQIswtjrnc7wo9QC5PrAvG9FslAUISL0do0xVM=;
        b=pxL32DsMkbSM5+QLktW4Mx7tH1h4+Y3Pp6yuItSFZJexBalkIY1awm8uxYyebVLsE/
         VKPco+pX2E5+EgLmNqLrHSGca01XXwQE3y9m4mmiYYCGLaCQr9x9eikojo8aD2zEprft
         98ghlXd3h7NX0DD1/ElGRguXU3MI7haX86v9B9DClAlEBRcbaol9yUKcXboxgq2RCIMH
         Flhd2QQ8JI9eOFoXzARmUNRx0Js1knGyI4NzizOZuDz/LGE23Cs+rbOPyAdV2Q9RXzY1
         8kdfbnZI8X4wzGHPEm8WIxtD21HuuBcdLJzCVVUZE2KkkaMe8KuhBgT0wWq9kBjOqlxV
         xp2g==
X-Forwarded-Encrypted: i=1; AL+hErHiDpNybStrFgtCsTv0VtZ9+5yypvO9Gtjr2spqqm4+NNQNt/f4vMXFzqVxBE82j4IRIasxNczBkJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e9VVJ3s3xr2n+HgD24t/nNiCDrQES3Bho1ajgq4VLrULTckvt
	G3NgcxYHJTkMu1b38IlvAHexmn7zgy5oS9q5gxhV2EBQg4WhsVJZ1I+u
X-Gm-Gg: AZFdTZd7OECvxGrEPzU0kF1tPcCzp+pkEm2vDC7HP15ftMAFqHRhvDO12ubxhAA+n8E
	MNd3NaxfqnE0f4xyDhrS+fppzhGQ+MyIJQgHmcAeSHa0ByTc/btZKXcN6LoW7VEEoCVAn4wSNph
	3BSF02oqQugil8Aj2QLesIXvJmoAzK9Ch1+VRZgHStrf4s4TlqM1+C2+8DGmDnkMxAdi9h852UJ
	2bvQx6thCSQekNgxfRbmTBu0sZ/li4PFC66IkuGE9BuMIqNIh4cTxy35Oq/rXaHuajOjsi3WeCA
	VNna1F7Jtv97mrglFeZuNb1GMlBoIBhBrO/u69XTMusBBYC/vt0QMmpHQt4qVwFt8wPmg+O6QB9
	Lyn0p5RRpx1tTeKwkDlYt+bn49xgJUZlhs3z1DxWkXrvztOdFEbAx5vbY8aakRuvrqrBuI382Dp
	OYHMJww30dGZ5wlagsgzNV9NvnbnlD+H3LpeFvYnHmUxoTGXFdGh/qmuysGOk2HNpD3sFmngQv3
	5A1sqdK3g8zi8IxDk5AeOYR+imrWTivP40hXyl5HsWak0fb7VU16eMVaLO/9mU1f+D8FtJ7e9I5
	MpKnyQetYifKncmZTJfjEJG0zRspQsiEUiS7heGAIQ==
X-Received: by 2002:a05:6000:438a:b0:48e:127a:c914 with SMTP id ffacd0b85a97d-4aa545e25cdmr10685552f8f.5.1795170620817;
        Fri, 20 Nov 2026 02:30:20 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm4600840f8f.32.2026.11.20.02.30.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2026 02:30:20 -0800 (PST)
Date: Fri, 20 Nov 2026 11:30:15 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Cc: Phani Kumar <phanigudipally@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [WARNING: UNSCANNABLE EXTRACTION FAILED]Re: xhci_hcd
 0000:00:0d.0 (Panther Lake, 8086:e431): =?UTF-8?B?4oCcVW5rbm93bg==?= event
 condition =?UTF-8?B?MTk54oCdLA==?= then HC died, with a TB4 dock and two
 displays
Message-ID: <20261120113015.30edfd66.michal.pecio@gmail.com>
In-Reply-To: <20261120071202.GH229695@black.igk.intel.com>
References: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
	<d15451e1-b89f-4db3-95a8-21b188cd0030@linux.intel.com>
	<CAMcR36LCr0RFrHsLFPaPziPS=1CMbEnO3GcDk=3Oe33S8uZFpw@mail.gmail.com>
	<78b30387-f71d-4e6d-b49c-aea1f8fbc98b@linux.intel.com>
	<CAMcR36KcP7cMZ2D1pu_bC-R0uPn2chd_1jEzp4FBBq-jZz=D3A@mail.gmail.com>
	<20261120071202.GH229695@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 08:12:02 +0100, Mika Westerberg wrote:
> > 3. Should r8152 back off after -EPROTO instead of resubmitting
> > =C2=A0 =C2=A0immediately? That seems to be what pushes the xHC over in =
case 1. =20
>=20
> For this I hope Mathias has an answer :)

FYI, Microsoft asks drivers to check if the device still exists before
attempting any recovery (and also to cancel all URBs and reset the pipe
before submitting more URBs, but that's unrelated).

https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/how-to-re=
cover-from-usb-pipe-errors

This may be the reason why I have observed Windows in QEMU reading the
root hub port register before performing endpoint reset. And xhci-hcd
does similar checks, but it only detects root hub disconnection.

It seems that Intel HW either assumes that unreachable endponts won't
be restarted, or it has some general problems with restars that weren't
happening in other circumstances often enough to be noticed.

I wonder what happens if the same devices is disconnected from the same
or similar Intel HC, but behind an ordinary USB3 hub?

We also have that case of repeated UVC operations and/or isochronous
stream restarts (?) on some USB3 cameras crashing some Intel HCs.

I don't have any Intel HW to play with, only AMD.

Regards,
Michal
