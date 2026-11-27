Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758035;
	b=yaBqtSApuAzPSNtv+ThphyhPshWlkjI1JRieAyLmFOYf0mUitOQKKZjJRxr6mcPOoIJ3
	 Yc7tMoSk/z+uCEcawQct9EXiSE07jNC9YCekuUQErt32ieY4/TUFY2SisRFWaV6qDlkOf
	 FevG/g3s5d1vBnYzq+aHGvAali2Jj0O1T+QiJDZkglkKuUt3VXlni3bInON/48Vm+/m0b
	 fPgIU0If7iAoJP5W+8o9yC9VpxztqO/J8lolL3sBw2bnj30+7QwPYYthRXzL8Lrywt2DD
	 EqIdB8nW5a8mlh0imjHcWjRGcoWUCCANbdzpG1XACUVh1oUDX2THXcYyXSporv9KT1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=cpkrvof/Do788JmubNzuB9S2+5CxbELpV/vygj+0/PM=;
	b=rNzPeVRVsIPN3N5n6YxOewfwCm5il4d420T40HzDnzJh1jVBgA7m+2xk5SYIewcnmcC2
	 mTCv8/7HqEj4j2l/v4BIkeFcn6OheBGL8Xq2sEj7IJO1Mkl6m5snjBEADN8y8AXJFSmlo
	 l8/P+0cD/1lKzbn8Hbgkhw3RHK9Tta3UMMc/bImpiZW/qaNzqNgNrESWwgSfXpqopMclx
	 kGcVsGOoa1TrJQ8X5RmQ8wmWAXlwCHComJbsN8rw8EVi4j6yzGk8Zq63ihbtJ6780UyFQ
	 SQD+7e8CVxdPO5H/EBD+QPph7uGiNck3oBjiecT48Jb6Q6wIzoG39eQWyPxn26AHJLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmIthgyB;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA2606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CmIthgyB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795758034; x=1827294034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=t8JP+yA8/LMNJX+FWrbHSe3M4jPY8IFfexswCoy5kSM=;
  b=CmIthgyBqzj/9FATATAj5vmjTJGUvluFIgqvXPgrD53SgQHuEs+7FyZN
   WGU2u/Na+5Af4db6dhxglvNo2TBHZEdKMfwfMOEDMDhyTR6wb52swVpN2
   i7h+5vVoWMlX6YkMAVKYNnR/JQa3/u5AwnOH+6Lz9JN7gH2zChQe0I1IV
   1k4PzQnJCOKVm98bVQGmL4keHLLAVJabwvDgDON3j4HNP4LRGUwP8aGep
   UGH/o7euEMl7ciBPVyDy6izw9USFkNEgkfV6fVmeyKiY1rqHSsFVpw8OD
   KHXc2gB1TqUDFhUszSLfjDXktS/fpKjr6FR1I3KtPNwcztP0TMxQoU1sY
   A==;
X-CSE-ConnectionGUID: 3YMUyD2jSFeZBjW0Ga05Ww==
X-CSE-MsgGUID: 2UdBDGSITuu0zIq3/t5dYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4568073"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4568073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:40:34 -0800
X-CSE-ConnectionGUID: JaaFkVBiTHabN0i8sKLjPg==
X-CSE-MsgGUID: nz8/9JoQTOGOVNT6J5mARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12353461"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2026 21:40:32 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 65B1B98; Fri, 27 Nov 2026 06:40:31 +0100 (CET)
Date: Fri, 27 Nov 2026 06:40:31 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: bin luo <luob87709@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] thunderbolt: request work may outlive control channel
 teardown
Message-ID: <20261127054031.GD953667@black.igk.intel.com>
References: <20261125130000.475-1-luob87709@gmail.com>
 <20261125140450.GF191152@black.igk.intel.com>
 <CALa7h7Gx9bFLg8YTWNu6Wo_CHz5EKV0F4zJDxGXux1W9tar+sA@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALa7h7Gx9bFLg8YTWNu6Wo_CHz5EKV0F4zJDxGXux1W9tar+sA@mail.gmail.com>

Hi,

