Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165183;
	b=ywJh2kOpTaIGK4anxxARKzRkpvt7PbHsa99EMAn2Ux1+CmMbH0W/KNZE7Rhs2rF5e+0v
	 NtDbTe402sG4yAaJGCgTRTTu4XpTueuhhChxTH7OX/ml0R7PmgzQlmp7qFGVtMpmhBmY7
	 j7ZPBSSuvsu1s4oBId1EL/rH1Pgo0q3jQdevN5AY/ww2Ql5aZuS7hrJGDQ2a7XHyY2hi8
	 rvhn9SuRlFFgdAcOVsfSrj49UwHR/E5TxybH+WwhZyAck2NhoEs1W0oRu+jG1evEvbWoF
	 SdijK9KnPJ64cvjN3ryQRJ7tySkoJ5WpXNU2jAoeC82LIUweVG+b36IDw36H0kypihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165183;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=VedXmvSI7G6Xtxoxd3IW0KA5vnVG/Qoj5iEhteVh2F4=;
	b=M4oy1a4rXgYicMuekHjf3+rK8qdElr+BL7MwjYvHwyjot+o89dtWpG8sGG7iJ4FCNnPz
	 1snpJT/gmxIDQYE6kMuv3C3ZOkrs7LYshhAwxk4ikspXXAt1XMAfmzXQIX3bzwwX3/iFt
	 FsJsnNlpx9o2tHHSsvDo1M9Xd6WGgpD/L1xfQpKAvQ9c9BNIcmNz2Dd1MFG+u0+iYzOOz
	 STNQurKJsRypHwSZvmoLOFHUp+XlMfLkzfL3S03Lct6irRzGJ25MeK39RPJWL3b8tscKg
	 SEcnqVmutC/fwz8ygZlCIf+6OBQJoPdtgAY8NBXyCK1VWb5QnhlSYbCbQSJmYlrIuvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GsWwQTjI;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C00606A32C;
	Fri, 20 Nov 2026 08:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C00606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GsWwQTjI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795165184; x=1826701184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nk+t4fI7zmLmWT/kxiuqyqIDMYUCl9U7mqKAwRYAXEU=;
  b=GsWwQTjINcWyOfGYRC/W778QqQYSKIPtAP7s64ZUXJGMAQPBwhJkLB/q
   ltKvmDG4KDCbMVFp22SbdCqPI5YT+ktG7NlgMqsxIiDA099As1e2f4D+D
   CJFioI1E0MmR4yHdiIkJlov7z3bn4L9aiopjOkQkN263M3ZLKSM1RsRdU
   roLx0ZtlvTMuJv+4TZoSFNECvOtOMhQcE6tG2ZQ23p/NkExcD9Elyk9E9
   pSzJm6EPPeBfiCpe5EAdc6a19xpTJxHjhsxiO3Ae50e0bcUED/nVsODQB
   Y+Q1bgJIicOglhll5V5ZS9WTVDBBGW4sgynt+YCxDNloG3VthIK60OFaG
   g==;
X-CSE-ConnectionGUID: 3dlW4yPfRz+FVa2Ykd8g0Q==
X-CSE-MsgGUID: hTpyKbj5RsalkxRQP5hSow==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4081601"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4081601"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:59:43 -0800
X-CSE-ConnectionGUID: 8YRu/vs0QIeBu8Whxdd/Iw==
X-CSE-MsgGUID: eYIQxeXtQJuw0HqduVkqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12363983"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.218])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:59:39 -0800
Date: Fri, 20 Nov 2026 10:59:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: netdev-bot+sashiko@kernel.org
Cc: liuc63@xiaopeng.com, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	khtsai@google.com, fangxy@xiaopeng.com, rdunlap@infradead.org,
	dbrownell@users.sourceforge.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 2/2] usb: gadget: u_ether: fix out-of-bounds read in
 get_ether_addr
