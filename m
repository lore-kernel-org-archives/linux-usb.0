Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FB2CCC5
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717395; cv=none; b=upidX5Ax01xj9If0pbQbLb9AW8jIeitXtqA8ALMOSm61f4TFsJxikcY0sz7D4hLxClEwBzF3/v7H4E0hUMuX4wLOWmjTbX/AvstqOZhkH5ZX7AS41s52YbsZf0PSBnztKYYvww6Ia4w9aK8cTuHkZOGLtD5ipd+b7RsyjBvcIZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717395; c=relaxed/simple;
	bh=W+K2bNcreWCpuPjTCvsX8Jt7OpOgb1skysa1g+YVC2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg5SgYx4QUlI6LwIuiS90TZSHHLX8jPPRudmh5ACsrmgSKrWk1bCuMwjES6pkRxFpLbMIFrhPA8R2BwDvAfpT1E9P67i1OjlI/z61Rvfk4JeiI2UEZeuvBS5kB0OvTPx9PoI82iCog2gd5kDfkUFQoSAET/FoLwOI7r1stnkVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQf5lH4z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQf5lH4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789717385; x=1821253385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=W+K2bNcreWCpuPjTCvsX8Jt7OpOgb1skysa1g+YVC2I=;
  b=bQf5lH4zduqsZMmbZqMmmoIPZ5pz1stnYAv6yCSMdMnDEaX2rMxwHAe1
   rAttR3YNyoZ1BKv3m+13Nw5K78DfrjQIMtM57apB91GMPBM+q9aYMgZ97
   utAV5tIdsVsEFS93MbOj6I6Q/tReLsBIDyCKy27qEkaTVcC4cVDKEYEXl
   gB+rhs1q3Rjw36BRkaD4SgmqzG4LCZFYaTuMD5R4Ml1tEdpxQTDxkHtHH
   LzvMDo4Ptrh6vu93WYN89FHcsHlRBtOdALN4rzT5bf0dLti6yWxr/iTZk
   5lL0I1oaNx+XJJZGYWYtTgbbuQILFeKq0HyKHOwEqj3COkemlId8J1xJ8
   A==;
X-CSE-ConnectionGUID: oyS2dvlkRnGVuIJ5V4F+3g==
X-CSE-MsgGUID: WiDhcLrNQNaOopyUMe3TIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100802077"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100802077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:43:00 -0700
X-CSE-ConnectionGUID: oEhMxc9STN2eAilRtSqgIg==
X-CSE-MsgGUID: pFM8MvZqQ1i9FHa/pHmkEQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 Sep 2026 00:42:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id BAE5599; Fri, 18 Sep 2026 09:42:53 +0200 (CEST)
Date: Fri, 18 Sep 2026 09:42:53 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Manuel Knitza <manuel.knitza@googlemail.com>
Cc: linux-usb@vger.kernel.org, Guilhem HENRY <guilhemhenry@gmail.com>,
	Dell.Client.Kernel@dell.com
Subject: Re: [BUG] ucsi: duplicate =?utf-8?Q?partne?= =?utf-8?Q?r_altmode_?=
 =?utf-8?B?4oCU?= the invalid VDO wins, DP Alt Mode never works
Message-ID: <aqzrfTq1zDnWnQz4@black.igk.intel.com>
References: <CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com>
 <aqPU13Z_duC7d4E2@black.igk.intel.com>
 <CAMRbua4oitgPgCXtWKTJa0_5AHbtzLV-47k=nCSP0Rq-Mhpx-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRbua4oitgPgCXtWKTJa0_5AHbtzLV-47k=nCSP0Rq-Mhpx-w@mail.gmail.com>

On Sat, Sep 12, 2026 at 02:43:14PM +0200, Manuel Knitza wrote:
> Thanks Heikki, and thanks for looping in Dell.
> 
> Tested on both kernels. Short version: the DMI match is right, the quirk
> does exactly what it is meant to do, nothing regresses -
> 
> Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>
> 
> - but it does not fix the loss of function, and I think that part is
> what needs to reach Dell.

Thanks. Let's hope the guys from Dell take a look at this.

Br,