On Thu, Nov 26, 2026 at 01:24:49PM +0800, bin luo wrote:
> 
> 
>     Hi Mika,
> 
>     Thank you for looking at the report.
> 
>     To be upfront, I do not currently have two physical Thunderbolt/USB4
>     hosts available to run a live Host-to-Host test myself, so the steps
>     below are derived from the driver code rather than an observed run on
>     physical hardware.

Thanks for the steps.

>     Target hardware setup
>     ---------------------
>     - Host A (DUT): Linux host with a Thunderbolt 3/4 or USB4 host
>       controller (NHI), running v7.4-rc1+ with CONFIG_USB4=y,
>       CONFIG_USB4_NET=m (or y, module thunderbolt_net), CONFIG_KASAN=y,
>       CONFIG_KASAN_GENERIC=y, and CONFIG_DEBUG_LIST=y.
>     - Host B (peer): Second Thunderbolt 3/4 or USB4 host supporting
>       Inter-Domain (XDomain) connections (Linux with thunderbolt_net works
>       well to generate continuous XDomain traffic).
>     - Cable: Direct Thunderbolt 3/4 or USB4 cable connecting a USB4/TB
>       Type-C port on Host A to a USB4/TB Type-C port on Host B.
> 
>     1. Confirm the XDomain link is up on Host A
>     -------------------------------------------
>     After connecting the cable between Host A and Host B:
>     - Check sysfs for the domain and XDomain peer device:
>         ls -l /sys/bus/thunderbolt/devices/
>       (Expect domainN and an XDomain device such as 0-1 / 0-3 with
>       device_name, vendor_name, and unique_id attributes.)
>     - Check kernel log and thunderbolt-net interface:
>         dmesg | grep -i thunderbolt
>         ip link show thunderbolt0
>     - Optional: enable dynamic debug to observe XDomain requests and
>       control-channel stop:
>         echo 'file drivers/thunderbolt/xdomain.c +p' > \
>           /sys/kernel/debug/dynamic_debug/control
>         echo 'file drivers/thunderbolt/ctl.c +p' > \
>           /sys/kernel/debug/dynamic_debug/control
> 
>     2. Trigger sequence on real hardware
>     ------------------------------------
>     The race is between an asynchronous no-response XDomain reply
>     (__tb_xdomain_response() -> tb_cfg_request() -> schedule_work(&req->work)
>     on system_wq) and NHI removal (nhi_pci_do_remove() -> tb_domain_remove()
>     -> tb_ctl_stop() -> device_unregister(&tb->dev) -> tb_domain_release()
>     -> tb_ctl_free()).
> 
>     Specifically, when Host B sends an XDomain request (either discovery/
>     property/link-state requests handled by tb_xdp_handle_request(), or
>     thunderbolt-net protocol frames answered via tb_xdomain_response() in
>     drivers/net/thunderbolt/main.c):
>     1. tb_xdp_handle_request() calls __tb_xdomain_response(), which calls
>        tb_cfg_request(ctl, req, response_ready, req) with req->response ==
>     NULL.
>     2. tb_cfg_request() enqueues req on ctl->request_queue, transmits the
>        frame via tb_ctl_tx(), schedules req->work on system_wq, and returns.
>     3. tb_xdp_handle_request() immediately calls tb_domain_put(tb) and exits
>        while req->work is still queued on system_wq with a raw req->ctl
>     pointer.
>     4. Concurrently on Host A, trigger NHI driver unbind (replace BDF with
>        the NHI PCI device from `lspci -nn | grep -iE 'thunderbolt|usb4|nhi'`):
>          echo 0000:00:0d.2 > /sys/bus/pci/drivers/thunderbolt/unbind
>        (and rebind in a loop while Host B continuously toggles thunderbolt0
>        or sends XDomain protocol requests, e.g. `ip link set thunderbolt0
>        down/up` on Host B to drive TBIP_LOGIN/TBIP_LOGOUT packets handled by
>        tbnet_login_response()/tbnet_logout_response() via tb_xdomain_response

This already is something real users don't do and this puts the priority
pretty low on my todo list unfortunately.
