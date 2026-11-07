Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050621;
	b=Za/xWhjpClwCtRl/vO84LlOqvi9od6mg8kQyQmbuqwBse+PYCEtakuksj4gNs20M+JlG
	 XMykPiUZZz+RKIVJ2YA5uQDfLB+EV27LkWsEU6OebLvv5/LQiia2J/t2vCa4ebYjwPXL9
	 cpPT/kNojslEP7IbgXlEZ7kCJxTJrHvIRJoW73/2SqGs1pugoP/z08IkV5wBpqsERgTyE
	 sJ7cTAKk0ICCMQYByWnHP6Xy/KjR0rwdssWVvpvs61EAiWvw31Y+fd4XjNIMe1L8Oj98D
	 eg0W3y9b9XU/z9mVwqk7QRXnXYO0o9zkhFdxmGSGZebqrdbovFn4rgDvgCO6p5Drxhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
	b=KJU1/RIpthARDZ8Bes81VMbrgTpETKzNKMHh622zc2YKGyFcCY3y3rv3PybpSl3B+a9m
	 arUPhU+3FoCmMMdvoIPB+UQOb1c2CAmyto9SGkzT/IRzOgMuXY6bSm5SkX0RaunwjPYvP
	 YRpH4L6rlQgWJ0/Vp+ys+KfoSIdj+O8dbQY7JdqVtDHoCrumBUGFU2ifBq7NkrHx3OhDX
	 QxCljmw0XBD3ggjZGprEyeTeMakb51BOzuMya+gpsxvZvczQssvNAT2Rrcgvob5d2Jttr
	 mKYU8AA+S9+D9aRRIQdAiP93Fi7KSS7/19F7KSuF+76mfkUNJPk73leEL6HlI3yByQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrB4CP0b;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1133606A330
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 11:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1133606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrB4CP0b
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so860988f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 03:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794050619; x=1794655419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
        b=jrB4CP0bQ+koHaEjv8DWJ3WdmGF/+AKcrvBl0Q+FuPlbjKm9DyXPfJOoFs9mZzS4Rg
         +jG2kU2MrHVVlUbBwCtny5fvHHqYQaPPYhzxw5BKiTqpplykYZLrEL0aYRkYvUPHiuyR
         FKIF6C9JdV0mRBgRKuFSR3BvNeTJzBA5yP95XotKtYxEMMO0yT4MKF1eqE5I38qki5mj
         XfTsVnxngCrj0PY45KGrydCTX6osmEea67P8Mm//njfZGYuZ3wfAGty5a3DXsoWxy4z1
         RYkL8apbAHgMW8qOXZ5rNsqx393JytNZqooaMQEBU3u+52eRrsPyURElWPwOAP0RPZwh
         gFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794050619; x=1794655419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+oJdKvf5ACTFVjDlEtyhUTinT8osTOQujRk8hU+DRPU=;
        b=vIxLMR10DS7O1gB5LBGbmRAWM1HGQ31/G5ErzW1xYux17Z2MmwdxVImmQkxba6cCSe
         wPBa1VwRDRLnsy9I6IK2iM6YvKbKadanP/6vY5IEK/l7k9aHU/uo3kNysvkDKul1vOLg
         Ky+nzsz3RZyZetJJAm1QmvgxjY4xl0I09qjSNeClrc5Vu1k29+0CMPlPq2R9sNU3Ns4W
         HZ4AV01JyW6Duau+mtaadj+BLDoKulEHkAI1yaKNFLtPkzun8MJbmGb3RFtf6rZm6xaF
         SUUveSwnvoxJ+1XOO3mjMnX1evGXpFgUNyeI3/pvZ5Y5lWVEUGnqqWoyDgwWePRIUoQG
         DOzg==
X-Forwarded-Encrypted: i=1; AL+hErFgMICDqFvBDH9mfYuybc+FTQnVAT8sGs9M1GDPrhPS1ML7YWWAHGMeXSozplOM0o0jvXfUbyKQUx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ir5MQLmKsoF65eh570a19B5oXbXuJWF96KLu2FppxynWo4KsM
	dPa9hNPKSSsW/R9Ya/G+5biluDxJUuIxPJjR47rK14ulcDUMiEghXpjC
X-Gm-Gg: AYBFou2/q1hul1st6bF2vDHCgZpn9QJU2KOznHWTUcBVAhLezjWYrHR+1zhbJ/NrZYv
	B1siAmdsnygIiloa/jlPC8YwHusMgGZZdXjl5F47NRWCT8DEJ+5TaEzjw57T4qwuBd4V29u+lfX
	ERSTXTxlg4M6y11yfnC6+eZIPN5wvCLPXGsQ6ZVOXYcef4AVpOoq6AKwSWE3LSpCc9hIohtGFXz
	f1AXUYeQYFzg44Cj55kM8lY0CO37vTQUmL50OKwJoLVqJIg/ZvaxRvrxkHRQJmmBMhaWMx8K4dD
	G/Z/x6bXaJOYQYYx8AUUCWdCf+IOIDFToSYYMCW+NcQ3KTxpGXjM77pgZFbaXarG+BI/rn4YHvA
	K9K8yfBBhkn2VDOlc63Ye5xZcXthT+vnusPjXh7OR93DPcuvmLv5TB/MWjUEpwQjRToQMhBhTxV
	SJf7yF5/bdszw2Dkl5zr8v7jo5HqQ1gkrgztubTZ8kY755wbXatEZBg8WjmfVvgFd2lj0EGa/yq
	4mMTcw/mePVkcQ4FHNMZn+ZLJD3qqq2BSr9y5zxlcOUMXx5VBV9+mMedLnmB6TazPPHZLwOboLC
	IbtZS3+eGyMxPyMDY9uyo9HB3Wb+qsut0ZOEqGQ=