> DMI match
> ---------
> 
> Confirmed here:
> 
>     DMI_SYS_VENDOR   = "Dell Inc."
>     DMI_PRODUCT_NAME = "XPS 16 DA16260"
> 
> Both DMI_MATCH substrings hit, so the quirk applies.
> 
> Build note
> ----------
> 
> The patch does not build on 7.1.x: there ucsi_sync_control_common() and
> the .sync_control callback still take 5 arguments; msg_out/msg_out_size
> arrived in 7.2. Against 7.2.x it compiles clean, no warnings. Mentioning
> it only so nobody wastes time trying it on an older stable kernel.
> 
> Test result, unmodified patch on 7.2.3-arch1-3
> ----------------------------------------------
> 
> Before, with the stock module:
> 
>     Alt modes registered: 1
>     port1-partner.0  svid=8087  vdo=0x8087a043  active=no
>     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner
> altmode SVID 0x8087 ...
>     ucsi_acpi USBC000:00: con2: VDO mismatch: 0x8087a043 vs 0x00000001
> 
> After loading the patched module:
> 
>     ucsi_acpi USBC000:00: Firmware bug: broken altmode details
> reporting, disabling
>     Alt modes registered: 0
>     duplicate-altmode messages: 0
>     all three connectors register normally
> 
> The already running DisplayPort link was not disturbed by the module
> swap at any point: 5120x2160@60, port_clock 810000, lane_count 4, bpp 24
> throughout. I also ran the same change backported to the 5-argument
> signature on 7.1.8, with the same result.
> 
> One practical note for anyone repeating this: swap the module with
> "rmmod ucsi_acpi", not "modprobe -r" - the latter also drops the then
> unused typec_ucsi, and the new module fails with "Unknown symbol
> ucsi_create".
> 
> What it does not fix
> --------------------
> 
> With the unmodified patch loaded on 7.2.3 I unplugged and re-plugged the
> monitor. The USB side comes back completely - hub, HID, cdc_acm all
> re-enumerate - and DP-1 stays "disconnected". Zero UCSI messages this
> time. Same outcome with the backport on 7.1.8. So not querying the alt
> mode details does not change the functional result.
> 
> That matches an accidental experiment from a few days earlier: setting
> ThunderboltPorts=Disabled in the BIOS stops the firmware offering the
> Thunderbolt SVID, after which the kernel registers no partner alt modes
> at all - and DisplayPort still works perfectly when the cable is attached
> at boot, and still fails on hotplug.
> 
> Which means I should correct my own original report: I claimed the
> retained malformed VDO caused the failure. It does not. While a 4-lane
> HBR3 link was running I read
> 
>     port2-partner.0  vdo=0xff01a843 (the malformed one)  active=yes
>     displayport/     configuration=[USB]  pin_assignment=A  hpd=0
> 
> On this platform the typec alt mode bookkeeping never described reality
> in the first place. Your patch removes data that was actively
> misleading, which is worth doing on its own - but the bug underneath is
> elsewhere.
> 
> The remaining bug, for Dell
> ---------------------------
> 
> DP Alt Mode is never entered again once the machine is running:
> 
>     cold boot with cable attached   always works
>     hotplug                         never works
>     resume from s2idle              never works
>     hibernate (S4)                  always works   <- full POST
> 
> It is not limited to suspend. Merely blanking the screen is enough. The
> lock screen issues a DPMS off on all outputs, the monitor deep-sleeps,
> drops the link, and it never returns:
> 
>     xe [drm] *ERROR* [CONNECTOR:521:DP-1] Invalid DPCD with no link rates
>     xe [drm] *ERROR* [CONNECTOR:521:DP-1] Invalid DPCD max lane count (0)
> 
> with the machine awake throughout - no PM: suspend entry in the log,
> uptime continuous. The USB-C connection never drops; only the DP link
> inside it dies.
> 
> Nothing on the OS side brings it back. Tried and failed, all of them:
> 
>   - power-cycling the monitor
>   - modprobe -r ucsi_acpi && modprobe ucsi_acpi, in both orders relative
>     to re-plugging the cable
>   - echo 1 > /sys/kernel/debug/dri/0/DP-1/i915_dp_force_link_retrain
>   - echo detect / echo on > /sys/class/drm/card0-DP-1/status
>     ("on" yields only VESA fallback modes, no EDID - AUX does not answer)
>   - echo device > /sys/class/typec/port1/data_role  -> EACCES
>   - echo source > /sys/class/typec/port1/power_role -> EIO, plus
>     "ucsi_acpi: unknown error 0"
> 
> A reboot is the only way back, which is hard to live with on a docked
> laptop. My workaround is a small service that re-enables DPMS on external
> outputs whenever anything turns them off, so the link is never dropped in
> the first place.
> 
> Hardware: Dell XPS 16 DA16260, BIOS 1.10.1. Identical behaviour with a
> plain USB-C-to-DP adapter and with a direct USB-C cable to the monitor,
> so it is not the adapter.
> 
> Happy to test patches or firmware and to collect any traces that help -
> the machine reproduces all of this on demand.
> 
> Am Fr., 11. Sept. 2026 um 12:15 Uhr schrieb Heikki Krogerus
> <heikki.krogerus@linux.intel.com>:
> >
> > +Dell and Guilhem
> >
> > On Wed, Sep 09, 2026 at 03:25:11PM +0200, Manuel Knitza wrote:
> > > Hi,
> > >
> > > on a Dell XPS 16 DA16260 (Panther Lake, BIOS 1.10.1) the UCSI firmware
> > > reports the
> > > DisplayPort alternate mode twice with conflicting VDOs. The kernel
> > > keeps the first entry
> > > and discards the second — but here the first is the malformed one, and
> > > the result is that
> > > DisplayPort Alt Mode never works on any port when a plain USB-C→DP
> > > adapter is hotplugged.
> > >
> > > >     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0xff01 at
> > > >         offset 1, ignoring but please contact the BIOS vendor to fix this issue.
> > > >     ucsi_acpi USBC000:00: con2: VDO mismatch: 0xff01a843 vs 0x40101407
> > >
> > >
> > > Identical output on con3. Reproduced on 7.1.8 and 7.2.3.
> > >
> > > The firmware is clearly at fault and the message says so. My point is
> > > a different one: of
> > > the two VDOs the firmware offers, one is usable and the kernel
> > > systematically picks the
> > > other, turning a firmware quirk into a total loss of function.
> > >
> > > > Retained  0xff01a843 — top 16 bits are 0xff01, i.e. the SVID itself, apparently packed
> > > >                        into the VDO field by the firmware. Parsed as a DP VDO this
> > > >                        advertises only pin assignments D and F (2 lanes).
> > > > Discarded 0x40101407 — well-formed DP Alt Mode VDO: DFP_D + UFP_D, DPv1.3 signalling,
> > > >                        UFP_D pin assignments C and E (4 lanes).
> > >
> > >
> > > The adapter itself is not the source of the duplicate. Its USB
> > > Billboard descriptor
> > > declares exactly one alternate mode:
> > >
> > > >     Billboard capability: supported alt modes = 1, preferred = 0
> > > >       [0] SVID = 0xff01
> > > >     Billboard AltMode capability: dwAltModeVdo = 0x40101007
> > >
> > >
> > > So the device offers a single, valid DP VDO; the duplication and the
> > > corrupted variant are
> > > produced on the UCSI/PPM side.
> > >
> > > Consequences with the malformed VDO retained:
> > >
> > >   - /sys/class/typec/portX-partner/portX-partner.0/displayport/pin_assignment
> > > shows "D F",
> > >     never C or E, so even a working link could not carry 4 lanes.
> > >   - hpd stays 0; the sink is never seen.
> > >   - Writing to .../displayport/pin_assignment fails with
> > >       typec_displayport portX-partner.0: firmware doesn't support
> > > alternate mode overriding
> > >     so userspace cannot correct it either.
> > >
> > > Interestingly the hardware path is fine: if the same adapter is
> > > already connected at boot,
> > > the display comes up at full 5120x2160@60, port_clock 810000 (HBR3),
> > > lane_count 4, bpp 24.
> > > Only the hotplug path, which goes through UCSI, fails. That reinforces
> > > that the platform
> > > can do 4-lane DP and only the altmode bookkeeping is wrong.
> > >
> > > Would it be reasonable for ucsi_altmode_is_duplicate() /
> > > ucsi_register_altmode() to prefer
> > > a VDO that parses as valid for the given SVID over one that does not,
> > > instead of keeping
> > > whichever arrived first? For DP Alt Mode a cheap sanity check exists —
> > > a VDO whose upper
> > > bits repeat the SVID, or which advertises no pin assignment usable by
> > > the port, is not a
> > > plausible descriptor. Keeping the current warning would still tell the
> > > user their firmware
> > > is broken, while not letting it break the port.
> > >
> > > I am happy to test patches; the machine reproduces this on every hotplug.
> > >
> > > Relevant symbols in the module: ucsi_altmode_is_duplicate,
> > > ucsi_register_altmode,
> > > ucsi_register_altmodes, ucsi_check_altmodes, ucsi_dump_duplicate_altmode.
> > >
> > > Full message text for reference:
> > >     "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset
> > > %d, ignoring but
> > >      please contact the BIOS vendor to fix this issue."
> > >     "con%d: VDO mismatch: 0x%08x vs 0x%08x"
> > >
> > > --
> > >
> > > A second, probably unrelated observation on the same machine,
> > > mentioned only in case it
> > > rings a bell: ucsi_acpi frequently fails at boot with
> > >
> > >     ucsi_acpi USBC000:00: con1: failed to register alt modes
> > >     ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> > >
> > > after which /sys/class/typec/ is empty for the rest of the session.
> > > Reloading the module
> > > ("modprobe -r ucsi_acpi && modprobe ucsi_acpi") brings all three ports
> > > up. UCSI_GET_PDOS
> > > also fails persistently with -5 and occasionally -95. Same firmware,
> > > same platform. I can
> > > send that as a separate report with full logs if it is of interest.
> >
> > Thanks for the report. There are now a lot of issues with the altmodes
> > on these Dell XPS laptops. These problems have been reported also on
> > earlier Dell XPS 13 and on some other Dell systems too.
> >
> > Hopefully Dell fixes their EC/PPM firmware at some point, but for now,
> > I'm removing the alternate mode details UCSI feature flag from all
> > Dell XPS systems. That means the alternate modes are not going to be
> > registered at all on these laptops.
> >
> > thanks,
> >
> > --
> > heikki

-- 
heikki
