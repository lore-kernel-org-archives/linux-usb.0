Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666D368957
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074024; cv=none; b=uRw8EgSkkx3HQ7UxXMJa8A8uHxeR1RcV5cY3FQvGPsV4HX6FAZZBGbyKJHhyayu5P9leatpkpRWMX+1zxMfpEaomhM1g8DYqmqI4ThrLoOwcACHzUAaqCRwAqj76iMnWGIvPT53XVN1UzwauvzxsFAZ7N3NLFpMolcfHIrrJCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074024; c=relaxed/simple;
	bh=XUhsHLXYsJ2x66V7i8b78vMXDJG8ALh3nxpFKV56TjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY6ieLcsoUb4vuVBtfTFzUHUUE+o1uF0LpwLe4FIkjfa38td+B5226/OyuIl72f9ej2gECxMa7zqAhRgHcXtLVxg21T5uh5+AohkI5VTt0pO/lNi/DTy76SgP1/fri0s2PBGbyBmOsZSQL6TgeNHYrUxDKeF9HZXAzhD0bYKz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhF337Ci; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhF337Ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790074022; x=1821610022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XUhsHLXYsJ2x66V7i8b78vMXDJG8ALh3nxpFKV56TjI=;
  b=KhF337CiRc1XMZo6i6PUgR4pTpVo0GX4iPXa6qXhtS4gzzdbhxGFZ/iH
   l9f/g986GI+nEQoztsBHuHZucZ/3VMWFqJrQ1On0VhjZjxugR3m/9+zUh
   Tds0xBzRxQDLLrJdmj4RY4FFa1meGvgegtxjx32LuGaFthx7qljRsM3kZ
   NSqqDob9DOIiImz7TCoQK+vGjNBWoC9LeCUYaQJjU7+FW/6/rtSNfKP90
   QnwdPxkwpCTBJcUKQx/zgcI07G3snRKJqsw27sNEJ9MxR8y29MQxHCa/y
   99r0cvXvfYo5ZR+pd3Ve5RH9rpHZlt8tXXf3IdUaFpfdy3+opq8kio6UF
   g==;
X-CSE-ConnectionGUID: y6s4FhxOTvqAz1ma7ZzkKQ==
X-CSE-MsgGUID: VTXpeMtLR6i3ig8TBZ3jVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101253150"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="101253150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 03:47:01 -0700
X-CSE-ConnectionGUID: i9OlR80vR06UTiaBXB0qtw==
X-CSE-MsgGUID: Pi2J+XfIQwuLP5AU0lUfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="272278650"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2026 03:47:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CA61599; Tue, 22 Sep 2026 12:46:55 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:46:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ola Cewers <ola.cewers@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: ucsi_acpi: PPM init fails at boot but succeeds on manual reload;
 DP alt mode cannot be entered
Message-ID: <arJcnycZoIhcsPBV@black.igk.intel.com>
References: <CANJWS4xAUTD1Beq_0YBN_OecWr5yOz4L6cgmxYA5Ascbm9Lw-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANJWS4xAUTD1Beq_0YBN_OecWr5yOz4L6cgmxYA5Ascbm9Lw-w@mail.gmail.com>

Hi,

On Thu, Sep 10, 2026 at 02:07:55AM -0700, Ola Cewers wrote:
> Hi,
> 
> Two related observations on a Panther Lake ThinkPad where UCSI never comes
> up at boot,
> with the practical result that an external USB-C monitor cannot be
> re-attached without
> rebooting. I am reporting the driver-side aspects here and have taken the
> firmware-side
> defects to the vendor separately. To be clear up front: I am not asking for
> anything about
> the duplicate altmodes this firmware reports -
> ucsi_dump_duplicate_altmode() already skips
> them and points at the BIOS vendor, which I think is the right call and
> which I have acted
> on.

UCSI should not have any impact on the actual USB Power Delivery (PD)
negotiation which is also used with the alternate modes. UCSI is just
a status interface with a minimal level of (optional) control. The
actual USB PD negotiation is all handled in the firmware on UCSI
systems, the USB PD controller firmware of the Embedded Controller
(EC) firmware.

Please confirm this by disabling the UCSI driver completely for
example by blacklisting it and then reproducing the issue.

        echo "blacklist ucsi_acpi" > /etc/modprobe.d/ucsi.conf

Please report the issue to Lenovo in any case,

