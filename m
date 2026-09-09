Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF588566C6B
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962376; cv=none; b=tH7Wc74p4GeBHTcNQEdQpXg01m7YKAu2fkcmc2MOcO4YSnegWhoGlDIa3K1l/hG8lcZ/gDKFLAYmkbPQsLjvS360jX+3jq1cseOvffkYHRMTtKD2s2y8TlsILc8EARy/C3IS39XgnXXJgb0EUWmDxZSuRQ7wWUxr63oDNmCp7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962376; c=relaxed/simple;
	bh=w3j3jDgZO8aqqqdOOYv3kNfxJPxOfSnwsS33P7birW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVvOLCMmHBuLHRzgpS4PjIXPW/Ezz9i+FFnbSfKksyGijL8jj3TRwA8XrnEm+AnUQd2yicJNC7BjL925jmdBTf4y2QHksT4RXTx+A/E6e7zsZK0e0TTH4465OixCpX8TUEjeLkLRu64Kt6nft2k0UsXfk3a6z5KMqnV1KKuZQHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL1zv+aY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL1zv+aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788962375; x=1820498375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3j3jDgZO8aqqqdOOYv3kNfxJPxOfSnwsS33P7birW4=;
  b=VL1zv+aYwPfJS0Cnj/ACenzCr204Nz5OPyJVj3SekXTMDLhfYx7ZN+5w
   Fyvlld7dxKj3PahzdC8D/jOkrE7Z36PeVgEHi0QkqQUmMHe2KjNT+/kqP
   MlZpt/HyWZRx1siklhOVvHOY7cCxIMoW7N/sGpnIJgEefGGZ7IC1xEG4V
   Y9etz1lG6O3h29Y9YIJYf9A4tGXt1eruKkvS9udegtVw+S/kbmoxwM4c0
   4oaASCeneFodyk068d0JRhmmxONaodBqM9SwXOdO0sBNqksDdM9BaZq/r
   6udFWGwzTowdNsin0vuusl0Rug26M2OlDNX+Egu75f2RS+dx9PY2mGsWh
   w==;
X-CSE-ConnectionGUID: PoqtAIi4Q4i8EO/9a+SrCw==
X-CSE-MsgGUID: wlCcu/zfRgG2M+Q8NTMCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89257622"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89257622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:59:34 -0700
X-CSE-ConnectionGUID: 7zgwIT7kRY2AUaZ64fjvnA==
X-CSE-MsgGUID: oewAcadSSHSq+93MHxKhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267645359"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2026 06:59:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3913099; Wed, 09 Sep 2026 15:59:31 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:59:31 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ismail Tarim <ismailtarim7@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] ucsi_acpi: unstable GET_ALTERNATE_MODES(SOP) response
 prevents DP Alt Mode binding on ASUS K3605ZV
Message-ID: <aqFmQweuMGoLYeaw@black.igk.intel.com>
References: <20260907171909.1657882-1-ismailtarim7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907171909.1657882-1-ismailtarim7@gmail.com>