X-Received: by 2002:a05:6000:26c1:b0:48e:10a7:438 with SMTP id ffacd0b85a97d-49275a2721amr10861159f8f.36.1794050618996;
        Sat, 07 Nov 2026 03:23:38 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6385fsm8647480f8f.16.2026.11.07.03.23.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2026 03:23:38 -0800 (PST)
Date: Sat, 7 Nov 2026 12:23:35 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Hoshino Lina <lina@lina.yt>, Christoph Cheaure <cheaure@gmail.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c): corrupted
 playback on ~20% of stream starts, fixed by quirk_flags 0x100010
Message-ID: <20261107122335.182f01c2.michal.pecio@gmail.com>
In-Reply-To: <878q35yp6i.wl-tiwai@suse.de>
References: <CAJr_eQ4QhhZTqjVRmRWLBMMVhqmx-dS_yC9TiozB8qS-ZCnDTg@mail.gmail.com>
	<fd618d1b-d4b2-44cc-b08d-7e664938e771@lina.yt>
	<878q35yp6i.wl-tiwai@suse.de>
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

On Sat, 07 Nov 2026 10:19:01 +0100, Takashi Iwai wrote:
> On Sat, 07 Nov 2026 04:53:37 +0100,
> Hoshino Lina wrote:
> >=20
> > Hi,
> >=20
> > On 2026/11/07 8:26, Christoph Cheaure wrote: =20
> > > Subject: [BUG] ALSA: usb-audio: RME Digiface USB (2a39:3f8c):
> > > corrupted playback on ~20% of stream starts, fixed by quirk_flags
> > > 0x100010
> > >=20
> > > Hi,
> > >=20
> > > I'm seeing intermittently corrupted playback on an RME Digiface
> > > USB (2a39:3f8c) with the in-kernel support added in 6.12, and
> > > found a quirk flag combination that fixes it for me.
> > >=20
> > > Symptom
> > > -------
> > > On roughly 1 in 5 stream starts, the playback output is corrupted:
> > > any non-zero signal comes out heavily distorted / with clicks, on
> > > all outputs, including the analog phones output (channels 33/34).
> > > Digital silence stays silent, which made the problem hard to
> > > spot. The bad state persists for the whole time the PCM is open;
> > > after closing and reopening, the next start is usually clean. =20
> >=20
> > What you are hearing is what happens when playback falls behind by
> > one USB frame on the Digiface. This happens mainly due to a bug in
> > the xHCI kernel driver related to isochronous scheduling when IRQ
> > latency spikes occur (together with the Digiface handling playback
> > underruns rather poorly). I no longer contribute to the kernel
> > directly for personal reasons, so I filed it here on Fedora, but it
> > was never triaged/forwarded:
> >=20
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2451673

Hi,

These are known problems and things should be improved in 7.3.

Particularly, if the HC is "hci version 0x110" or newer (see dmesg),
scheduling is exact in almost all cases.

As for dumping kernel patch suggestions on distro bugtrackers, you
should have known better what to expect...

> And, yes, if the USB-audio quirk option improves, it's worth to take
> it as default.  But, it'd be better to be investigated the root cause
> at first, of course.

It seems to be a common quirk of snd-usb-audio that duplex needs a few
xruns and restarts to begin running smoothly, not sure why. I guess
FORCE_IFACE_RESET was helping with that by clearing any xhci-hcd state.
It shouldn't be necessary anymore, we tried to make this case work.

The driver also has other potential issue: it relies solely on luck
for synchronization between multiple endpoints and doesn't even look
at urb->start_frame to check if sync has been achieved.

Regards,
Michal
=20
> > > Results (bad starts / total)
> > > ----------------------------
> > > - default, external clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02 / 30
> > > - default, internal clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A07 / 30
> > > - lowlatency=3D0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no improvement
> > > - keyboard/mouse unplugged (same xHCI): =C2=A0 =C2=A0 no improvement
> > > - quirk_flags=3D0x100000 (FORCE_IFACE_RESET): 7 / 110 (~6%)
> > > - quirk_flags=3D0x100010
> > >  =C2=A0 (FORCE_IFACE_RESET | PLAYBACK_FIRST): =C2=A0 =C2=A0 0 / 90
