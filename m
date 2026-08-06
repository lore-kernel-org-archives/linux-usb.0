Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F047364028
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982727; cv=pass; b=ROvr+G9z8CBV42O/7I9H0oTcx9ZGiHFNVhT0V4iuteLjOABCncOYAN3Ca81mEObqkOa+Eob0ovP4s5lqLs7cTl/uraE/bsVcWdUEfLbLMj7RSZE2t4gq5ajRL65/mNuDmZGxZ1JQtxCWQ1li84CWCRfLDXXsfbhm1Oww8spIgGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982727; c=relaxed/simple;
	bh=ZVGgnEZttTEhPMF82rVkr+YVm8YQU+GWCm/SwTpt8lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J865JQwWwHsch3aTBqS3EPX1K+5Cx2q22lkxjOX0/gD+sO4jDTRhdA7XOgYrOB4WDjhhJCkqdnuLzA6ZI6xUBxPuU6hTmdrCxN9Ik4sOkNSwZDovNfjIS2foY6NUEwwjEN6gj1X2qETUtC6z+Fdj3qukLfYdedRNxXXQYuik5VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk; spf=none smtp.mailfrom=riff.dk; dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b=w1t3G50g; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b="w1t3G50g"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92edb12cdf2so111857185a.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 19:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785982723; cv=none;
        d=google.com; s=arc-20260327;
        b=rt2a065uRWjt075R/QBMP4HJWXZchoCyqxTyVxlr5rVmnq1QNwUTTqetvLN5DLufzo
         RT8AILvcigl+VrCAdu50rHGoEx9YzE5BP+suXf19+FvDbtEo4rdkwQkjqtugfN+vywGF
         17gxoiPxuhPqObu/CzVNJoFJa5yp8CUSfvU/ZxAZ4+hgflXOPHW4QjAvDiljeLoG96JT
         4U//ll/TXiFRQVoXZUpsiVHvTyeAmsuOwNB3P2GIB+xeRj5Ou+a+w5C/+YleZvoLozfZ
         pkkq5IWoe1qpsdxBpkD3azSi6EPRkytWbUOnp70tYTprR9V686DW/Q6OJ18rjTT/ETP1
         UdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bOuN10kTZpoD12I9gtx0WrM+XsstzVhwRtcvSflFkDQ=;
        fh=ml6YVqtr/eMddLQQfYPoEJgG+syI5PAPYRS6y2O8yZE=;
        b=GrNIhZwJzSbsF1SLzrQtvYCAdzi27CnXoVWUyCtAEWp15GfRC0CizuY2d/mofz3fEN
         yoYj31RjYWOClznxJlyHrD4V3uQ2o4g+AKpq2B8TaZBfdvYKQnG88rrbU5hzJWDdFh8s
         yMGJ2OCV44HjzMufF2SOAqQmjMWVO1tPfTDr8k5Ft9/Tslmv1U0NG6XBf4XbiMReUzdo
         M+i3hdcBsaEHPFM7DPti+DZRdNGT0mr5nCxmpwU7yzdzn5WrJt6aTGmI2qEo72aizytu
         UrOX5kASjdwjtVPnv0LEsfCexcT2UN23W+6eWPoEEO6FF4OuELaQoAlq36lcviEHOzgQ
         QUBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20251104.gappssmtp.com; s=20251104; t=1785982723; x=1786587523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOuN10kTZpoD12I9gtx0WrM+XsstzVhwRtcvSflFkDQ=;
        b=w1t3G50gw7oJnfz5vrviBVh7zoBv/gyJ2z0PDejYJNrUgU9tSPmyvHlOwB/+l4vPIZ
         Icj51f10BHImeZhHApDHIo0DBJBMbNzGW5RefjkZKK+TTcJQSG/icSt0ncEMYsl5USfP
         T25ad0+QS+65/YEBOhT2g/M4y+IO/9ieVzuz02KTPofsGN53q7FHDkNruXxvJLC4H3ro
         TLCJjML7hhyBHLyCBzK+XTP88PmAB1TgXgdQADC3+37pT8MzskRO5F3gl7CruI0Pn4nm
         hsJ4gZGjgCfm3rsiOSbwq3Lf9vbDRNPZ1F3gGRIWinJ5HozwpV2wKal6cJpM6TfF9TtR
         /koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785982723; x=1786587523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOuN10kTZpoD12I9gtx0WrM+XsstzVhwRtcvSflFkDQ=;
        b=bWiPSy89sMd4sxUZk8ASYXL9VBGO9fQ9/ttF5l1SE3ElAH23obEClVCIaPQpKk1D/P
         bmRWhyXfg4X7oZwjiyAzWT/ItOvGPznx8vsbWR9QVlksrXIgsKroNDgfb7iZLYNG7mB1
         w8B6PSR6vuwJexgPMTIAwCIHyvL5Vp09HzX4VtmLEvTyinT4v/SRPixd1yQSD+Yoy+YP
         BE2JhWi6g9gThF+pO3w9D7tRmlT6uywtxY1+FZmzIX65o2nA6rdhgrEoXu8UehU18Laq
         kMR1W5vcgpRkFPfmmIODJMyrZ/65O7EbfqkuW0W63lorLeo2JTTT4IyVKnLtxlWVCEqa
         +A8A==
