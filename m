Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D533446AD
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217009; cv=pass; b=nNOO2LUPiIfjgIWWuO5MkKTLp7Pcn+2ffnZP/ZybYSjnG4By3U5uBipm1onfsuBwJTTz0c/uQPEM1aqLtupj13D/vFe6brNP45pnU45HK+mld9sEbFyR3bXTvmy2tZGkBZhSUVjedCGPRooNX4n9pXUs/iTTTmgK2WUPY7bTuaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217009; c=relaxed/simple;
	bh=T53K4ZRrYq5t4hMdjhHTdnoXmWC0zPp84A9hOgvvfKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QS9lAhsfXyLonQN+ocJ0B9KkRVbpT+LM05+fwOXCXN4F56qdXImvhkEC4gmEJ09eqZF6peRZphkdSNGEwrRPsMbKXb1A4E+LLC9/z2Woj2SPCxnvUq+L41WNrQZZWL31tw8adebPCBvzYAVIjTb4HIf8ARj+YBoJkMkS6VKmEe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LFzZoIxB; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LFzZoIxB"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso416486a91.3
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 05:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789217006; cv=none;
        d=google.com; s=arc-20260327;
        b=jBtbiNBDmX8i7b5h140z10pMX2cTrBCi8JBSaZBc6hhs36tuxyYFjQhl5k/DT/JPkM
         OMfS95fGvwrEIT8ErgI0Hij0xEDt+0nPNuktQzEXagJyPj3x4y/nebHgoA12kXzVA6WF
         Dnb2v64A2VxuT1u4hkxEeCahHcCHjet131WG9MKMCa5hJCc40/wG98VvcILa1TpiuQMl
         XlT3LZq+BWGiQoKLLFmXQKtK8TJ3RmVJsIO8aOXTcms96v9CxtwFjhJaKLk8l1q7SibC
         8m3Tq5KJ3kEUGKI2ccMcho/X4dEA+YxT+4Bz58sowt/8hJ/kgxtojcPPx6gBotlWsPd+
         yx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8oXEJCnfl3/7874woQnVUmE5LhKKzoJDMyZ+S0+iYw=;
        fh=NT6Qek0GGoRL9ZkRE3ou0xTiO8DqyIRHszi3yTdDdJc=;
        b=rLv6F7dr7g2AG0g/VWwzy15uOv0UAQ7WIOJLjoevGj8ppXCKm8qDwaOqUn9IC+KIci
         q/IHRQB4FtL0+AGWQUttCNIAqID6HhsYLb0/Lhw8CyjYWp7ltAyZ7UApU7KKpKI2204f
         HO/oobkpNmiPBdM7BUl1QwY1aRD41/mu+ZT7C/j7BHxDShx9tDz6WfFdO8Ypta/sWZRb
         RjXruBUWbWrA+Zjj5JGgAVEwhxdxY1zc5uX2YCXCv57Coyp24zfJYWqy8cggz1DtqVHe
         W2x/4aXx1joyL4nIWO+mjIic3VWAKHyWS2UaR/OjKMpxPoLAJ7nfwVz4EyIJvRrINvxl
         ec2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789217006; x=1789821806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8oXEJCnfl3/7874woQnVUmE5LhKKzoJDMyZ+S0+iYw=;
        b=LFzZoIxB+kJvPBX5nNCrNOjjdi80Jnanz1qaKbaVyABF9TKOWGfH7vEEub7PCMCZHC
         zsyFQULaFJ2+uiXZ2Ww5Mxb7iLaJbsp3A6BozZ4577Ie7cHZoJtW3Q5Orzg+KwyOpRRc
         kQ9cnbpKWb0wQoh698JqHk+q8vq38RKQa0StK+A14PSky15E5ZkMwIabATlAXX+7Kb1F
         Z8lZwsJ/JLgPSFliUtl++Ya0kBcmqKwau83yXcG0cq4h2c/cyWUB3tQ7wNA7zQ2WQBUZ
         B2cvOLWlb19ObPUMiQlRyO+qxeugboyYgDb7Vw7k/YZfytzV0qlrx3kibhSkqOVsNSPq
         SBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217006; x=1789821806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8oXEJCnfl3/7874woQnVUmE5LhKKzoJDMyZ+S0+iYw=;
        b=Gw9wHFpaFyzqsnGL5yW2pjnQ0n6ijTvBdrZjEmitC3ixm4ZSh6XZrK2Kac+hdNma2z
         DqsMqKf014YBnXJe01oDoo6ooJB5Nbc4TNfXyOK4bYVY/LLCyEtD+w44XZOyPeaa7ICZ
         tk5dO7YQNmqnXsRTwUTIndvp9MRxAyLmszhS0J8bBwv9IE5d26l1kyMUIpFuSWYNyfmE
         LNnb3O2s97VCgHcpzAshv6lFfmdPop0oBBioz/VZTSsVTAGDDaSUtOtvnBO9qVw/DMOL
         sogxYS3cTIXHTJR5gIkcsuLlo7rUFhN6rdprr0vqBpYhJvP3eq/xbrEPaDsdAmZgpkq9
         VIjQ==