The other problem, where the ucsi fails to probe, may be solved
already with a workaround where the interface is attempted to be
detected multiple times instead of failing immediately.

Thanks,

> System
> ------
> Model Lenovo ThinkPad X1 Carbon Gen 14 (21V7CTO1WW)
> CPU Intel Core Ultra X7 368H (Panther Lake)
> BIOS N4OET51W (1.14), 07/01/2026
> EC firmware 1.11
> System firmware 0.1.21 (per fwupd; latest offered, no update available)
> Kernel 7.2.3-arch1-3 x86_64, Arch Linux
> External display Dell U2722DE, direct USB-C cable, DP alt mode, no dock
> 
> ACPI: SSDT 0x000000006950D000 000DC8 (v02 LENOVO UcsiTabl 00001000 INTL
> 20210930)
> 
> 
> 1. PPM init fails at boot, with a varying errno, but a manual reload
> succeeds
> -----------------------------------------------------------------------------
> 
> Every boot fails, and not always the same way:
> 
> Sep 09 11:06:12 kernel: ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
> Sep 10 10:20:00 kernel: ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
> Sep 10 10:39:05 kernel: ucsi_acpi USBC000:00: possible UCSI driver bug 2
> Sep 10 10:39:05 kernel: ucsi_acpi USBC000:00: error -EINVAL: PPM init failed
> 
> In each case the failure lands ~2-3 s after the driver binds, and afterwards
> /sys/class/typec/ is empty for the rest of the session: no connectors
> registered, no OS
> control over the Type-C ports.
> 
> On the most recent boot, connector registration visibly starts and is then
> undone - port0
> is created and bound to its USB and USB4 ports one second before init fails:
> 
> Sep 10 10:39:04 kernel: typec port0: bound usb3-port1 (ops connector_ops)
> Sep 10 10:39:04 kernel: typec port0: bound usb2-port1 (ops connector_ops)
> Sep 10 10:39:04 kernel: typec port0: bound usb4_port1 (ops connector_ops
> [thunderbolt])
> Sep 10 10:39:05 kernel: ucsi_acpi USBC000:00: possible UCSI driver bug 2
> Sep 10 10:39:05 kernel: ucsi_acpi USBC000:00: error -EINVAL: PPM init failed
> 
> I report that sequence without interpreting it; /sys/class/typec/ is empty
> afterwards.
> 
> Unloading and reloading the module once userspace is up succeeded both
> times I have tried
> it, and registers all three connectors plus the attached partner:
> 
> # modprobe -r ucsi_acpi && modprobe ucsi_acpi
> # ls /sys/class/typec/
> port0 port1 port2 port2-partner
> 
> So the PPM is functional; only the boot-time attempt fails. The differing
> errno across
> otherwise identical boots, and the fact that a later attempt works, both
> point at a
> readiness/timing problem rather than a fixed defect - the controller does
> not appear to be
> able to answer yet at probe time.
> 
> What the `2` means, and why I think a retry would help
> ------------------------------------------------------
> 
> The `2` is the error code the PPM returned. With UCSI_ERROR_INVALID_CON_NUM
> defined as
> BIT(1) = 2 in ucsi.h, the PPM answered "invalid connector number", which
> ucsi.c maps to
> -EINVAL:
> 
> case UCSI_ERROR_INVALID_CON_NUM:
> case UCSI_ERROR_UNREGONIZED_CMD:
> case UCSI_ERROR_INVALID_CMD_ARGUMENT:
> dev_err(ucsi->dev, "possible UCSI driver bug %u\n", error);
> return -EINVAL;
> 
> As I read ucsi_init_work(), the existing retry path is reached only for
> -EPROBE_DEFER:
> 
> if (ret == -EPROBE_DEFER) {
> if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT) {
> dev_err(ucsi->dev, "PPM init failed, stop trying\n");
> return;
> }
> queue_delayed_work(...);
> }
> 
> Our failures are -ENODEV and -EINVAL, so no retry is attempted at all -
> init is abandoned
> on the first try and the connectors are never registered for the rest of
> the session. Yet a
> manual reload minutes later succeeds, which suggests that on this platform
> these two errnos
> are also transient, and that the PPM is simply not ready to answer at probe
> time.
> 
> Would it be reasonable to retry (or defer) on this platform for these
> errnos as well,
> rather than only -EPROBE_DEFER? If a quirk or a platform match is preferred
> over widening
> the generic path, that would work equally well for us. I am happy to write
> or test a patch -
> the failure reproduces on every boot and the manual reload is a reliable
> positive control,
> so verification is cheap.
> 
> For completeness on the connector-number angle: this same model was
> reported on the
> previous firmware (fwupd/firmware-lenovo#613, System Firmware 0.1.20, EC
> 1.10) to send
> num_connectors with the reserved bit set - 225, masked to 97 by the
> existing bit-7 quirk.
> On 0.1.21 / EC 1.11 that warning no longer appears, but the PPM rejecting a
> connector
> number may well be the same firmware defect in a different guise. When a
> reload succeeds,
> exactly three connectors register and the runtime messages refer to con2
> and con3. I have
> filed the firmware side with the vendor separately.
> 
> Also emitted on each successful reload, in case it is informative:
> 
> ucsi_acpi USBC000:00: GET_CABLE_PROPERTY failed (-95)
> 
> 
> 2. Partner alt mode `active` is read-only, so DP alt mode cannot be entered
> ---------------------------------------------------------------------------
> 
> This is the part with the user-visible consequence, and I would like to
> know whether the
> current behaviour is intended.
> 
> The external monitor works only when it is attached at boot, where the EC
> brings up DP alt
> mode on its own. After any disconnect - replug of the same monitor on the
> same port, or
> resume from s2idle - DisplayPort never comes back, while USB and PD
> renegotiate normally
> (the monitor's hub and Ethernet re-enumerate, and the laptop keeps
> charging). Only a reboot
> with the cable attached restores the display.
> 
> With the driver reloaded while the monitor is attached, the partner
> registers correctly and
> DisplayPort is discovered with a valid capability VDO, but is not active:
> 
> [port2-partner] [port2] (host)
> number_of_alternate_modes = 2 port2.0 svid=8087 active=yes
> port2-partner.0 port2.1 svid=17ef active=yes
> svid = ff01 port2.2 svid=ff01 active=yes
> mode = 1 vdo=0x401c1c46
> vdo = 0x001c0045
> active = no
> description = DisplayPort
> port2-partner.1
> svid = 000c vdo = 0x00000101 active = no
> 
> The VDOs are compatible - partner 0x001c0045 is UFP_D with pin assignments
> C/D/E, host
> 0x401c1c46 is DFP_D with the same pin assignments - and the host side has
> entered DP alt
> mode. The partner has not.
> 
> Trying to enter it from userspace is not possible, because the attribute is
> read-only:
> 
> # ls -l /sys/class/typec/port2-partner/port2-partner.0/active
> -r--r--r-- 1 root root 4096 Sep 10 10:47 .../active
> # echo 1 > /sys/class/typec/port2-partner/port2-partner.0/active
> -bash: .../active: Permission denied (as root; no write handler)
> 
> The host-side altmode `active` is writable (-rw-r--r--) but is already
> `yes`. On the port
> itself only data_role and power_role are writable, and a role swap
> renegotiates the PD
> contract without re-running mode entry.
> 
> So: is it expected that a partner alt mode discovered by the UCSI backend
> cannot be entered
> at all? If Enter Mode is simply not plumbed through for ucsi, that would
> explain why there
> is no recovery path here, and it would make this class of hardware unusable
> for docking
> whenever the EC does not re-enter DP alt mode by itself.
> 
> Reproducer for the display symptom
> ----------------------------------
> 1. Boot with the USB-C monitor connected. Picture works; machine charges.
> 2. Unplug the USB-C cable, wait a few seconds, plug it back into the same
> port.
> 3. USB re-enumerates, charging resumes, /sys/class/power_supply/AC/online =
> 1.
> 4. cat /sys/class/drm/card0-DP-1/status -> disconnected. No picture.
> 5. Reboot with the cable attached restores it.
> 
> Confounders excluded in step 2-4: no -71/EPROTO on the USB side, clean
> re-enumeration,
> charging active, no errors from the xe display driver, and zero failed
> atomic commits in the
> compositor (i.e. userspace never even sees a connected output to try).
> 
> I can provide full dmesg for the affected boots, the complete
> /sys/class/typec tree, and the
> decompiled UcsiTabl SSDT.
> 
> Thanks,
> Ola Cewers

-- 
heikki
