Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D104248A0
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121761; cv=none; b=t5Vo3jSt+9Ej6VLilwubweXNG4+AY/spCiFceE1viHv2MrSeITzQAwaEkdL3o+wSmDKMUFy87lN+o2Ac/9GN5HNXtGK9ivuhYAT3aXJkkDQLh9Q8wnqIuRQBxPqxi2dxzjA/k5BXttPmIx93vunYrXSK8pEvATQln8Xf3NPz3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121761; c=relaxed/simple;
	bh=jqLLJS3xNSAbUSFdLGAPyzAs4y5+XLvQWG+U7OY8cYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkIV1air+tlZb5KFMjgs2wSxEVm02eYRs7MlXdPQpLTjfRHnWy6Vo/IJrcHax8KmFRLxq8pqUgZpCv8ND9l6sojPeQM594MI7pnRp1Ucko9I6VgHTNoGMzmw9tG0koPe1xXPR3fGR+NE2p2EO/eArTNN7W8UtYVYq3Ih5z7NVhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ND4LDy/g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ND4LDy/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789121758; x=1820657758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jqLLJS3xNSAbUSFdLGAPyzAs4y5+XLvQWG+U7OY8cYo=;
  b=ND4LDy/g+UsIKGLyQZqFE+pY6X2KmSesCueNT3ZRg1H4e2UwQafqIUBa
   0xhDcjHhzdLz0r3ISgOV96uA7ArXIrVzkPvagbl31NvA/hrwDlI8lFjHE
   U/6TWmR7V1N7/C6pO5U5TPQoUhhZI5z8wByBfwmIMRxSJXFTAvqy0pnic
   tPr7wkrWupxwISQOpWnT1XVP9Bcb5WpqlIWFkpYnCi33U11MrBpQWPTAp
   QzEg+1n6QmuPqn7wB2jE1jOhpS3U7MfkGx3R5UdHN2oZuTvWPYmNxbCAb
   XJUbTayAG97Lukn4agrP0i6wuc0nkqDBu9X4Kec/EMc3NjtE3XTbE3Lr2
   A==;
X-CSE-ConnectionGUID: B+N+bZFkSpOpRlvcruq2mg==
X-CSE-MsgGUID: cGGxRNzkQNOlFXQ0vlCgpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89348390"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89348390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:15:54 -0700
X-CSE-ConnectionGUID: juflpSZnSSCOgqb56vLeVA==
X-CSE-MsgGUID: 7wBrAEo4Qyek260aS31ucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="270507495"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2026 03:15:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 4E6BA99; Fri, 11 Sep 2026 12:15:51 +0200 (CEST)
Date: Fri, 11 Sep 2026 12:15:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Manuel Knitza <manuel.knitza@googlemail.com>
Cc: linux-usb@vger.kernel.org, Guilhem HENRY <guilhemhenry@gmail.com>,
	Dell.Client.Kernel@dell.com
Subject: Re: [BUG] ucsi: duplicate =?utf-8?Q?partne?= =?utf-8?Q?r_altmode_?=
 =?utf-8?B?4oCU?= the invalid VDO wins, DP Alt Mode never works
Message-ID: <aqPU13Z_duC7d4E2@black.igk.intel.com>
References: <CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com>

+Dell and Guilhem

