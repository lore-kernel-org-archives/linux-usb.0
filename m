Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9732AD3C
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936016; cv=none; b=JLo9Ek0tNEzOKNQz7CooIb5xkfXGSSxJLP+t18SkGEUDQmRkThHVtv+V8MDdSfhUsgkB6UAE0oUHmu4q2c+Q5j197NdnzdFWQF3z/2OXlZ3SqXPA2ckc+IuGYuYbFAXDd5B1YDvGe8ddZpbwV0uIjXcdtPyfkxpxcCkNstd3UA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936016; c=relaxed/simple;
	bh=5Pa0XqwqgmJo6i0Jbzy0FAKT8mr7rZ+VEG/73tkmUmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrOoaSHKHabRCnPVuUHnaaR3aZQeGMnQZv/mNQDz6GgR9sILIxStUDJMxGgF0NM5cAUmKcfqkxGD8CMGEpneSY2HvZ0I/ZKBZCTSEbXdSoEeO/zyARqfwBZ5njqZ9HGjxXwAnWHYE94mHWJ0s+hwrUw26vD6XffpA56btZVu9oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ho2Lr01C; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ho2Lr01C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783936015; x=1815472015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Pa0XqwqgmJo6i0Jbzy0FAKT8mr7rZ+VEG/73tkmUmU=;
  b=Ho2Lr01CZx/GtPCzy6Rn4pJ84AoyQJFO4F2t6bw57hhv2WOfUzStgdTh
   95zGOA6zQgEkluwUYuq9ssXej/tpUzwWdNcLKhu9jNxEcH0PTZriiMWZd
   d7i+ziVa9f94KddC9MbhlV2IYSraaNS7KizxBcYV6MfcBjsNPtsd4+yiM
   Ni1ES3mVxg6MbWbincAhwQto1iYTJ7BSjPqmkFKjjOqmkKRofa7J3O4OF
   AJ2E+4JzH0TdHtfiuRfJqS6jCL9nWRPc+slfrhJZveVDENypMGB/QGvyz
   om27zpbWnQs+BBU7uvck52K/Q55qw2popI8Rk4vUZ2Tpf+i+W7n9dJ5kM
   Q==;
X-CSE-ConnectionGUID: b76WuXOpRWONfnJhrmx9Mg==
X-CSE-MsgGUID: kv3ZqnvXSDWJRgmSk7g5Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87084772"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87084772"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:46:55 -0700
X-CSE-ConnectionGUID: Yfo9gl0nRTShV4JSD/+ZWA==
X-CSE-MsgGUID: U5yN8zxPTrSB0meZjh6XvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278764222"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 02:46:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 16A3D95; Mon, 13 Jul 2026 11:46:53 +0200 (CEST)
Date: Mon, 13 Jul 2026 12:46:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Trabajos Iafast <trabajosiafast@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: UCSI: no connector change =?utf-8?Q?ev?=
 =?utf-8?Q?ents_for_connector_2_on_Lenovo_Legion_Pro_7_16IAX10H_=28Arrow_L?=
 =?utf-8?B?YWtlLUhYKSDigJQ=?= port functional in Windows
Message-ID: <alS0C6GaKLf0sVpF@kuha>
References: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>

On Fri, Jul 10, 2026 at 06:25:08AM -0500, Trabajos Iafast wrote:
> Hi,
> 
> I'd like to report a UCSI issue on a Lenovo Legion Pro 7 16IAX10H
> (model 83F5), Intel Core Ultra 9 275HX (Arrow Lake-HX), where one of
> the two side-mounted USB-C ports is non-functional under Linux (no DP
> Alt Mode, no data, no hotplug detection), while working fully under
> Windows 11 on the same machine (dual boot).
> 
> System:
> - Kernel: 6.17.0-35-generic (Ubuntu 24.04.4)
> - BIOS/EC: Q7CN78WW (latest, issue also present on Q7CN33WW)
> - USB4 silicon: Intel Gen14, 8087:7ec2, firmware 15.1
> - Secure Boot: disabled
> 
> Symptoms:
> - /sys/class/typec shows port0 and port1. port0 works fully.
> - port1 gets a partner device enumerated at boot (PD 3.0,
>   supports_usb_power_delivery: yes) but number_of_alternate_modes
>   stays 0 and usb_power_delivery_revision reads 0.0.
> - No typec uevents are ever generated for port1 on plug/unplug
>   (verified with udevadm monitor; port0 generates remove/add/change
>   normally).
> - typec port1 never binds to usb4_port3; the "connector" symlink
>   under domain0/0-0/usb4_port3 is missing (port0 <-> usb4_port1
>   binds correctly).
> - dmesg is completely silent: no ucsi/PPM errors at all.
> 
> UCSI debugfs probing (/sys/kernel/debug/usb/ucsi/USBC000:00):
> 
> GET_CAPABILITY:
>   0x01300300012000020000040200000144
>   -> bNumConnectors = 2 (both connectors are exposed to the OS)
> 
> GET_CONNECTOR_STATUS connector 1 (working):
>   0x01300300012000011304b12c405b4000
> GET_CONNECTOR_STATUS connector 2 (broken):
>   0x01300300012000011304b12c405b0000
> 
> The responses are identical except the Connector Status Change
> field: 0x4000 (Connect Change) on connector 1, 0x0000 on connector 2,
> with a monitor attached to both ports. The EC appears to report
> connector 2's status when polled but never raises connection change
> events for it, so the event-driven ucsi driver never processes the
> port. Windows 11 (Microsoft UCSI connection manager, driver
> 10.0.26100.8521) handles the same port without issues, DP Alt Mode
> included.
> 
> Ruled out: BIOS/EC update to latest (Q7CN78WW), EC power drain,
> thunderbolt module reload, PCI remove/rescan of the USB4 NHI,
> ucsi_acpi/typec_ucsi reload (port1 never rebinds), kernels 6.14 and
> 6.17. No retimer firmware available via LVFS for this model.
> 
> Happy to provide acpidump, full sysfs dumps, or test patches.

I'm seeing this mail in my inbox three times?

In any case, like I said before, please contact lenovo. The FW really
has to report the connector changes.

Thanks,

-- 
heikki