X-Gm-Message-State: AFuF++lNyd9EBI7BLz59UcRDMLaLbYmwhfXK0pwQ3QboCFAKGMFd8KQe
	zFF4/JvmwOgp2sgm3tEtfFk1xdMWrzKbVhpb+d94dBYCrtvTZsN2zScimnI1XFQ7z+zYiCSnw8u
	It5NM3/405PZmrA8JNxe+nUtH2cEk6sk=
X-Gm-Gg: AYBFou1qEtl70l0lm4hahegJQeqIS5AL/4aT5nFqiKdyooN1GAanhWALIT29n1J46HV
	/XDxYNOIKNX0FfheZZtId4AAJqHoN5W961ZCsqp6f065fOtN8+FkvKm+pOTU/7Yp4hzphlbbeS2
	wV8saK7US9I22n4x4985pKMl9eP2QFhUzBEzc+OnZ1IpJxfc8c4DGJMnu2PDJrefP7hnjcDk6mp
	AM9J0UHPWRypqpLfvVVQxiDWcptccckMOlaNdAW2MhmhMqw8sKVGMrsxSIt2GXakXyfk97AzBwG
	RujNt3pQ4AmawRW8HPkVIvMsBflLSe8y0xn04vR2nZMm8rDuJ/9dfPkR5NR9n9FG//hDmZbuSU6
	Lly3l4LxCmGDFsPK4lCJHHg==
X-Received: by 2002:a17:90b:3c8c:b0:398:c315:fa6f with SMTP id
 98e67ed59e1d1-39dbc6a017emr4881898a91.14.1789217006251; Sat, 12 Sep 2026
 05:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com>
 <aqPU13Z_duC7d4E2@black.igk.intel.com>
In-Reply-To: <aqPU13Z_duC7d4E2@black.igk.intel.com>
From: Manuel Knitza <manuel.knitza@googlemail.com>
Date: Sat, 12 Sep 2026 14:43:14 +0200
X-Gm-Features: AcwNN1WX-Ik3VH8qhAsJnfg56xyT0rrLPkrw5p2kVj4Bf82EAFcoS0ccBe6UNGw
Message-ID: <CAMRbua4oitgPgCXtWKTJa0_5AHbtzLV-47k=nCSP0Rq-Mhpx-w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BBUG=5D_ucsi=3A_duplicate_partner_altmode_=E2=80=94_the_in?=
	=?UTF-8?Q?valid_VDO_wins=2C_DP_Alt_Mode_never_works?=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Guilhem HENRY <guilhemhenry@gmail.com>, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Heikki, and thanks for looping in Dell.

Tested on both kernels. Short version: the DMI match is right, the quirk
does exactly what it is meant to do, nothing regresses -

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

- but it does not fix the loss of function, and I think that part is
what needs to reach Dell.

DMI match
---------

Confirmed here:

    DMI_SYS_VENDOR   =3D "Dell Inc."
    DMI_PRODUCT_NAME =3D "XPS 16 DA16260"

Both DMI_MATCH substrings hit, so the quirk applies.

Build note
----------

The patch does not build on 7.1.x: there ucsi_sync_control_common() and
the .sync_control callback still take 5 arguments; msg_out/msg_out_size
arrived in 7.2. Against 7.2.x it compiles clean, no warnings. Mentioning
it only so nobody wastes time trying it on an older stable kernel.

Test result, unmodified patch on 7.2.3-arch1-3
----------------------------------------------

Before, with the stock module:

    Alt modes registered: 1
    port1-partner.0  svid=3D8087  vdo=3D0x8087a043  active=3Dno
    ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner
altmode SVID 0x8087 ...
    ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001

After loading the patched module:

    ucsi_acpi USBC000:00: Firmware bug: broken altmode details
reporting, disabling
    Alt modes registered: 0
    duplicate-altmode messages: 0
    all three connectors register normally

