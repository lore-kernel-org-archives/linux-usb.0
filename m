Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0751E3C1D68;
	Mon, 10 Aug 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361446; cv=none; b=eY4vwUzWveaBoxp/Yqq2StPvxswJcpdZdC6JbXapor3AIHOUuX6DlDdOApLurDZFElgZ4YZxk/qGnQ9pBOmjhpG4no2PdM7Cefg5R/O8LsqERLnmSwbg74RjPC/mvHzTrspVYxyGExQjbnXUt8bhVjykN9tZmaCpYep1KoXzNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361446; c=relaxed/simple;
	bh=oqhVXD0fSn3Obxd8COioFUV/TMy2PhHuCN1A1epc9Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjZdV5QYbx76JKAH1okno0AxJ7sCNttNK8WIFeVDJbNjezCqVG6JDzvCbIHuvU/a+O3gAx6rXfpSg0aQGQeHPNSv/IA1tYdpujPQ3nFXvuVs8ZxGRZ1QSltFlBsr+uPCu0vmXygvkGUVakUee60iTEws0oVzkzoykAX/MMmKca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hcXERnn/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcXERnn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786361445; x=1817897445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqhVXD0fSn3Obxd8COioFUV/TMy2PhHuCN1A1epc9Gs=;
  b=hcXERnn/vsSViCIPaRwjQYzR9sz7iXMMcGR5s00BVkCXzGA34jhKL9c9
   nSCIVxwJmtd0n/Cz1DMS7Yl0G8Zr5fB9v0LtXmnzncbvZGVZQJSSlR2Io
   X4Pbt8aBCPOgt6HEd7HBBKmX11OMb7qewGuGbeLmtZhScWxO/wjyXrZ1x
   qwgaQRNweNhr4v56Y/hbXdXqiacGRGyTNQlxkvHYC0ujNOHCPP4ofXvYe
   CxXCfSZvGUDDbfmuyHIRMa7fQcRo+WLMLIGYbYV1mdVQG5d2g0dWZ2yoD
   rocuM66GXkxR5rk0OUFe58uQpKpR+5JqLuiK48ndOwwtNAsMcWm7J9vsB
   w==;
X-CSE-ConnectionGUID: 5V0euSWARWuunnPBVhknXA==
X-CSE-MsgGUID: 2zxMzYoIRqmOqWzzzO3IaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97221505"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97221505"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:30:44 -0700
X-CSE-ConnectionGUID: V8OOqr/gTgqs8VR5DBF/fA==
X-CSE-MsgGUID: 29osdTEcSPe+pNesrLfImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="264999778"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 10 Aug 2026 04:30:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F172B99; Mon, 10 Aug 2026 13:30:41 +0200 (CEST)
Date: Mon, 10 Aug 2026 13:30:41 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: fy15309206903@gmail.com
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Use min() for the DMA path credit cap
Message-ID: <20260810113041.GI893316@black.igk.intel.com>
References: <20260810-tb-dma-credit-min-v1-1-1ea9d3847e7c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-tb-dma-credit-min-v1-1-1ea9d3847e7c@gmail.com>

Hi,

On Mon, Aug 10, 2026 at 09:38:43AM +0000, Fan Ye via B4 Relay wrote:
> From: Fan Ye <fy15309206903@gmail.com>
> 
> tb_dma_reserve_credits() caps the request against what the adapter has
> left by decrementing one credit at a time. The other arm of the same
> if() already caps with min(port->total_credits, credits); use min()
> here too.
> 
> No functional change: the object code is unchanged.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Fan Ye <fy15309206903@gmail.com>

Applied to thunderbolt.git/next, thanks!
