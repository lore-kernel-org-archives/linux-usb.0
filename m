Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57973348C66
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153271; cv=none; b=p/QcwdDIeB8Sz0+97xu5OfceALN6m62hXvBQ/ZduCfWjY/pLUdwPwOVEWhwLMt+KkMF4Oaj08SDUUQYh4cg0NapKZc+Klajpkui9O7VEME5sTnnpyDX2mZ9nrBbKz3ZZ67O6I88wsLDbA/22mxhQq3KYX/IhfdMtfuceHhMMJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153271; c=relaxed/simple;
	bh=CYw7ccNvacmG+TMnVzoXzfRnbGuLIkyra/7Fo6hvJ6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzJuduAtFhG+FmsQmPT3JGjzNDYI+jUiXfGrbR13KsKrsSGEXFnnIbBHzZANqSyD2uH01ORQ5D+IIQfT3dVUGpaadLcVWBzif116MQMod9T/NDSPZHu6uAaXlFAsE2umqfeHYVuPLKVo5cv5Ce+jvjA+zQk510Hks9TrrAVDnak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acVtEWCk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acVtEWCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781153271; x=1812689271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CYw7ccNvacmG+TMnVzoXzfRnbGuLIkyra/7Fo6hvJ6s=;
  b=acVtEWCk+R3L463u2TCZNwf8prDfk8Q9E+3GWYnRwMCAzc+SplKuJ7i1
   O8cXY5dmfyt10vf2VTtusW9MgwLZ3Y0urZ+jIQ49Out0CcCeFCX5kWQ8J
   vRBzzqp7onPPTQNYeNTm9pituCw4iPFORWxnt202mN246WI4eCYIFQ8DN
   /dAXepjnS27LJTHjsl0omzo27yRa8V1i5WL/mUKNtr96hdCfNgdK1leA/
   l6uQE8KiDUKGLNfPpaxxk+Aveh3gnbKpXpQr5cyKH6LF77043d0Wgsl64
   jnkbOtHMbVNRR7hgxRZmYNEuXUBAWfilKvX34INIYwAgrX+lNt7Byb4sm
   A==;
X-CSE-ConnectionGUID: Xw62lMUjSAWqk4xh209RXw==
X-CSE-MsgGUID: Ootic/fqRfe4mQ7DgJ9gEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104624370"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="104624370"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:47:50 -0700
X-CSE-ConnectionGUID: 1/UFn/k8Q5msnSXwhHavwQ==
X-CSE-MsgGUID: sTpTJZsCTICCEl5iHBoMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240025490"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2026 21:47:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1168895; Thu, 11 Jun 2026 06:47:47 +0200 (CEST)
Date: Thu, 11 Jun 2026 06:47:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
	westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260611044747.GV2990@black.igk.intel.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
 <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
 <20260610115846.GR2990@black.igk.intel.com>
 <ef95085b-8c7c-4214-ad81-1ece2adf805f@amd.com>
 <20260610142317.GS2990@black.igk.intel.com>
 <59484ded-53da-4004-9ae8-785d3b89ce85@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <59484ded-53da-4004-9ae8-785d3b89ce85@amd.com>

Hi,

On Wed, Jun 10, 2026 at 10:19:29PM +0530, Basavaraj Natikar wrote:
> Sounds good, I'll go with that structure and name the driver hook
> nhi_pci_shutdown(). One note: I kept the flag rather than threading a
> 'reset' parameter down, because tb_stop() needs the stored
> nhi->host_reset for the unload case anyway (the host_reset module param
> is static in nhi.c and not visible in tb_stop()), and passing a parameter
> would also change tb_domain_remove() and the cm_ops->stop() signature
> shared with icm.c. So:
> 
>   - nhi_pci_shutdown (tb_nhi_ops handler) -> nhi_pci_release_irq()
>   - nhi_pci_do_remove(pdev, reset): sets nhi->host_reset = true when
>     'reset', then does the usual removal
>   - nhi_pci_remove()   -> nhi_pci_do_remove(pdev, false)
>   - nhi_pci_shutdown() -> nhi_pci_do_remove(pdev, true)   (the ->shutdown hook)
> tb_stop() keeps checking nhi->host_reset.
> 
> Please let me know if this looks fine and I'll send v4.

Looks okay to me.