Message-ID: <awAL-CjBSGfOfYUS@ashevche-desk.local>
References: <20261117090110.3263592-3-liuc63@xiaopeng.com>
 <179513296378.3136.18205287276015126683@kernel.org>
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
In-Reply-To: <179513296378.3136.18205287276015126683@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 20, 2026 at 12:02:43AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message is wrong about how the legacy module
>   parameters report a rejected address.
> - [Low] The ABI text this patch adds to configfs-usb-
>   gadget-{ecm,eem,ncm,rndis,subset} says host_addr/dev_addr accept only…
> 
> --
> 
> usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
> 
> This replaces the open coded MAC address loop in get_ether_addr() with
> parse_mac_pton() for the delimited notations and hex2bin() for the raw
> twelve digit notation. This fixes an out-of-bounds read on short strings
> and stops non-hex characters from being silently accepted. It also selects
> GENERIC_NET_UTILS and documents the accepted formats in the configfs ABI
> files for the ECM, EEM, NCM, RNDIS and subset functions.
> 
> Link: https://lore.kernel.org/all/20261106030605.576584-3-liuc63@xiaopeng.com/
> 
> > How a rejected address is reported depends on the caller.  The legacy
> > module parameters go through gether_setup_name(), which keeps the random
> > address that get_ether_addr() falls back to and only logs a warning.
> 
> [Severity: Medium]
> Is this description of the legacy path accurate?
> 
> Nothing in the tree seems to call gether_setup_name(). Its only wrapper,
> the inline gether_setup() in u_ether.h, has no callers either.
> 
> The legacy gadgets (legacy/ether.c, cdc2.c, ncm.c, multi.c and g_ffs.c)
> pass the dev_addr= and host_addr= parameters through
> gether_set_dev_addr() and gether_set_host_addr(). The KASAN trace earlier
> in this commit message shows the same path
> (eth_bind()->gether_set_dev_addr()->get_ether_addr()):
> 
> drivers/usb/gadget/legacy/ether.c:eth_bind() {
>     ...
> 	if (!gether_set_host_addr(net, host_addr))
> 		pr_info("using host ethernet address: %s", host_addr);
> 	if (!gether_set_dev_addr(net, dev_addr))
> 		pr_info("using self ethernet address: %s", dev_addr);
>     ...
> }
> 
> gether_set_dev_addr() parses into a local new_addr[] and returns -EINVAL
> when get_ether_addr() fails. The random fallback is thrown away:
> 
> drivers/usb/gadget/function/u_ether.c:gether_set_dev_addr() {
>     ...
> 	if (get_ether_addr(dev_addr, new_addr))
> 		return -EINVAL;
>     ...
> }
> 
> The netdev then keeps the dev_mac/host_mac that
> gether_setup_name_default() picked earlier with eth_random_addr(). Since
> eth_bind() has no else branch, nothing is logged.
> 
> With this patch, "insmod g_ether.ko dev_addr=aabb.ccdd.eeff" no longer
> gives a stable aa:bb:cc:dd:ee:ff. parse_mac_pton() fails the length check
> and hex2bin() fails at the first '.'. Would such a user now get a
> different random MAC on every load, with no message explaining why?

It sounds like a good idea to add a warning on rejected addresses and say that
random is in use.

> Could the commit message be corrected to describe the
> gether_set_dev_addr() path that the legacy parameters actually take?

I think this needs to be followed and commit message needs a correction.

...

> > --- a/Documentation/ABI/testing/configfs-usb-gadget-ecm
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-ecm
> > @@ -17,4 +17,9 @@ Description:
> >  			      - MAC address of device's end of this
> >  				Ethernet over USB link
> >  
> > -
> > +		host_addr and dev_addr accept a MAC address as six byte
> > +		pairs separated by ':' or '.', in any mixture
> > +		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
> > +		hexadecimal digits with no separator (aabbccddeeff).  Any
> > +		other format is rejected: the write fails with EINVAL and
> > +		the attribute keeps its previous value.
> 
> [Severity: Low]
> Does this text match what the new get_ether_addr() accepts?
> 
> parse_mac_pton() only checks a minimum length and the first
> MAC_ADDR_STR_LEN characters:
> 
> lib/net_utils.c:parse_mac_pton() {
>     ...
> 	if (strnlen(s, MAC_ADDR_STR_LEN) < MAC_ADDR_STR_LEN)
> 		return false;
>     ...
> }
> 
> Its own kernel-doc says "anything after them is ignored". So writing
> "aa:bb:cc:dd:ee:ff:00" or "aa:bb:cc:dd:ee:ffXYZ" to dev_addr succeeds and
> sets aa:bb:cc:dd:ee:ff.

Yeah, the text needs an amendment. Something like
"...with no separator (aabbccddeeff) at the beginning of the input."
(see the part "at the beginning of the input" that's added).

> The hex2bin(dev_addr, str, ETH_ALEN) fallback reads exactly 12 characters
> and never looks at str[12]. "aabbccddeeff.zz" and "aabbccddeeff0011" are
> accepted as well.
> 
> The reverse case is also missing from the text. Both paths in
> get_ether_addr() also require is_valid_ether_addr(). A correctly
> formatted multicast or all-zero address such as 01:00:5e:00:00:01 or
> 00:00:00:00:00:00 fails with EINVAL, and the new text doesn't mention
> this.
> 
> Trailing characters do have to be tolerated, because a configfs write
> from echo ends in a newline. Could the text say that anything after the
> address is ignored, and that the address must be unicast and non-zero,
> instead of saying that every other format is rejected?
> 
> The eem, ncm, rndis and subset ABI files get the same text.

All of them need to follow the same pattern, yes.

-- 
With Best Regards,
Andy Shevchenko


