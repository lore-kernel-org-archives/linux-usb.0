Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E43C8731
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788728741; cv=none; b=iTX2dzHbVYA7IN6cfLTM9WqnoA+G78sc1cTCOPtNTg+sDxL5S1PEsCB8pkIw+OoG3WBxlCleGNCmtUPYbHPZ9aeffVXKC0CmXe+WuusQ30fTD2k2XWHxqMKTGjISY/LWUwjEQqPzLBaoUIpvZJbJK/W7Edkod7DnenUPGZkYR9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788728741; c=relaxed/simple;
	bh=vC4YQuUsqECdThQ2UaVWWxN9IGfQuuL520LFsCgC/zg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uy7s+5ujbAW0AS8qvmG0nIrEQoqs+PNpo8xieKmTK/kY/staqnqgwdocbuuq0DwkmYwlP1wjP7MsEtxMJty5hR13LlZ3W8WJUOx0XlHUKf+FM40YevzlSVPoCZSl2T9con9+4iaMCPkR/5OyUPS4z8pSv9u6ubz8/wWX+yTk0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfDvdunV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfDvdunV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-485850cbac3so1752209f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788728738; x=1789333538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hm7hKt/l5G35NMIrUuAXey7XmWtG2gBN48sYcpn4XhM=;
        b=LfDvdunVes/2bbSq+PczwGkkTOE8heBlhp+1y7c4G1Qr5TPTbeLiezL+tGLqf7FXRl
         nAHV+k7z16Ecb5WjRVFl1ZfzI9IwHuZnE/Ms3BVOKDCXDPaDs4gYqk4XWXrKH3++NNny
         h0sc5eur6BxSRv2etIyQ3oyXHU3nDFQRO7Q3BHybJUbAm5Q5Is0pBB6b/d/J767w/1AP
         uAHKMvHlbavRti2mqlqhejqdi9A0aXvb3aQhp7PoyODhNoQ9e148VllY3uFizK3RaZNv
         efAO5xyIwk3Ts3q1Yp62aLHAeeYokF7NaIni062zJHE6ECQsJJIfkiPhXSEf3y0vMVO1
         pJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788728738; x=1789333538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hm7hKt/l5G35NMIrUuAXey7XmWtG2gBN48sYcpn4XhM=;
        b=jeJGv6kZ5oC/yYu0ollu0voHibd6H5pru2Es+cG8w9KTauJf3nomWqlMXDuNdvMgs2
         v0LjWVkGEI4PdJYIG3uifm0bB51il5TcZX06YJsWKl7kLmQMsJI2eA3dePtFn78+e9bY
         3+me0VxrGEuyqvb8hgoAW7oURHMcnw9Z4FHPpwKVUQ6Z8b1Y5dQbLA+i8Mr15emyGFoo
         4Lsfh8VF2CzAojVyY0hXpIsTkhWSoc11VAtOCCM30HqFSxiLFQEl1zDsgTN48tD0VVdi
         lXFx8p3Jec9tqzoyx7eGuo1VyMP/XJrLjF3VpOCsQf1bivqBWG8dXkGXXzCfLalSMLZ1
         adWg==
X-Gm-Message-State: AFuF++nOMOb8itjQgOvQ6Y65BYZWDv6/E/4gb7uhRPs86GZ975Jd1NgG
	A1b8KtuIE2UDaHCDDLSEifHF1yc6XsET+TAj215usbkRTf6lK4l75U+NQS+dmw==
X-Gm-Gg: AYBFou0zMc0b2OMsqYkfK3dGoxjcmhVo6FGE/7jx2+3V78SosZ1pEtm9VcnMiuF36aP
	KUubnwqCFURoxD76cRU+x6v9VNkCwTn7TUk8R31RXDEDILJ8Q/B4rlqCyFSU5/1809RBJtpkp/r
	VQczt3rT11Ujh15JXPBGUvnWhXhzwlWXAkESGNgQmwym97hkbyD+jxxc+RT9j+85ynVqXSVssUT
	zAl1oCTDoCxn2WCWn3q6EiR8VuOkZT9egdtI3oWKkwTiXSIZsFCQSziCC+Cdp1ll7xsOg7GYOPP
	3A0C9X/EDvfuqoDzEcLvH9N/fOL4e88qbUDPwxtiuPHOMlazy7rjWyrUPsR3NzftzvxHgcE+UfW
	HAermzRy8WUnujnSj8kiIVT24pePnSfccqK4hDwuEvMrHNZ43ERROn7LUMrhHNEONNgu32/h4W+
	z8RBeK9e6qEsVxrbBEH7K0FPJuNd8OQj4mD1EiN5/Hf4ITkup4lGug/LWvL9w7kSrpXb0zlywHa
	UyEN3g6
