Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836967;
	b=jdKnc3gV9shK8O4RvFzBWY74cenNZdZ8jLgHL5bJ8ZUBwrH4xROtvzEIcIWf1Udiwx5M
	 JTuZEVtomf/jM4zYIp7YGn+fwgqucpGpf/9avsVZTDBHSNxoCkv/MpiHz/wQXnCcq//3o
	 Cr+/LqtZU+lt11Tnp28GEm6fkmH3BpIAyGfdq7KXlUzKmsHGiiSogHZYqGHNE22k8yvem
	 /XJAg92MPgqwLUPGtWkoikgr3LLO0YIUG0WSohsJFSXlvSRT7ZRs3mZMC0wV1UZ6faggv
	 Df2PGg5bAb8V3qkY0cRVJvofgIxzuPDOD9t3ZEDtN3g0Up0Wpc6ZmPHsL3FDAgWDOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=B6lJFDuqcdgPZd+9goMcq04cMWhhWgoUimK/On/nths=;
	b=RIB3lWZE+zLW89+tWHzIdzuFHxuQxGuDfikVBAJN1m7NL2lcppR+i5AoZeTUibKyC4Mb
	 +dzxqklZLYrh3nmmRtVWvKJaHkK9H+JwuiIcIUbbdUJ/oZV+P547I/ArW8p3rnHVRp+hT
	 JXUQSoOop/lH3cH81IhiU3RawweCxx0KH/6hEAFUXGuJEPLffGGuFDcV3lChA0qy99Siv
	 RdPMkR8fxfmS0mcU3CBMuA+7Zsc/7qnzHrD17ePlfzYiNx7UABUloFUOe1Gf7gp/212KD
	 BlzVzTkxsoUglxTGTYr8fuojaJMQY+pJzceN3xay9RNPjmGcP3oGRLKzmyZhjw0bb0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjSd9blm;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DF606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9DF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjSd9blm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794836965; x=1826372965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hj0mvv6rcB21UckXJ01FbqfU6nDmg+CBh+zP/9XnwWE=;
  b=TjSd9blmvcCH/aflm4C8nA39R0iQDJfKQWgHKoffQUTRDNoT+ytDCGSt
   vf59RG+w8Y/gV9npPZNw/szJGd59F+iFYs2cBbFJaWavBLIJKrCPzWdCv
   IGawWTks2MUWuUJJN/slk38cZrF/IAvTlLCy2hSFOlhU/yfJkejus4ktX
   lRqpqKQIXcOsEg7nV7teBaHClj+W45clf4vOKKnOcbrLkHbxM50H8drlb
   O15JapzSJmEwfc5vE8NshURDRzpOSZ28HtJBc2MvNNtxvtUY8s8t6HmlM
   j0J2g1jv3HRIKXglbOwlIg2MxBnVWAJHoBIitlWRvqdRv/+5yCA2Cocjk
   Q==;
X-CSE-ConnectionGUID: 02yDtVzXTpOCAuY7NeWcLg==
X-CSE-MsgGUID: RtdbsMplTC2oG415kVD1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3649217"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3649217"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:49:25 -0800
X-CSE-ConnectionGUID: F0POIJbVTSyRWNjzrPj3zg==
X-CSE-MsgGUID: 5dMMtdZBS2OLbECNIKX3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9562899"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 05:49:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 27C9699; Mon, 16 Nov 2026 14:49:23 +0100 (CET)
Date: Mon, 16 Nov 2026 14:49:23 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/2] thunderbolt: Return -ETIMEDOUT if XDomain peer
 returns ERROR_NOT_READY
Message-ID: <20261116134923.GW259790@black.igk.intel.com>
References: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
 <20261111123248.1312997-2-mika.westerberg@linux.intel.com>
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
In-Reply-To: <20261111123248.1312997-2-mika.westerberg@linux.intel.com>

On Wed, Nov 11, 2026 at 01:32:48PM +0100, Mika Westerberg wrote:
> The XDomain protocol retries the message when it gets -EAGAIN from the
> handler. However, this also happens if the remote peer replies with
> ERROR_NOT_READY as tb_xdp_handle_error() also returns -EAGAIN. This can
> lead to infinite retry loop. Fix this by returning -ETIMEDOUT in that
> case.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e1de7042596 ("thunderbolt: Add support for XDomain lane bonding")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
