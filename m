Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE634DCCD;
	Tue,  6 Oct 2026 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791261193; cv=none; b=bu+NM3tKHC0QqBXKBjdzhgwU8YUyrnbqOheGIoEgz/BEO9ZEPUX85gP2eYwgFm5lQ/EOCRYR9L4EhfCDedgaJ7Lgu0cWyNQ8Vg5h3MjkCtJ+mjiiguMyGTa0LHlsU1n9SsIzgO1ZgqgCbUGqTP3r9TWiNTl4Tw2gPCPfZc+mHI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791261193; c=relaxed/simple;
	bh=WVsN+7SSp9FfdoXFdy3oTjn7RcpiPKQRQVdQqofc8nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grjPro2NVhPXQy0FORdwN04XRtA7znk/HALxINwsmMHlQsE9pH8QE+/Frnz1hTxsUoDW3HSxpOdSA67GKxA11n+f5cSvjyLE+fF78+2Zz3o5Wr4aTToNWUr+bmbO8sQDtfxFyEa0YbKe5VpeWNnnSWkhp23HSnd1hTaBFRzYQEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPqeK0Iw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPqeK0Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791261192; x=1822797192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WVsN+7SSp9FfdoXFdy3oTjn7RcpiPKQRQVdQqofc8nw=;
  b=TPqeK0IwuyGoZTc3GdXvwiGS3t0IZQY9Pjp41VaTC7XFJle3sw0tiWIj
   elfiF/rb/GA/EsEWJ/4y8yoLDDx8dXJ6AW2/l1qLIN4BBLgCbue7/g/sG
   UuqzK3AjIkZilWGId9+qqVzcHEatnu5MYJlD+x45X0V2x8FAAq8UIzvSw
   SCDur74gBKh4YfAxUeQmr4tAlnwOnYZ47H1QNa22haVrKFib3OaoDuRJ2
   ATdpvN47I+n9qhDwn4a0Gx3wAdffJ/5LfLrYjXbX0GnC7DEvrLvziPCBR
   wSDOQmPtpjfL9DnqbYK6B6QLr7ijCDY8C44240GrHmbNZ3w0uGQ/QQeA5
   g==;
X-CSE-ConnectionGUID: QV9fP8SWS+OgtVHSa3mdlA==
X-CSE-MsgGUID: tm9/eW//SiOtqthkFiLJ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95759710"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95759710"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:33:10 -0700
X-CSE-ConnectionGUID: m3Hmn6xRQIGw6ThfjNoB4Q==
X-CSE-MsgGUID: jOw54ywBSciH9b6TtHTQ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="306533935"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 21:33:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8C10C99; Tue, 06 Oct 2026 06:33:06 +0200 (CEST)
Date: Tue, 6 Oct 2026 06:33:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH 2/3] thunderbolt: Reset the host interface before reusing
 a DMA HopID
Message-ID: <20261006043306.GO176164@black.igk.intel.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>

Hi,

On Mon, Oct 05, 2026 at 07:13:40PM +0530, Basavaraj Natikar wrote:
> Reusing a DMA HopID without an intervening host interface reset can hang
> the TX ring on some host routers. Resetting on every DMA tunnel teardown
> clears the state but, as the reset affects all rings, also disturbs
> unrelated active tunnels.
> 
> Hence, track the DMA HopIDs programmed since the last reset, prefer unused
> HopIDs when allocating rings, and check for reuse at tb_ring_start() too,
> since networking retains its rings across reconnect. Return -EAGAIN instead
> of programming a HopID that still needs a reset.
> 
> Run the reset from a work item once all DMA rings are idle: serialize it
> with the connection manager, stop the control channel around it, and block
> DMA rings from starting during the reset. Fence the work across domain
> removal and PM transitions, preserve live DMA rings across freeze/thaw, and
> restore the interrupt-mask shadow under the NHI lock after the reset.
> 
> On -EAGAIN, retry the networking login asynchronously and block the work
> producers before teardown cancels the workers. Keep peer disconnection
> separate from administrative shutdown so it cannot reopen the login gate,
> while stream and DMA-test callers unwind immediately and return the error
> to userspace.
> 
> Enable this only for reset-capable host interfaces marked with
> QUIRK_RESET_DMA_ON_REUSE. A competing DMA tunnel must stop before its dirty
> HopID can be reused, and retrying does not interrupt that tunnel.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Yeah, I'm not really sure I suggested this :(

My idea was to done it so that it is nicely contained inside nhi.c without
distracting the service drivers. What you are doing is complete opposite of
that.

Given the complexity I would then rather just take the previous quirk with
the deadlock fixed.
