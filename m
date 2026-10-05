Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD84AD4C4;
	Mon,  5 Oct 2026 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210949; cv=none; b=bPb+90obhM70L83jWy55vCidAKykWARfKan7mKEBUkZCzR9At2VUb4vcj+htPGPl/PNFWvpiHayZ5sLeMr3PyDcQmj+xKSywjJgp4rzAL6LG1O6w/6xOEXsiH7QNTKXl4gzYdlj/LMb+yIZdgIv2VaZUXzxN2zZGX7wE0r86XSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210949; c=relaxed/simple;
	bh=RvBoFVYSVpf6c9syl+X4qMYGlTLKYTW/IlD6dQS3euo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC1lleBj/s2jpDotjrrBzNbS7gOOL86b9Q0oUXIlRuZt6KYIm7jTiO4Cq4OipbxqG5O18VFRagW5zLRU4I2QqiYBplI1BGnnKUPULlmGvlukl9H3SnG8Eq5aP0ZIORWwCCdA+7WiKIlQ2cIDyl1dvS66JI3dcwEadSG0HNejsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKq333a1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKq333a1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791210944; x=1822746944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RvBoFVYSVpf6c9syl+X4qMYGlTLKYTW/IlD6dQS3euo=;
  b=ZKq333a1mhQz3WYskgulOFbB035GipBkhdXbS/RMEbJpvoiU9uGNLr7q
   E9KER+8TEg2xzSSh0VUT3BxNUZk1aYL04IoEW2Gnb1p6VkUD/I3C2ZPE3
   4wvIleSNJZyMFRCUQUmlnkQSx/BpsyIULC8/8qCFcLHAZnxCDvirn7mG/
   wXDPZck6hvq6W4oYojwz8q20eLjkTYcJkoJGVli6qGldL/H692cXA8vuF
   Gu8TLpplE73RK03o9iRVO8r8ceoLJg+xjPDfVS/jbYj3pQKpP792iJdd3
   BQjpLyHw9yoQ/1Pvgx3j4ujw8rCjaAbuPM0ZJOSO8WMkBNv6isTF5/AoB
   g==;
X-CSE-ConnectionGUID: Q8oYo/xUQ6yAiUrciNK9Xg==
X-CSE-MsgGUID: DJtYRP01R/q4w2YJCiB8Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102044607"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102044607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:35:39 -0700
X-CSE-ConnectionGUID: TiXNSs1PTQCKsidz7X/41w==
X-CSE-MsgGUID: oVxLJWVQS52SrGSqVdB/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280574060"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 07:35:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AA38999; Mon, 05 Oct 2026 16:35:35 +0200 (CEST)
Date: Mon, 5 Oct 2026 16:35:35 +0200
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
Message-ID: <20261005143535.GM176164@black.igk.intel.com>
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
> +++ b/drivers/thunderbolt/nhi.c
> @@ -17,6 +17,7 @@
>  #include <linux/iommu.h>
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
> +#include <linux/pci.h>

I haven't looked at the code at all yet but this one is no-go. We are
trying to make the NHI code generic that can work with any interconnect,
like the controllers on ARM based SoCs (aka platform bus) and that's why we
have pci.c for the PCIe based NHIs.
