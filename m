Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711ED330D35
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719279; cv=none; b=tcfR5Y41LIwqbx93EUU/MUOLLcR10ek8a2qld2McsoIF0SsAeBuSFrVlXMLA2cX3Np1lVSoavh5Xe8W7N2DwKNderGKxhtdYkl/vse8Z0/Bs1fkjyduKwqIC32I2mQnrMiQDkVdoSxe2Cnurf9jDuhunrdE2+qw0KugakJCYHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719279; c=relaxed/simple;
	bh=mBVTnl2G8pCGoWuBmM5zFeDaOYN0VUdmFeL5zB1C8yk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AX4QnY1hLamoH4eiqSW3Cp1yjZphsyPpiZK/kAei5eMyuExdL8RunP4So/z2lkPsO3cqkWsC1YR3N6jsTDTvckgVXvNTXupojGXkdKqugzngi7x9Tvht+hTfUaXPVbKj/LcMZOb1Ag4XVVdQJJxmficMS8cARsXocixmzDHGrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=ingo.haenlein@gmx.de header.b=B3EheMoU; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=ingo.haenlein@gmx.de header.b="B3EheMoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788719275; x=1789324075; i=ingo.haenlein@gmx.de;
	bh=mBVTnl2G8pCGoWuBmM5zFeDaOYN0VUdmFeL5zB1C8yk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B3EheMoUk5QHR5HaJW29aOJ06bzJHvLJ6wK9MUZKQSq4y6cKk+E9tGaNlOAh7yB2
	 dB5EpaXUaGklKI+dFtLpG6ni/5FPHUSAxTbM9E4QrRiosnBYRPfiztI0ofNHJFP75
	 sYqNhpA9LyKu0J5N5uLYmiryWf61bzJ6fpxsgiYLjP1l2dOzoobZBpNKmbDpW4Qfo
	 k/cKGQFtPB3eqJ29VW/pbZfnNvUIltXwjXTKck2tl2MD0NrVHUQobTw2EDzvoIDGQ
	 Xh4hPmhmrX4Y8ccD4YON/VE92tFKnPPt5ME3W0CxALAoH1BdmpTeSqGbrSso66JXt
	 ib3nToqZ4FrGgEAAxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1xK8K40Tv5-00UQrw; Sun, 06
 Sep 2026 20:27:55 +0200
Message-ID: <a13faf6d-72c3-4149-b26a-c18a9a5068be@gmx.de>
Date: Sun, 6 Sep 2026 20:27:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org, superscalar@gmx.de,
 mathias.nyman@linux.intel.com
References: <20260621214215.378d505a.michal.pecio@gmail.com>
Subject: Re: [BUG] xHCI: AMD Strix Halo [1022:158b] isochronous full-duplex
 USB audio instability (frame active: -18)
Content-Language: en-US
From: Ingo Haenlein <ingo.haenlein@gmx.de>
In-Reply-To: <20260621214215.378d505a.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MkBO1H7gKJfNyCQDoP20px/R12It5i8MPoeR6iqkgg3syffGu4y
 nVKRlRFLCVn8MH1kyGJIk9mW3bb3PByNLPOUvumR/9BlwHgGZcaiGiN23wFFPm5Up1Uu89J
 CJjMKTLr05YQgcRh0rWMkJsGoAYyKB9E97Ovff4Ve/LKJ5HgVO5XGGLJ/1rHJT9iHYZGXxX
 bAMnoYunQS+lzUc03OSYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wW302LBzoYc=;bWJ3ipaGrEZpDZ/LV1h7aq5VZM7
 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

Hi Michal, hi Mathias,

Quick update and a new regression on the same Strix Halo case.

Root cause, confirmed
=2D---------------------
DF/fabric C-state exit latency on the IRQ-handling core. Spent
several more months on this: PM-QoS is not enforced by acpi_idle,
governor/EPP tuning made no difference, pinning FCLK/SOCCLK made no
difference either. The only thing that fully fixes it is a hidden
AMD "SoC/Uncore OC Mode" BIOS bit - confirmed working by someone else
on a different vendor's board - but that option is locked down on
this HP firmware and too risky to unlock without a recovery path, so
that's not viable for me.

Mitigation
=2D----------
Two isolated cores (CPU16/17, via isolcpus/nohz_full/rcu_nocbs) with
the xHCI interrupt (0000:c5:00.4) pinned to one of them, plus a
small script that switches those two cores to POLL (disabling all
deeper C-states) only while an audio stream is active, and back to
normal idle otherwise.

On 7.1.11, with this mitigation running, a Missed Service Error burst
happened at stream start, then nothing - no further errors, no
XRuns, no endpoint restarts, for the rest of the session. This held
across every buffer size I tested (64/96/128/192/256 samples
@48kHz) and under sustained DSP load.

New regression
=2D--------------
Same mitigation, same hardware, nothing changed on my end. On
7.2.2/7.2.3, that's no longer true: I now get audible ALSA/PipeWire
XRuns and full endpoint stop/restart cycles (playback + capture PCM
stopped and restarted), both at stream start and during ongoing
playback (e.g. while Bitwig or Spotify is running). This did not
happen on 7.1.11 with the identical setup.

I traced the kernel change in between to commit 87dbc3fa08fc ("usb:
xhci: Handle bogus TRB pointers in Missed Service Error events", now
in 7.2.2/7.2.3, Fixes: d0b619599e52).

Confirmed by direct A/B, same hardware/config/mitigation:

- linux-zen 7.1.11: start burst, then quiet - no XRuns, no endpoint
 =C2=A0 restarts
- linux-zen 7.2.2 / 7.2.3: XRuns and endpoint restarts, reproducible,
 =C2=A0 both at start and during playback

I haven't looked at the commit's diff myself in detail, but since it
touches exactly the code path that logs these Missed Service Error
messages, and the timing lines up exactly with when the XRuns and
restarts started, it seems like the most likely cause. Happy to test
candidate patches or provide more data if that would help narrow it
down.

Thanks for looking into this.

Ingo