On Wed, Sep 09, 2026 at 03:25:11PM +0200, Manuel Knitza wrote:
> Hi,
> 
> on a Dell XPS 16 DA16260 (Panther Lake, BIOS 1.10.1) the UCSI firmware
> reports the
> DisplayPort alternate mode twice with conflicting VDOs. The kernel
> keeps the first entry
> and discards the second — but here the first is the malformed one, and
> the result is that
> DisplayPort Alt Mode never works on any port when a plain USB-C→DP
> adapter is hotplugged.
> 
> >     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0xff01 at
> >         offset 1, ignoring but please contact the BIOS vendor to fix this issue.
> >     ucsi_acpi USBC000:00: con2: VDO mismatch: 0xff01a843 vs 0x40101407
> 
> 
> Identical output on con3. Reproduced on 7.1.8 and 7.2.3.
> 
> The firmware is clearly at fault and the message says so. My point is
> a different one: of
> the two VDOs the firmware offers, one is usable and the kernel
> systematically picks the
> other, turning a firmware quirk into a total loss of function.
> 
> > Retained  0xff01a843 — top 16 bits are 0xff01, i.e. the SVID itself, apparently packed
> >                        into the VDO field by the firmware. Parsed as a DP VDO this
> >                        advertises only pin assignments D and F (2 lanes).
> > Discarded 0x40101407 — well-formed DP Alt Mode VDO: DFP_D + UFP_D, DPv1.3 signalling,
> >                        UFP_D pin assignments C and E (4 lanes).
> 
> 
> The adapter itself is not the source of the duplicate. Its USB
> Billboard descriptor
> declares exactly one alternate mode:
> 
> >     Billboard capability: supported alt modes = 1, preferred = 0
> >       [0] SVID = 0xff01
> >     Billboard AltMode capability: dwAltModeVdo = 0x40101007
> 
> 
> So the device offers a single, valid DP VDO; the duplication and the
> corrupted variant are
> produced on the UCSI/PPM side.
> 
> Consequences with the malformed VDO retained:
> 
>   - /sys/class/typec/portX-partner/portX-partner.0/displayport/pin_assignment
> shows "D F",
>     never C or E, so even a working link could not carry 4 lanes.
>   - hpd stays 0; the sink is never seen.
>   - Writing to .../displayport/pin_assignment fails with
>       typec_displayport portX-partner.0: firmware doesn't support
> alternate mode overriding
>     so userspace cannot correct it either.
> 
> Interestingly the hardware path is fine: if the same adapter is
> already connected at boot,
> the display comes up at full 5120x2160@60, port_clock 810000 (HBR3),
> lane_count 4, bpp 24.
> Only the hotplug path, which goes through UCSI, fails. That reinforces
> that the platform
> can do 4-lane DP and only the altmode bookkeeping is wrong.
> 
> Would it be reasonable for ucsi_altmode_is_duplicate() /
> ucsi_register_altmode() to prefer
> a VDO that parses as valid for the given SVID over one that does not,
> instead of keeping
> whichever arrived first? For DP Alt Mode a cheap sanity check exists —
> a VDO whose upper
> bits repeat the SVID, or which advertises no pin assignment usable by
> the port, is not a
> plausible descriptor. Keeping the current warning would still tell the
> user their firmware
> is broken, while not letting it break the port.
> 
> I am happy to test patches; the machine reproduces this on every hotplug.
> 
> Relevant symbols in the module: ucsi_altmode_is_duplicate,
> ucsi_register_altmode,
> ucsi_register_altmodes, ucsi_check_altmodes, ucsi_dump_duplicate_altmode.
> 
> Full message text for reference:
>     "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset
> %d, ignoring but
>      please contact the BIOS vendor to fix this issue."
>     "con%d: VDO mismatch: 0x%08x vs 0x%08x"
> 
> --
> 
> A second, probably unrelated observation on the same machine,
> mentioned only in case it
> rings a bell: ucsi_acpi frequently fails at boot with
> 
>     ucsi_acpi USBC000:00: con1: failed to register alt modes
>     ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> 
> after which /sys/class/typec/ is empty for the rest of the session.
> Reloading the module
> ("modprobe -r ucsi_acpi && modprobe ucsi_acpi") brings all three ports
> up. UCSI_GET_PDOS
> also fails persistently with -5 and occasionally -95. Same firmware,
> same platform. I can
> send that as a separate report with full logs if it is of interest.

Thanks for the report. There are now a lot of issues with the altmodes
on these Dell XPS laptops. These problems have been reported also on
earlier Dell XPS 13 and on some other Dell systems too.

Hopefully Dell fixes their EC/PPM firmware at some point, but for now,
I'm removing the alternate mode details UCSI feature flag from all
Dell XPS systems. That means the alternate modes are not going to be
registered at all on these laptops.

thanks,

-- 
heikki