The already running DisplayPort link was not disturbed by the module
swap at any point: 5120x2160@60, port_clock 810000, lane_count 4, bpp 24
throughout. I also ran the same change backported to the 5-argument
signature on 7.1.8, with the same result.

One practical note for anyone repeating this: swap the module with
"rmmod ucsi_acpi", not "modprobe -r" - the latter also drops the then
unused typec_ucsi, and the new module fails with "Unknown symbol
ucsi_create".

What it does not fix
--------------------

With the unmodified patch loaded on 7.2.3 I unplugged and re-plugged the
monitor. The USB side comes back completely - hub, HID, cdc_acm all
re-enumerate - and DP-1 stays "disconnected". Zero UCSI messages this
time. Same outcome with the backport on 7.1.8. So not querying the alt
mode details does not change the functional result.

That matches an accidental experiment from a few days earlier: setting
ThunderboltPorts=3DDisabled in the BIOS stops the firmware offering the
Thunderbolt SVID, after which the kernel registers no partner alt modes
at all - and DisplayPort still works perfectly when the cable is attached
at boot, and still fails on hotplug.

Which means I should correct my own original report: I claimed the
retained malformed VDO caused the failure. It does not. While a 4-lane
HBR3 link was running I read

    port2-partner.0  vdo=3D0xff01a843 (the malformed one)  active=3Dyes
    displayport/     configuration=3D[USB]  pin_assignment=3DA  hpd=3D0

On this platform the typec alt mode bookkeeping never described reality
in the first place. Your patch removes data that was actively
misleading, which is worth doing on its own - but the bug underneath is
elsewhere.

The remaining bug, for Dell
---------------------------

DP Alt Mode is never entered again once the machine is running:

    cold boot with cable attached   always works
    hotplug                         never works
    resume from s2idle              never works
    hibernate (S4)                  always works   <- full POST

It is not limited to suspend. Merely blanking the screen is enough. The
lock screen issues a DPMS off on all outputs, the monitor deep-sleeps,
drops the link, and it never returns:

    xe [drm] *ERROR* [CONNECTOR:521:DP-1] Invalid DPCD with no link rates
    xe [drm] *ERROR* [CONNECTOR:521:DP-1] Invalid DPCD max lane count (0)

with the machine awake throughout - no PM: suspend entry in the log,
uptime continuous. The USB-C connection never drops; only the DP link
inside it dies.

Nothing on the OS side brings it back. Tried and failed, all of them:

  - power-cycling the monitor
  - modprobe -r ucsi_acpi && modprobe ucsi_acpi, in both orders relative
    to re-plugging the cable
  - echo 1 > /sys/kernel/debug/dri/0/DP-1/i915_dp_force_link_retrain
  - echo detect / echo on > /sys/class/drm/card0-DP-1/status
    ("on" yields only VESA fallback modes, no EDID - AUX does not answer)
  - echo device > /sys/class/typec/port1/data_role  -> EACCES
  - echo source > /sys/class/typec/port1/power_role -> EIO, plus
    "ucsi_acpi: unknown error 0"

A reboot is the only way back, which is hard to live with on a docked
laptop. My workaround is a small service that re-enables DPMS on external
outputs whenever anything turns them off, so the link is never dropped in
the first place.

Hardware: Dell XPS 16 DA16260, BIOS 1.10.1. Identical behaviour with a
plain USB-C-to-DP adapter and with a direct USB-C cable to the monitor,
so it is not the adapter.

Happy to test patches or firmware and to collect any traces that help -
the machine reproduces all of this on demand.

