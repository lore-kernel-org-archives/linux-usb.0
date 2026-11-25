Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622064;
	b=D8fJHufCm+sEm8v2Ue7llntMqWIgPSztp01VKlypmSWnhPjV5AkPCVxWcZHr3W3gLbg3
	 82PRzIUoMUagYF79gLw7NWGn/f/ztroePkz55s5ZoY+wbFmrF9wFjntnkCBCZWn1gb3gX
	 BSCOyDZQYNS7ENwgvEPRW9M/70Xerb+NpVHUs1IK2B9XwxyNtPbyds521peIeQf2Bhtlc
	 3/bKuu6yU8rH/nwh+uwJLCd0HW3VSXqMLaxN2zP5IFbqp/IeaTp1r2XGI/bo1hGOF9w7V
	 PWddAhEKv3kaRZakO6w0rYxW9Nl1R1qP0WeMt9KTGznQswAhJqQeeH8HewcdcyuNyzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622064;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3FlJZ/CAWurtSaOLBMEz6RZ4/h9sq0M8KRdP3OxNTL4=;
	b=2IcihRC6RWMFnJMIVd6WKPQ5G5eWryC7TgpM60o3J1UghEhKjGFjye5Rifp6jB7Ng0KX
	 MNphWqt6EIH7ICrNKt/um4H0KP9Pbiwb13AJDgKVMGgd/PZhT3u6K6J8TGPrgdiMYIHxI
	 B8aieAUYXB9QeSujKC3wzVYe9IV84bVfjyAvbBwdCphJNARFOEcPKlRPh8KtaTQnwaJ74
	 YC7mSmLTsqEisRh4MOvR9LgwTQ/xQFignvmHs4UWR6VL1/jYoOT0QeTINlIPl8SITaUaN
	 wty18e0ZpXi6Wr++rcCzjYOq888ECo9JdhqTRpHAS1klnNO7QctGpfZ59J1ULqWWcAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hDk78Ybo;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA5606A336;
	Wed, 25 Nov 2026 15:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDA5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hDk78Ybo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795622064; x=1827158064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hjSr7SgRgTbE6i2Ru3XkpgPQfpXJyuH/UfVwCd63LqI=;
  b=hDk78YboAlJrTCqen6UVAlItKVyKJAhOQCxbDDokc5w+6o3lJZAix+fG
   x7ubLVvpOiZ6jtcsNBCLefbsztk9t2ZKCM5hzI2JUwlLDqJa8ZVgmFlid
   OedPDu+slpWq4bYNOp2YtFU9SKZA4V/pGedAXxGR5XHvDONUbzpMyzoUd
   1g+WTJCI3fvB7oYec8VirW2oN30uXXS/KnnekCxuHu+BW1YA30CmBQZjF
   a+FkPmVGNKx2J173ZEYY4vSTDGRhHGxdk6j+CPVu+U736qGF/XvKBX4QQ
   XuhaNt9syV89i3Y5RvQRah2cz95KM0VZHmO9edLMmisNxq7oPSbriTCGI
   Q==;
X-CSE-ConnectionGUID: y9tw+EBNQ/6wqbvE3mL0NQ==
X-CSE-MsgGUID: QsFf+sV1TvSsMhnLbgPxmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4562623"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4562623"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:33:04 -0800
X-CSE-ConnectionGUID: ayMkt3kPQRSYl1gL5vV2Zw==
X-CSE-MsgGUID: cogWUJDbRDWJN0vYyqCcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="13698255"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 25 Nov 2026 07:33:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3476D98; Wed, 25 Nov 2026 16:33:00 +0100 (CET)
Date: Wed, 25 Nov 2026 16:33:00 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tobias Heath <heathtobias@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
Message-ID: <20261125153300.GI191152@black.igk.intel.com>
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
 <20261125145207.GH191152@black.igk.intel.com>
 <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>
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
In-Reply-To: <d05aa4e7-5c58-4311-a85e-6bfe9c31c62c@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 03:16:26PM +0000, Tobias Heath wrote:
> Mika,
> 
> That's clarifying, thank you — I hadn't understood the two-paths
> distinction. The behaviour I want on lid-close is Path 2 (runtime-idle S0ix
> / Modern Standby), not Path 1 with the TB fabric preserved. My patch is a
> workaround that patches Path 1 to behave like Path 2, rather than using Path
> 2.
> 
> On AMD Ryzen AI 9 HX 370, I'll inspect amd_pmc debugfs (I assume the AMD
> counterpart of pmc_core) to confirm whether runtime S0ix is entered when the
> system is idle, and whether any particular device is preventing it. If Path
> 2 can be made to work on this hardware, the TB patch is probably not needed.
> I'll drop it in that case and keep only the atlantic fix.

Yea, it's not exactly trivial to get all the ingredients right but distros
typically have all the drivers + firmwares shipped so that may be good
starting point and just see what is missing (if anything).

> Would you prefer I withdraw PATCH 1/2 now and respin as a single-patch
> atlantic submission, or leave the series open while I investigate?

I would leave the TB patch out of it because in that shape it's not
something I'm comfortably taking as is anyway.