X-Received: by 2002:a05:6000:2311:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-4858bc63de5mr15008870f8f.16.1788728738367;
        Sun, 06 Sep 2026 14:05:38 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm23173125f8f.4.2026.09.06.14.05.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Sep 2026 14:05:38 -0700 (PDT)
Date: Sun, 6 Sep 2026 23:05:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ingo Haenlein <ingo.haenlein@gmx.de>
Cc: linux-usb@vger.kernel.org, superscalar@gmx.de,
 mathias.nyman@linux.intel.com
Subject: Re: [BUG] xHCI: AMD Strix Halo [1022:158b] isochronous full-duplex
 USB audio instability (frame active: -18)
Message-ID: <20260906230523.6ff77e1d.michal.pecio@gmail.com>
In-Reply-To: <a13faf6d-72c3-4149-b26a-c18a9a5068be@gmx.de>
References: <20260621214215.378d505a.michal.pecio@gmail.com>
	<a13faf6d-72c3-4149-b26a-c18a9a5068be@gmx.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Sep 2026 20:27:54 +0200, Ingo Haenlein wrote:
> Hi Michal, hi Mathias,
>=20
> Quick update and a new regression on the same Strix Halo case.
>=20
> Root cause, confirmed
> ----------------------
> DF/fabric C-state exit latency on the IRQ-handling core. Spent
> several more months on this: PM-QoS is not enforced by acpi_idle,
> governor/EPP tuning made no difference, pinning FCLK/SOCCLK made no
> difference either. The only thing that fully fixes it is a hidden
> AMD "SoC/Uncore OC Mode" BIOS bit - confirmed working by someone else
> on a different vendor's board - but that option is locked down on
> this HP firmware and too risky to unlock without a recovery path, so
> that's not viable for me.
>=20
> Mitigation
> -----------
> Two isolated cores (CPU16/17, via isolcpus/nohz_full/rcu_nocbs) with
> the xHCI interrupt (0000:c5:00.4) pinned to one of them, plus a
> small script that switches those two cores to POLL (disabling all
> deeper C-states) only while an audio stream is active, and back to
> normal idle otherwise.

Odd, I thought the issue was caused by the xHC experiencing latency
while fetching OUT data from RAM, not by IRQ handling.

Maybe you are affected by the broken isoc scheduling? Try v7.3 RC,
it may work better now.

> On 7.1.11, with this mitigation running, a Missed Service Error burst
> happened at stream start, then nothing - no further errors, no
> XRuns, no endpoint restarts, for the rest of the session. This held
> across every buffer size I tested (64/96/128/192/256 samples
> @48kHz) and under sustained DSP load.
>=20
> New regression
> ---------------
> Same mitigation, same hardware, nothing changed on my end. On
> 7.2.2/7.2.3, that's no longer true: I now get audible ALSA/PipeWire
> XRuns and full endpoint stop/restart cycles (playback + capture PCM
> stopped and restarted), both at stream start and during ongoing
> playback (e.g. while Bitwig or Spotify is running). This did not
> happen on 7.1.11 with the identical setup.

Even with several ms per period, or only with short periods?

> I traced the kernel change in between to commit 87dbc3fa08fc ("usb:
> xhci: Handle bogus TRB pointers in Missed Service Error events", now
> in 7.2.2/7.2.3, Fixes: d0b619599e52).
>=20
> Confirmed by direct A/B, same hardware/config/mitigation:
>=20
> - linux-zen 7.1.11: start burst, then quiet - no XRuns, no endpoint
>  =C2=A0 restarts
> - linux-zen 7.2.2 / 7.2.3: XRuns and endpoint restarts, reproducible,
>  =C2=A0 both at start and during playback

That sounds like guesswork, or was it confirmed by reverting the
suspect commit on 7.2? It should revert cleanly.

This commit only makes a difference in how missed service is handled
once it has already occurred. And only on some buggy hardware, or at
least such was the goal.

Regards,
Michal