Am Fr., 11. Sept. 2026 um 12:15 Uhr schrieb Heikki Krogerus
<heikki.krogerus@linux.intel.com>:
>
> +Dell and Guilhem
>
> On Wed, Sep 09, 2026 at 03:25:11PM +0200, Manuel Knitza wrote:
> > Hi,
> >
> > on a Dell XPS 16 DA16260 (Panther Lake, BIOS 1.10.1) the UCSI firmware
> > reports the
> > DisplayPort alternate mode twice with conflicting VDOs. The kernel
> > keeps the first entry
> > and discards the second =E2=80=94 but here the first is the malformed o=
ne, and
> > the result is that
> > DisplayPort Alt Mode never works on any port when a plain USB-C=E2=86=
=92DP
> > adapter is hotplugged.
> >
> > >     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmo=
de SVID 0xff01 at
> > >         offset 1, ignoring but please contact the BIOS vendor to fix =
this issue.
> > >     ucsi_acpi USBC000:00: con2: VDO mismatch: 0xff01a843 vs 0x4010140=
7
> >
> >
> > Identical output on con3. Reproduced on 7.1.8 and 7.2.3.
> >
> > The firmware is clearly at fault and the message says so. My point is
> > a different one: of
> > the two VDOs the firmware offers, one is usable and the kernel
> > systematically picks the
> > other, turning a firmware quirk into a total loss of function.
> >
> > > Retained  0xff01a843 =E2=80=94 top 16 bits are 0xff01, i.e. the SVID =
itself, apparently packed
> > >                        into the VDO field by the firmware. Parsed as =
a DP VDO this
> > >                        advertises only pin assignments D and F (2 lan=
es).
> > > Discarded 0x40101407 =E2=80=94 well-formed DP Alt Mode VDO: DFP_D + U=
FP_D, DPv1.3 signalling,
> > >                        UFP_D pin assignments C and E (4 lanes).
> >
> >
> > The adapter itself is not the source of the duplicate. Its USB
> > Billboard descriptor
> > declares exactly one alternate mode:
> >
> > >     Billboard capability: supported alt modes =3D 1, preferred =3D 0
> > >       [0] SVID =3D 0xff01
> > >     Billboard AltMode capability: dwAltModeVdo =3D 0x40101007
> >
> >
> > So the device offers a single, valid DP VDO; the duplication and the
> > corrupted variant are
> > produced on the UCSI/PPM side.
> >
> > Consequences with the malformed VDO retained:
> >
> >   - /sys/class/typec/portX-partner/portX-partner.0/displayport/pin_assi=
gnment
> > shows "D F",
> >     never C or E, so even a working link could not carry 4 lanes.
> >   - hpd stays 0; the sink is never seen.
> >   - Writing to .../displayport/pin_assignment fails with
> >       typec_displayport portX-partner.0: firmware doesn't support
> > alternate mode overriding
> >     so userspace cannot correct it either.
> >
> > Interestingly the hardware path is fine: if the same adapter is
> > already connected at boot,
> > the display comes up at full 5120x2160@60, port_clock 810000 (HBR3),
> > lane_count 4, bpp 24.
> > Only the hotplug path, which goes through UCSI, fails. That reinforces
> > that the platform
> > can do 4-lane DP and only the altmode bookkeeping is wrong.
> >
> > Would it be reasonable for ucsi_altmode_is_duplicate() /
> > ucsi_register_altmode() to prefer
> > a VDO that parses as valid for the given SVID over one that does not,
> > instead of keeping
> > whichever arrived first? For DP Alt Mode a cheap sanity check exists =
=E2=80=94
> > a VDO whose upper
> > bits repeat the SVID, or which advertises no pin assignment usable by
> > the port, is not a
> > plausible descriptor. Keeping the current warning would still tell the
> > user their firmware
> > is broken, while not letting it break the port.
> >
> > I am happy to test patches; the machine reproduces this on every hotplu=
g.
> >
> > Relevant symbols in the module: ucsi_altmode_is_duplicate,
> > ucsi_register_altmode,
> > ucsi_register_altmodes, ucsi_check_altmodes, ucsi_dump_duplicate_altmod=
e.
> >
> > Full message text for reference:
> >     "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset
> > %d, ignoring but
> >      please contact the BIOS vendor to fix this issue."
> >     "con%d: VDO mismatch: 0x%08x vs 0x%08x"
> >
> > --
> >
> > A second, probably unrelated observation on the same machine,
> > mentioned only in case it
> > rings a bell: ucsi_acpi frequently fails at boot with
> >
> >     ucsi_acpi USBC000:00: con1: failed to register alt modes
> >     ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> >
> > after which /sys/class/typec/ is empty for the rest of the session.
> > Reloading the module
> > ("modprobe -r ucsi_acpi && modprobe ucsi_acpi") brings all three ports
> > up. UCSI_GET_PDOS
> > also fails persistently with -5 and occasionally -95. Same firmware,
> > same platform. I can
> > send that as a separate report with full logs if it is of interest.
>
> Thanks for the report. There are now a lot of issues with the altmodes
> on these Dell XPS laptops. These problems have been reported also on
> earlier Dell XPS 13 and on some other Dell systems too.
>
> Hopefully Dell fixes their EC/PPM firmware at some point, but for now,
> I'm removing the alternate mode details UCSI feature flag from all
> Dell XPS systems. That means the alternate modes are not going to be
> registered at all on these laptops.
>
> thanks,
>
> --
> heikki
