Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006388;
	b=BgcuviPqGDGDXCBUtaOimk0r4xPspPao6sYL37TE+Ksu6afr2aZ6+h2DD+OMA7USJR8g
	 V1Gq4t48Tb/UqccOmGFAZQZAkP03IoKjZGKAPIdB2GqmD/YybL7fwcDw3HhBe9uQDGKCh
	 CM1xu+cBGNKTpg4j9k8gpvEMm8mlZiVPN/BJK9J0IcdwPmXgAAkwdF+2NBIAPjItkAGrI
	 GTbN/c1k+aRbWEWNa14E1PZLu2/hCiP3WjV0ELIKIrO/OaJbTAgocVjOfXdb0k9rfiITV
	 RbOhhGGMcTlcu/HeelmcmzCXRjk6OdqYcEGLuSc3D3uCBQ5vxOTd9OWbolNVyOFN/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006388;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kXvR/48TEwacaPIxe8TK/ZLtytI0WGINfn2XRqpsMNU=;
	b=LHGEmJriZCXl9lILXfGL738seYTFTS+6oIgWwf29U+3xN+ksNMkEwj6+9822c3GNlrrL
	 Ep/RbEPh9VfMuWo1uMW/5PrPBV4SMe4jeSJSyORapO2KSVGY7aHKafIuxHF4+70M8kamZ
	 uveWyjfQ1uPEndtM77Jo7EfQf+DmO/J2+jcCelgDmh2U+2xqtZwnPfy8FtqgikrS7/yw8
	 veg2sAZOIf9D2J9PlkruSl8Qgfql2FWLKCi59TJH7xKb7OEv902vfD0JnN0jB1d2mpV3M
	 Ngb+ZAXye63LODapoGcDmIRhYjJjHwsnbfnqv/jy7LF4zWUf8vwyHzi+s9MFr8djDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCk5ixGy;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E2606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fCk5ixGy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006388; x=1824542388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFY1Ojde2n8I+2FhglS4JNtlUMWnmRyi49RZ+bnsBDQ=;
  b=fCk5ixGy8Vpr1fcah4x9++UFCt9gQG3oIdBpL4k3jfd2SJAZBOw3Ke3D
   2fnatCUiH73NsXTfGJRYZogFvSpFNhn7HE31iRwrR+gJvJm7ATu80xAXL
   P3dI3yO0XtexrcJ6vu/MGwkzv68iYQhZn/GwJaVfBHzyyS/CcxujVOkAM
   WKQJ2jr+MBqYRxJ+GU2CgS4CkI1gFrWKcIEUU/znNV100Gx9MGT6SaIYr
   1TRm4+gZdMiwOmrOt+msmEvjf3LebhWX32qxlOYrBwKu178W5j3KEwIws
   7JArGAo5OZXWstoZd09ZTRTApZlgvo6Val8aCyvIfzmZe5+jFuC7+zaL9
   Q==;
X-CSE-ConnectionGUID: 9gORcBA0Q0qaKRovFIU1OA==
X-CSE-MsgGUID: ne5+TU1NTbubHdbnb/cp2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1671655"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1671655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:19:48 -0700
X-CSE-ConnectionGUID: vwGvKukZTgSCknrsUPZj2Q==
X-CSE-MsgGUID: dR8CeGyfRiG4NTYl+YYKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4606149"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2026 02:19:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 78AF399; Mon, 26 Oct 2026 10:19:45 +0100 (CET)
Date: Mon, 26 Oct 2026 10:19:45 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ola Cewers <ola.cewers@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: ucsi_acpi: PPM init fails at boot but succeeds on manual reload;
 DP alt mode cannot be entered
Message-ID: <at8bMW5KYDldhfJp@black.igk.intel.com>
References: <arJcnycZoIhcsPBV@black.igk.intel.com>
 <CANJWS4wk0u3yJMupUUimLiFW9kMLtAUJ0fuV=sGYTk8Uev2W9A@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANJWS4wk0u3yJMupUUimLiFW9kMLtAUJ0fuV=sGYTk8Uev2W9A@mail.gmail.com>

Hi Ola,

Sorry to keep you waiting. I was on vacation.

On Mon, Oct 05, 2026 at 03:44:03AM -0500, Ola Cewers wrote:
> (Resending as plain text; my previous copy was HTML and the list
> rejected it. Sorry for the duplicate.)
> 
> Hi Heikki,
> 
> Thanks for the reply, and sorry it took me so long to answer. My first
> mail never reached the list (it was rejected as HTML). I resent a
> revised version on 15 Sep as a separate thread ("ThinkPad X1 Carbon
> Gen 14: DP reconnect fails with Type-C ports registered; connector
> reset does not recover"), and the explanation below covers that thread
> too. I missed your reply until today.
> 
> On Tue, Sep 22, 2026 at 12:46:55PM +0200, Heikki Krogerus wrote:
> > UCSI should not have any impact on the actual USB Power Delivery (PD)
> > negotiation which is also used with the alternate modes. UCSI is just
> > a status interface with a minimal level of (optional) control. The
> > actual USB PD negotiation is all handled in the firmware on UCSI
> > systems, the USB PD controller firmware of the Embedded Controller
> > (EC) firmware.
> 
> You were right, and part 2 of my report should be withdrawn. The lost
> display after a replug was not caused by UCSI. It was a regression in
> the compositor backend, aquamarine 0.15.0 (Hyprland), tracked as
> hyprwm/aquamarine#386. When a connector goes away, 0.15.0 never
> disables its CRTC in the kernel. Reports in that issue show that on
> Type-C ports the connector then stays disconnected after a replug.
> That version arrived on this machine on 9 September, in the same
> update as kernel 7.2.3. aquamarine 0.15.1 fixes it here.
> 
> I also need to retract one conclusion in my report. I ruled out the
> compositor because it never saw a connected output. The connector did
> stay disconnected, but the failure started in the compositor, which had
> left the old CRTC enabled.
> 
> > Please confirm this by disabling the UCSI driver completely for
> > example by blacklisting it and then reproducing the issue.
> 
> I have not run the blacklist test yet. The closest result I have is
> from today (kernel 7.2.5-3-omarchy, a distro build; aquamarine 0.15.1).
> PPM init had failed at boot and /sys/class/typec was empty, so the UCSI
> driver was loaded but had registered no ports. In that state I did
> three unplug/replug cycles with the lid open, using both USB-C ports
> and two Dell monitors, each on a direct USB-C cable. The display came
> back every time. So the EC re-enters DP alt mode by itself, as you
> described. I can still run the actual blacklist test if that would be
> useful.

Probable not necessary any more then.

> > Please report the issue to Lenovo in any case,
> 
> That report is fwupd/firmware-lenovo#628. I have added a correction
> there as well:
> https://www.google.com/url?q=https://github.com/fwupd/firmware-lenovo/issues/628%23issuecomment-5990786692&source=gmail&ust=1791276243291000&sa=E

Thanks!

> > The other problem, where the ucsi fails to probe, may be solved
> > already with a workaround where the interface is attempted to be
> > detected multiple times instead of failing immediately.
> 
> That would help here. PPM init still fails on 4 of the 6 boots I have
> had on 7.2.5-3-omarchy, either with -EINVAL after "possible UCSI driver
> bug 2" or with -ENODEV. Could you point me to the patch or the tree it
> is in? I am happy to test it on this machine.

It's this one:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2542613815381e090d5036d5751ab5e2fd9f8b07

Br,

-- 
heikki
