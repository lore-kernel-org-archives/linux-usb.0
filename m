Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E337F742
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785653255; cv=none; b=lQDv6s2oys9A+v06amnnBRaI+Vm1hkYyCkw7Iz0E5EJdkTyNSL9PuUJsyLSCAZpMBN/RQcVZiBmvufuabP0d9DVMzD+fCpv/451iR7C+0Q7djnMGTiX9grvboRelyUE0yBccNMcNpo5IpAnKiqDimhV021HPYv4mbdoJojTQxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785653255; c=relaxed/simple;
	bh=9iOkdNpMfmmt+OY1OU4ti4um/gx1Z9ZwrrWt68seYhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhCCgCjgeMDaQ3q9oJ5gO2N86n2VxCILpZQ/EnigI4dpe63wyiXcUOVR0C/5c5NM8PTaxyxLZEUT/NwNljZNqCVmyzmk4njkaD1Z8VnAyPYtTNKZqiuSfKrCNcKPPgw3ALzGjOo3LPZr1+be3iv+3jfy/DJqRj8JjW3GQZ2Q/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drOEegSk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drOEegSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785653252; x=1817189252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iOkdNpMfmmt+OY1OU4ti4um/gx1Z9ZwrrWt68seYhk=;
  b=drOEegSkby8VyHLs5Pq+kGecDgNuQqa8gFYAI776bJbEIKcMn174GuM6
   O5lzjyEej+IY0/13iQNWfpjrUz4ScPU9GpBOHJPYzFy83iW2G5wAzNnmX
   JM+D9nwG4AR3VvCEEzuet4QiXDKPQb98dfI9cHa6/nJDinGabsPfvNzQv
   UdFw6MKbbe7VRJ+Onz4Aa1YqDOUdH8/mSOklh6fPzt+4/C6pfqzjpbb50
   ee20XEZlB9DogY6Q0MiZttSkwA1FmKk6C190LmIvnaDiwFQM04fGryPlP
   MZk7/EdsZhKuqf9AQs6u7VEMfMOZOvHJS0eQNQ+omimhVHblk3cGqhIG2
   Q==;
X-CSE-ConnectionGUID: 7I5znS9PSaOmchF/inLgnQ==
X-CSE-MsgGUID: Rof2Lr+yRZucMhnghrpgNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="85990195"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="85990195"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 23:47:31 -0700
X-CSE-ConnectionGUID: gF8iSAe/R0OVb5Rc3wbWOQ==
X-CSE-MsgGUID: t74S5D/oTK6DeG1YGWtwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="259694278"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2026 23:47:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3D5D999; Sun, 02 Aug 2026 08:47:29 +0200 (CEST)
Date: Sun, 2 Aug 2026 08:47:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bernd Behler <bernd@behler.me>
Cc: linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: Apple Studio Display =?utf-8?Q?=282026?=
 =?utf-8?Q?=2C_Thunderbolt_5=29_?= =?utf-8?B?4oCU?= DP tunnel torn down every
 few minutes on Intel TB4 host
Message-ID: <20260802064729.GL20844@black.igk.intel.com>
References: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>

Hi,

Great report!