X-Gm-Message-State: AOJu0YwbTCoTLkg0xzDq5Al5cyk/3qcegWXZ44Pb2WKNDhx3pUVOQw6W
	KIDv1VLIzuq8Z3zmsJo7DhrbT+ukbIKpqU+t4PYoHlhb2rJaWpCAcZlC1P2S+oNruIZrPhWVnHB
	Nyqe1ZaCE2CE3dIF72435n4JiQWepn1jAkPqqDyaoyc9zqTe37T/1GbaKrg==
X-Gm-Gg: AR+sD10z8cFK690GqfmwUoV5xbcWuQkcw4qYPk3zAOqWnhzA/84Jt/BdFRPcdS+QBYP
	dNMIYt4fTfinodb5gWD7/4tWARyjBZdqSA1NVlFHmz+BjQ+wRsvMmfhkvT6IlGcDSXVqpTmP/AW
	gqHCpttdwByLq+TyfOWlPX9/DzC3Evuvh/V5deTMYmV6ocYDTF03gx7dEML2HNDN2yfjEf4n/0N
	/XXv+dogBxuezkDtGcv6gSQ9BTLB7+vu1p2xaeoZPRorCzhhGy5mVUa3hLE7FAwzfDqrtZoTAg5
	JuIOzmyx1vh0lpcp+R51AzfmBW31for9k7EsP61TtJYLxeiWhUmm5O760vj7q6q1twuvUFaH0r5
	hlGTQ95SLIOv44ts=
X-Received: by 2002:a05:6214:5195:b0:8f0:47b2:5734 with SMTP id
 6a1803df08f44-9088105ab16mr133653006d6.7.1785982722545; Wed, 05 Aug 2026
 19:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAw_munfAcpOUw-J9dPcnzVu+sibyxymFkLTp-a3-PMEe6VRZQ@mail.gmail.com>
 <anMof36XGNf1UjM8@black.igk.intel.com> <anMwjQvKA9GYmH85@black.igk.intel.com>
In-Reply-To: <anMwjQvKA9GYmH85@black.igk.intel.com>
From: Jacob Riff <jacob@riff.dk>
Date: Wed, 5 Aug 2026 19:18:06 -0700
X-Gm-Features: AUfX_mzUkDQkzEGUccXzft0vaATTpVVukPzsF2i3gYOSkuS_jQG0vNuTXY4H-Ks
Message-ID: <CAAw_mu=c96SYR2QGtoE=EoVRu+iGDo7x=vDjDYP4nc2yfkMnvw@mail.gmail.com>
Subject: Re: ucsi_acpi: intermittent "PPM init failed" at boot is never
 retried, Type-C event handling stays dead for the session
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

I tested Huang Wei's patch on the affected machine (applied to 7.1.4's
ucsi.c, confirmed active via srcversion): no improvement.

8 boots with the patch: 4x "PPM init failed", 4 ok. That is the same
~50-60% failure rate as the unpatched baseline (5 of 8).

That matches what the error flavors suggest: this doesn't look like a
slow PPM. The -ENODEV case is GET_CAPABILITY completing but reporting
zero connectors, and the -EINVAL case comes with "possible UCSI driver
bug 2", i.e. the PPM rejecting a standard command. These are prompt
wrong answers rather than missing ones, so a longer completion wait
doesn't change the outcome.