On Mon, Sep 07, 2026 at 08:18:42PM +0300, Ismail Tarim wrote:
> Hi,
> 
> On an ASUS Vivobook K3605ZV (Alder Lake-P, UCSI over ACPI), USB-C
> DisplayPort Alt Mode is never established on hot-plug, while attaching
> the cable before boot gives a working display.
> 
> Repeated GET_ALTERNATE_MODES queries for the SOP recipient return two
> different six-byte payloads in exact alternation. Under the record
> layout Linux expects, these produce two distinct driver-visible failure
> modes, but they may well have a single underlying ordering or
> serialisation cause - I describe an alternative reading of the same
> bytes below and I cannot currently decide between them.
> 
> The payload instability is reproducible through UCSI debugfs without a
> patched kernel. I used a kretprobe on ucsi_send_command() only to
> confirm that the CCI data length was 6 on every call.
> 
> 
> System
> ------
> 
>   Machine        ASUSTeK Vivobook_ASUSLaptop K3605ZV_K3605ZV
>   BIOS           K3605ZV.317, 05/12/2026
>   CPU            Intel Core i7-12650H (Alder Lake-P)
>   Kernel         7.2.3 (Arch), CONFIG_TYPEC_UCSI=m, CONFIG_UCSI_ACPI=m,
>                  CONFIG_TYPEC_DP_ALTMODE=m
>   UCSI transport ucsi_acpi, platform device USBC000:00
>   Type-C port    port0, data role host, bound to usb3-port3,
>                  usb2-port1 and usb4_port1 (connector_ops [thunderbolt])
>   Display sink   Gigabyte M27UA (3840x2160). Connected with a cable
>                  whose DisplayPort end plugs into the monitor and whose
>                  USB-C end plugs into the laptop, so the laptop is the
>                  DP source over USB-C.
>   External DRM   all on the Intel iGPU (card1: DP-1, DP-2, HDMI-A-1)
> 
> Loaded Type-C modules: typec, typec_ucsi, ucsi_acpi, typec_displayport,
> roles, thunderbolt. I can supply GET_CAPABILITY output or anything else
> on request.
> 
> 
> Symptom
> -------
> 
> Hot-plugging the USB-C cable never brings up DP-1: the connector stays
> "disconnected" with a 0-byte EDID and typec_displayport binds to
> nothing.
> 
> In a controlled test, attaching the same cable before boot resulted in
> a working 3840x2160 display. Separately, 71 retained boot journals
> report DP-1 connected; those historical records do not by themselves
> establish the attachment sequence for each boot.
> 
> 
> Observation 1: the SOP payload alternates between two values
> ------------------------------------------------------------
> 
> Issuing the same GET_ALTERNATE_MODES(recipient=SOP, connector=1,
> offset=0) repeatedly through /sys/kernel/debug/usb/ucsi/USBC000:00/
> returns two payloads in strict alternation. 40 reads per inter-call
> spacing, 120 reads in one continuous run, zero deviation:
> 
>   back-to-back : ABABABABABABABABABABABABABABABABABABABAB
>   200 ms apart : ABABABABABABABABABABABABABABABABABABABAB
>   1 s apart    : ABABABABABABABABABABABABABABABABABABABAB
> 
>   A = 01 ff 00 00 01 ff
>   B = 05 04 00 00 01 ff
> 
> Only bytes 0..1 differ; bytes 2..5 are identical. Every one of the 120
> calls returned a CCI data length of 6.
> 
> The corresponding query with recipient=CON returned one identical
> six-byte response in 40 reads. So the alternation was not observed in
> this same-sized control, though that does not by itself locate the
> fault between the PPM and the ACPI transport.
> 
> Limitation of the spacing test: the response stays locked to
> transaction parity across the tested 0-1 s inter-call intervals, which
> makes a simple wall-clock or probabilistic race less likely. It does
> NOT distinguish PPM payload state from a deterministic
> completion/ACK/MESSAGE_IN ordering problem, because those delays occur
> after ucsi_send_command() has already read MESSAGE_IN. Testing that
> boundary would need a delay between command completion and
> read_message_in(), or two reads of MESSAGE_IN after a single
> completion. Also, the three blocks were consecutive and of even length,
> so they are effectively one 120-call sequence rather than three
> independent phase trials.
> 
> The second value is not constant across attachments: in an attach
> session five minutes earlier it was 0a 00 00 00 01 ff instead of
> 05 04 00 00 01 ff. It was stable within each session.
> 
> 
> Observation 2: two readings of the same bytes
> ---------------------------------------------
> 
> Parsed as the packed record Linux uses,
> struct ucsi_altmode { u16 svid; u32 mid; } __packed :
> 
>   A -> svid=0xff01  mid=0xff010000
>   B -> svid=0x0405  mid=0xff010000
>   (earlier session) -> svid=0x000a  mid=0xff010000
> 
> so the SVID alternates and the MID is constant but useless as a DP
> capability VDO.
> 
> Parsed with the two members in the opposite order, { u32 mid; u16 svid }:
> 
>   A -> mid=0x0000ff01  svid=0xff01
>   B -> mid=0x00000405  svid=0xff01
>   (earlier session) -> mid=0x0000000a  svid=0xff01
> 
> Under that reading the SVID is 0xff01 in every payload I have ever
> captured, and it is the MID that alternates. 0x00000405 decodes as a
> plausible DP sink capability: UFP_D capable, DP v1.3 signalling, UFP_D
> pin assignment C. 0x0000ff01 looks instead like the SVID duplicated
> into the MID slot.
> 
> I cannot decide between these. The CON record is unambiguously in the
> Linux/UCSI order (reading it reversed yields svid=0x0000, i.e. an
> end-of-list marker, which is nonsense given it is the DP mode), so the
> producer is at least inconsistent between recipients under the reversed
> hypothesis. Bytes past the CCI length of 6 are not part of the response
> and cannot disambiguate it.
> 
> 
> Effect on the driver
> --------------------
> 
> ucsi_register_altmodes() registers whichever payload it happened to
> read, and the SOP early-out
> 
>   if (recipient == UCSI_RECIPIENT_SOP && con->partner_altmode[0])
>           return 0;
> 
> then prevents any further read for the lifetime of the partner, so the
> first result is latched.
> 
> If the registered SVID is not 0xff01, the Type-C bus match against
> typec_displayport's typec:idFF01 alias never succeeds and
> dp_altmode_probe() is not reached. This is the state after a hot-plug,
> captured before I issued any debugfs command, so it is not an artefact
> of my probing:
> 
>   /sys/class/typec/port0-partner/port0-partner.0/svid   = 0405
>   /sys/class/typec/port0-partner/port0-partner.0/vdo    = 0xff010000
>   /sys/class/typec/port0-partner/port0-partner.0/driver : absent
>   /sys/class/drm/card1-DP-1/status                      : disconnected
> 
> If instead the payload with svid=0xff01 is registered, the driver
> matches but dp_altmode_probe() rejects it. With port0.0/vdo =
> 0x001c1c46 and the partner VDO as Linux parses it (0xff010000, whose
> raw DFP_D pin-assignment field bits 15:8 = 0x00 and raw UFP_D
> pin-assignment field bits 23:16 = 0x01, with the receptacle bit clear,
> giving Linux's helper results UFP_D=0x00 and DFP_D=0x01):
> 
>   DP_CAP_PIN_ASSIGN_DFP_D(0x001c1c46) & DP_CAP_PIN_ASSIGN_UFP_D(0xff010000)
>         = 0x1c & 0x00 = 0
>   DP_CAP_PIN_ASSIGN_UFP_D(0x001c1c46) & DP_CAP_PIN_ASSIGN_DFP_D(0xff010000)
>         = 0x1c & 0x01 = 0
>   -> -ENODEV
> 
> So neither of the two alternating payloads leads to a bound DP alt
> mode.
> 
> For reference, the raw CON response to the same command is
> 
>   01 ff 06 1c 00 00        len=6
> 
> and ucsi_register_displayport() turns mid=0x00001c06 into
> 0x1c06 | DP_CAP_RECEPTACLE | 0x1c<<8 | 0x1c<<16 = 0x001c1c46, which is
> what port0.0/vdo reads. That sanity-checks my byte decoding and shows
> how the current kernel transforms the CON record; it does not establish
> that the SOP producer uses the same member ordering.
> 
> 
> Other observations
> ------------------
> 
>   * The PPM returned one six-byte record at offset 0 and zero length at
>     offsets 1 and 2.
> 
>   * After a hot-plug, GET_CURRENT_CAM(connector=1) returned 0x01 rather
>     than the 0xff "none" sentinel, while GET_CAM_SUPPORTED returned
>     0x01. Those two are mutually inconsistent under Linux's zero-based
>     index interpretation. I mention it only as a further sign that this
>     PPM's alt-mode reporting is unreliable.
> 
>   * No intel_pmc_mux device can bind on this firmware: neither INTC105C
>     nor the Alder Lake IOM INTC1079 is present in ACPI, and
>     /sys/class/typec_mux is empty. I therefore do not know whether
>     correcting the alt-mode registration alone would be enough to light
>     the display, or whether the PPM would also have to be driven into
>     the CAM.
> 
> 
> Regression status: not established
> ----------------------------------
> 
> The user-visible history is that hot-plug used to work, so I looked for
> a kernel change.
> 
> The relevant struct ucsi_altmode layout and the dp_altmode_probe()
> rejection logic are unchanged across every kernel this machine has run
> (v7.0.5 through v7.2.3), and I found no direct change to the UCSI
> alt-mode read path between 7.1.9 and 7.2.3 - the changes there are the
> msg_out/write_message_out plumbing, an unregister refactor and lockdep
> annotations.
> 
> This is only a source audit. Indirect timing or ordering changes
> elsewhere, and firmware state, remain possible. I have not yet run the
> same unplugged-boot-then-hot-plug procedure under an older kernel, so I
> am not claiming a regression and I have not copied
> regressions@lists.linux.dev.
> 
> 
> Reproduction
> ------------
> 
> With the cable attached, as root:
> 
>   D=/sys/kernel/debug/usb/ucsi/USBC000:00
>   for i in $(seq 1 10); do
>       echo 0x101000c > $D/command   # GET_ALTERNATE_MODES, SOP, con 1, off 0
>       cat $D/response
>   done
> 
> The responses alternate. Substituting 0x100000c (recipient CON) gives a
> stable response. The debugfs "status" file only records negative
> errors, so the positive return value (the data length) is not exposed
> there; I used a kretprobe on ucsi_send_command() for that.
> 
> 
> Questions
> ---------
> 
>   1. Has an SOP-only member ordering, or an alternating offset-0
>      response, been seen from other UCSI PPMs? Is there a reading of
>      these six bytes that I have missed?
> 
>   2. Which capture would best distinguish PPM payload corruption from
>      an ACPI completion/MESSAGE_IN ordering problem: a debug patch that
>      delays or repeats read_message_in() after a single completion, a
>      PD Discover Modes trace from an analyser, or data from the working
>      boot-attached case?
> 
>   3. If the correct partner record can be established independently,
>      would a DMI-scoped fixup in ucsi_acpi's sync_control be the right
>      layer, or should this stay a firmware-only issue?
> 
> I have the machine available and am happy to run debug patches or
> further captures.

Thanks for the report. This is yet another EC/PPM firmware bug. Before
looking into quirks please check these steps:

- Unload the ucsi driver (modprobe -r ucsi_acpi) before plugging the
  cable. This way we can make sure that the OS communication with the
  PPM is not confusing/delaying the firmware components repsosible of
  muxing etc.

- If you think that this may be a regression, you need to test much
  earlier kernels. Start at least from v6. If you find a kernel that
  works, you need to use git bisect to find the commit that causes the
  issue.

- You should also verify the firmware history - check the changelogs,
  and downgrade if needed.

- Contact ASUS! This is quite important.

We may be able make things look okay in the OS by using for example
DMI quirk, but it would still leave the muxes in wrong state,
and your screen dark.

Thanks,

-- 
heikki