On Sat, Aug 01, 2026 at 06:05:34PM +0200, Bernd Behler wrote:
> Summary
> -------
> 
> An Apple Studio Display (2026 model, Thunderbolt 5) connected to an Intel
> Arrow Lake-H host with integrated Thunderbolt 4 loses its DisplayPort
> tunnel every 2-5 minutes under normal desktop use. The screen goes black
> for ~2 s, occasionally for several minutes. The Thunderbolt link itself,
> the tunnelled USB3 and the tunnelled PCIe stay up throughout -- only the
> DP tunnels are torn down and re-established.
> 
> The previous Studio Display model (2022, Thunderbolt 3) on the same host,
> same port, same cable, same kernel does not show the problem.
> 
> Hardware
> --------
> 
> Host:        Intel NUC 15 Pro "Cyber Canyon" (NUC15CRKU5), Core Ultra 5 225H
> Host TB:     integrated, 8086:7ec2 / 8086:7ec3, host router generation 4
> GPU:         Intel Arc 130T/140T (8086:7d51), i915
> Kernel:      7.1.4-arch1-1 (Arch Linux)
> Compositor:  Hyprland / aquamarine (Wayland, atomic KMS)
> 
> Failing display -- Apple Studio Display 2026
> - EDID: manufacturer APP, model 44614, made week 1 of 2026
> - TB device 0x8025, generation 4, 20.0 Gb/s x 2 lanes, NVM 64.81
> - contains an Intel JHL9480 (Barlow Ridge, TB5) -- appears as
>   8086:5786 PCIe switch behind the tunnel
> - firmware updated via macOS immediately before these traces; no change
> 
> Working reference -- Apple Studio Display 2022
> - EDID: manufacturer APP, model 44602, made week 7 of 2022
> - TB device 0x801f, generation 3, NVM 67.0
> 
> Symptom
> -------
> 
> Reproducible within minutes by scrolling bright web pages. Frequency under
> load is one event every 2-5 minutes. Recovery is usually ~2 s; three events
> during the session took between 2 and 3 minutes.
> 
> Only the Studio Display blanks. A second monitor on HDMI is unaffected.
> 
> Trace
> -----
> 
> drm.debug=0x104 plus "module thunderbolt +p". A single event:
> 
>   i915 0000:00:02.0: [drm:xelpdp_pica_irq_handler] pica hotplug event received,
>                      stat 0x0000000c, pins 0x00001800, long 0x00001800
>   i915 0000:00:02.0: [drm:intel_dp_hpd_pulse] got hpd irq on
>                      [ENCODER:521:DDI TC3/PHY TC3] - long
>   i915 0000:00:02.0: [drm:drm_dp_dpcd_access] AUX USBC3/DDI TC3/PHY TC3:
>                      Too many retries, giving up. First error: -6
>   i915 0000:00:02.0: [drm:intel_dp_hpd_pulse] got hpd irq on
>                      [ENCODER:549:DDI TC4/PHY TC4] - long
>   i915 0000:00:02.0: [drm:intel_tc_port_reset_mode] Port G/TC#4:
>                      TC port mode reset (disconnected -> tbt-alt)
>   i915 0000:00:02.0: [drm:drm_dp_tunnel_destroy] [DPTUN 1:1:5] destroying
>   i915 0000:00:02.0: [drm:drm_dp_tunnel_destroy] [DPTUN 1:1:6] destroying
> 
> Thunderbolt side of the same event:
> 
>   thunderbolt 0000:00:0d.3: acking hot unplug event on 1:11
>   thunderbolt 0000:00:0d.3: 1:11: DP OUT resource unavailable: adapter unplug
>   thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): deactivating
>   thunderbolt 0000:00:0d.3: acking hot unplug event on 1:12
>   thunderbolt 0000:00:0d.3: deactivating Video path from 0:5 to 1:11
>   thunderbolt 0000:00:0d.3: 0:5: detached from bandwidth group 1
>   thunderbolt 0000:00:0d.3: 0: released DP resource for port 5
>   thunderbolt 0000:00:0d.3: 0:6 <-> 1:12 (DP): DPRX read timeout
> 
> The "hot unplug event" originates from the device router; the host acks it
> and tears the tunnels down. "DPRX read timeout" recurs on every event.
> 
> In one earlier trace the teardown was preceded by a bandwidth-allocation
> request from the display asking for zero:
> 
>   thunderbolt 0000:00:0d.3: acking DP_BW (0x20) notification on 0
>   thunderbolt 0000:00:0d.3: 0:6: requested bandwidth 0 Mb/s
>   thunderbolt 0000:00:0d.3: 0:6 <-> 1:12 (DP): bandwidth allocation
> changed to 0/0 Mb/s
>   thunderbolt 0000:00:0d.3: acking hot unplug event on 1:12
> 
> Later events start directly at the active adapter 1:11 with no such
> prelude, also with bw_alloc_mode=N.
> 
> Possibly relevant: tunnel topology differs between the two models
> -----------------------------------------------------------------
> 
> Both displays expose a 2x1 tiled EDID (2560x2880 per tile).
> 
> 2026 model -- i915 drives the full 5120x2880 through a single tunnel at
> HBR3; the second DP tunnel exists but never carries a stream:
> 
>   0:5 <-> 1:11 (DP): consumed bandwidth 0/22500 Mb/s      <- carries all of 5K
>   0:6 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s          <- idle
>   port_clock=810000, lane_count=4
> 
> 2022 model -- driven as two real tiles, both tunnels carrying video:
> 
>   0:5 <-> 1:10 (DP): consumed bandwidth 0/17000 Mb/s
>   0:6 <-> 1:11 (DP): estimated bandwidth 19000 Mb/s
>   port_clock=540000, lane_count=4
> 
> The idle second tunnel of the 2026 model was the adapter that unplugged
> first in the earliest traces.
> 
> Link maximum on this host is 36000 Mb/s. The tunnelled USB3 grows to
> 14738 Mb/s when DP releases bandwidth.
> 
> Ruled out
> ---------
> 
> Each of these was tested; the trace signature stayed byte-for-byte
> identical.
> 
> - Display firmware update (performed via macOS; now NVM 64.81)
> - thunderbolt.clx=0 -- link low-power states
> - thunderbolt.bw_alloc_mode=0 -- DP bandwidth allocation mode
> - Thunderbolt/PCIe runtime PM (power/control=on on the NHI controllers,
>   the tunnel PCIe ports and all TB devices). This did eliminate a
>   separate, rarer failure in which the whole TB link dropped for ~8 s
>   including USB -- but has no effect on the DP-only events described here.
> - Cable: swapped the 2026 display's cable for the 2022 display's TB3
>   cable. Link still negotiates generation 4 at 20 Gb/s x 2; failure
>   unchanged.
> - Bandwidth / link training: AUX dies outright (-ENXIO), no retrain is
>   ever attempted.
> - PSR / Panel Replay: "Sink support: PSR = no, Panel Replay = no".
> 
> Not yet tested: driving the 2026 display as two explicit tiles to mirror
> the 2022 model's working configuration.
> 
> Questions
> ---------
> 
> 1. Is the host expected to tear down both DP tunnels when one DP OUT
>    adapter signals unplug, or could the teardown be scoped to the
>    affected adapter?

It should tear down the tunnel at that point.

> 2. Would a debounce or retry be appropriate before releasing the DP
>    resource, given the adapter reappears ~2 s later?

I don't think that is good solution. We should get bottom of this so adding
Imre Deak to take a look from DP side. Do you have full dmesg with the
debugging enabled available somewhere?

> 3. Is the recurring "DPRX read timeout" on this device a known interop
>    issue? dprx_timeout is at its default of 12000 ms here.

Those happen until GFX reads the capabilites through the DP tunnel - its
normal (well unless it times out completely in which case it tears down the
DP tunnel as well but I don't think that happens here).

> Happy to test patches or collect further traces.

We also used to have similar issue, related to MST register access that
triggered DP OUT unplug but I think that's already worked around in the
graphics side for Meteor Lake.

Can you also repro this so that you enable tracing of the TB driver and
provide the output (alongside with the full dmesg so we can compare):

  # tbtrace enable

  <repro the issue>

  # tbrace disable
  # tbtrace dump -vv > trace.out

You can find tbrace here [1]:

[1] https://github.com/intel/tbtools