One additional data point from this round: all 8 test boots had
nothing attached to any Type-C port, and the failure rate was
unchanged. So it doesn't appear related to PD contract negotiation
racing the handshake either. The PPM simply seems not ready to answer
correctly for a window during boot.

Which still leaves the observation from my original mail: reloading
ucsi_acpi a couple of seconds later has succeeded on every attempt
(well into double digits now), and the machine then behaves fully
normally. Would retrying ucsi_init() a few times on -ENODEV/-EINVAL,
similar to the existing -EPROBE_DEFER requeue, be an acceptable
direction? Happy to test such a patch on this hardware.

- Jacob Riff
Mobile: 760-840-6060

On Wed, Aug 5, 2026 at 5:46=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Aug 05, 2026 at 02:11:43PM +0200, Heikki Krogerus wrote:
> > On Sat, Jul 25, 2026 at 02:31:53PM -0700, Jacob Riff wrote:
> > > Hi,
> > >
> > > On a Lenovo ThinkPad X1 Carbon Gen 14 (21V7CTO1WW, Panther Lake), UCS=
I
> > > initialization intermittently fails at boot, and because the failure =
is
> > > never retried, no typec ports are registered for the rest of the
> > > session. Most visible consequence: after unplugging and replugging th=
e
> > > USB-C charger (a PD monitor), the machine silently never resumes
> > > charging. Notably, DisplayPort alt mode on the same port continues to
> > > work across replugs in this state, and charging does work if the
> > > charger was already attached at boot (EC autonomous) - it is
> > > specifically resumption of charging after a replug that is lost, whic=
h
> > > makes the failure easy to miss until the battery is unexpectedly
> > > drained.
> > >
> > > Failure rate: 5 of 8 boots on one day of testing. Reproduced on two
> > > firmware versions including the latest (BIOS N4OET49W/1.12 and
> > > N4OET51W/1.14, EC 1.09 and 1.10). No clear correlation with whether
> > > anything is attached at boot: two boots one minute apart with the sam=
e
> > > setup split ok/fail.
> > >
> > > Kernel: 7.1.4 (Arch Linux, unpatched in this area)
> > >
> > > Two failure flavors seen:
> > >
> > >   ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
> > >
> > > and:
> > >
> > >   ucsi_acpi USBC000:00: possible UCSI driver bug 2
> > >   ucsi_acpi USBC000:00: error -EINVAL: PPM init failed
> > >
> > > Both appear ~1s after the typec ports bind. On failed boots
> > > /sys/class/typec/ stays empty.
> > >
> > > The part that suggests a driver-side improvement: recovery is trivial=
.
> > > Reloading the module seconds later has succeeded on every attempt so
> > > far (double digits by now):
> > >
> > >   modprobe -r ucsi_acpi && sleep 2 && modprobe ucsi_acpi
> > >
> > > after which connectors register and charging renegotiates immediately=
,
> > > no replug needed.
> > >
> > > ucsi_init_work() currently only requeues the init work for
> > > -EPROBE_DEFER (up to UCSI_ROLE_SWITCH_WAIT_COUNT). Given that an
> > > immediate retry reliably succeeds here, would it be reasonable to als=
o
> > > retry a few times on other errors (-ENODEV/-EINVAL) before giving up?
> > > The PPM on these machines appears to simply not be ready to answer
> > > during a window around when init runs.
> > >
> > > Possibly related prior reports of Lenovo PPMs being slow/unready at
> > > init: the "usb: typec: ucsi: increase timeout for PPM reset operation=
s"
> > > RFC (Feb 2025) and Ubuntu bug #2054928 (ThinkPad E490, -ENODEV).
> > >
> > > Happy to test patches on this hardware.
> >
> > I'm sorry to keep you waiting. I'm just letting you know that this
> > issue is in my queue, but right now I don't have time. I will try
> > to take a closer look at this later this month.
>
> Can you check does this improve the situation:
> https://lore.kernel.org/linux-usb/20260805085725.389761-1-huangwei@kylino=
s.cn/
>
> Thanks,
>
> --
> heikki
