Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C09F425CF5
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235318; cv=none; b=DiWiaG7uzWlmNdMbes/HigseKCaxPLIPEWxJwx1zfZ1bjVJBYA/ca1m/K8OYt+4gNePLUdqHHcDrp6fk3zZ+xWgEgp2nwhNTZ3BfNeiQmUVefJgNL61cFqqpzHoHaFoDDPWlXJMNI6P1lXT/ZjLAKHirqo600l7IrnMA0bQSuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235318; c=relaxed/simple;
	bh=vkA5VUW8c2amS8jZqOghJ0FDg2INbobdk70IN/YkHFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRomIYkLedn49MFoVShA8p44Txn3e4wiCbedzXoZSggkOBhx+aPesq6mmZhkLZ+dgfECm/F2FfU2SFLGGp5akSWkJCBQqsbDnM71kzmOtQmvt0SqsubTRyYmFVUdvbklti6dfPc9Qd5sdD8b+5sti2i7la/WCCPhYNuRtlaprsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShYzT9xW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShYzT9xW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790235317; x=1821771317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkA5VUW8c2amS8jZqOghJ0FDg2INbobdk70IN/YkHFY=;
  b=ShYzT9xW9B8gAYGkWempnBn1pJhMvyLe9ytTNZ2a0AvlPGwNLwtz5gvS
   wKo61nR+BbuKOvpAHUaX2PQf8PgOjX5P+G8AEsL6mHETuzmBZ17r6fVDz
   Lzq5DDH8VkiBfhvFz6saNVRbAfiEUG+ebkC3x97KWNbnoojrifH1CjHwy
   r0RPsTZinyMy+mbTNgu0iPTk4U0UGJ97faTCmAu45k2a5hoBNdKxgdnEn
   9WsUZG6xikSOsQDgZEEPT1Eep9o0E2Gbf8ayC15DskMkZmPTzDl8wxv37
   3zukw9jxDED0FKTU5qgirj17VkfAC73SL4WwYoCiZlH1G2oWV6SJFWX3P
   A==;
X-CSE-ConnectionGUID: r9yAfrGPS6aXh5Ey2PJa2g==
X-CSE-MsgGUID: DBgVe30XSLq/hKv1VecqoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91014726"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91014726"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:35:17 -0700
X-CSE-ConnectionGUID: sqjCK17NTRq8uijMppdLfQ==
X-CSE-MsgGUID: NMD20i85SaWFISbwZiyCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277324135"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2026 00:35:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0DDE899; Thu, 24 Sep 2026 09:35:14 +0200 (CEST)
Date: Thu, 24 Sep 2026 09:35:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Message-ID: <20260924073514.GM106095@black.igk.intel.com>
References: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Thu, Sep 24, 2026 at 07:18:14AM +0000, Kurt Lieber wrote:
> Hi,
> 
> The Anker Prime Thunderbolt 5 dock reconnect-loops on an LG Gram with Meteor Lake unless the thunderbolt module is loaded with clx=0. With the default (clx=Y) the router is found, TMU setup fails with -ENOTCONN, the USB3 and DisplayPort tunnels are aborted, and the router is dropped. That repeats about once a second, including from a cold plug at boot.
> 
> Hardware:
>   Laptop: LG Gram 17Z90S-H.ADB9U1, Intel Core Ultra 7 155H
>   Host router: 0000:00:0d.3 Intel Core Ultra 200 Series Thunderbolt DMA1
>                [8086:7ec3] (rev 10), subsystem [1854:051d]
>   Dock: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)
>         kernel: vendor=0x1ea device=0x83b5
>         bolt uuid: 8ab48780-00ce-1da2-ffff-ffffffffffff
>         negotiated link: 40 Gb/s = 2 lanes * 20 Gb/s (TB4 fallback)
>   Retimer on the host port: vendor=0x8087 device=0xd9c
>   External display behind the dock: LG ULTRAFINE, 3840x2160
> 
> Software:
>   Linux anarchy 7.2.5-3-omarchy #1 SMP PREEMPT_DYNAMIC Mon, 14 Sep 2026
>   This is the Omarchy build of 7.2.5. modinfo reports clx as "allow low
>   power states on the high-speed lanes (default: true)". The published
>   linux-omarchy patch set does not touch drivers/thunderbolt/. bolt 0.9.11.
>   thunderbolt.host_reset was Y. pcie_aspm=off was not set.
> 
> What happens with clx=Y, dock already plugged in at boot:
> 
>   thunderbolt 0-1: new device found, vendor=0x1ea device=0x83b5
>   thunderbolt 0-1: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)
>   thunderbolt 0-0:1.1: new retimer found, vendor=0x8087 device=0xd9c
>   thunderbolt 0000:00:0d.3: 1: TMU: failed to enable mode uni-directional, LowRes: -107
>   thunderbolt 0000:00:0d.3: 1: failed to enable TMU
>   thunderbolt 0000:00:0d.3: 1: USB3 tunnel creation failed
>   thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting
>   thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting
>   thunderbolt 0-0:1.1: retimer disconnected
>   thunderbolt 0-1: device disconnected
> 
> The same sequence then repeats. While bolt policy was iommu, boltd also logged
> "auto-auth: authorization failed: kernel error: write error: Input/output error"
> and the kernel additionally logged "PCIe tunnel activation failed, aborting".
> Setting the stored bolt policy to manual stopped those authorization attempts.
> The TMU / USB3 / DP disconnect loop continued with the router left at
> authorized=0.
> 
> Workaround, same boot, no dock power cycle:
> 
>   modprobe -r thunderbolt   (typec consumers unloaded first)
>   modprobe thunderbolt clx=0
> 
> After that, /sys/module/thunderbolt/parameters/clx reads N, the router stays
> connected, DP-1 comes up at 3840x2160, and the dock USB3 hub, keyboard, and
> mouse enumerate. No further TMU or tunnel failures. Authorizing the router
> with boltctl after that succeeded on the first try. host_reset was left at Y.
> 
> This looks like the same class of failure as Launchpad 2165852 (AMD Rembrandt
> plus a ThinkPad TB4 dock, Goshen Ridge 0108:2031), which also loops on
> "failed to enable TMU" / "USB3 tunnel creation failed" unless thunderbolt.clx=0.
> The pair here is different: Meteor Lake host 8086:7ec3 and Anker router
> 1ea:83b5. QUIRK_NO_CLX already exists; this router does not hit it.
> 
> I can retest with thunderbolt.dyndbg=+p or try a patch if that is useful.

Can you test with the dynamic debug enabled and provide full dmesg? Or
alternatively run:

  # tbdump -r 1 -a 1 -vv -N2 LANE_ADP_CS_0

and provide the output. This needs to be done when the dock is connected
(with clx=0 is okay). This should show if the dock claims to support CL
states.

You can get tbdump from tbtools [1].

[1] https://github.com/intel/tbtools
