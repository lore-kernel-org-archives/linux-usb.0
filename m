Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D1266576;
	Wed, 21 Jan 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768977354; cv=none; b=FqZB25Jw1FCI2deSnSWuoK5X7iHq3P/8f1+XPxtKB/UIKJdW7F2YknrnRBO4T5GO70A9Iw/FNV0/WVO/uJ8IAGRALfDNgDmQiOGCb9siKyOPS0iCqWZAwzco3qWzuoaidHfMxIXC/YcnEBIrIeAE+H7Uyi1Hu7jZPBzYlmEHUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768977354; c=relaxed/simple;
	bh=Uxl4oBc6+HNd1D3LlqKHIX/MQOTfbJGg1oqcepCdolY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs/0iRQ0THiugnif7DNAJcNwxRqZNX19gAn7WTHJ6hNe74OU/aSSYuQTudUs+J98LDbyKv0pUtG2b+jkub6EZOFhcx8TBKZF7hSwiK+4PFI7WXC4ClA9R8cIVH2d/XqeHEjim9PF6wePFNAYQJxrf7fLPjBlXawxUCIk5wVbnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eo1nHP1A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eo1nHP1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768977352; x=1800513352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uxl4oBc6+HNd1D3LlqKHIX/MQOTfbJGg1oqcepCdolY=;
  b=Eo1nHP1AXL3kJ+CIZYuG53L2Qjxr6EojsOK1b67/0MJn+Evgg+mY3WEr
   5PZ0j+m17VJXNyJ75qrCGkC4XxpVz4cFios7fiLZVPzHFvze9ph3i8bi0
   gcdFJOXivgXdKr202Pzl/nJnBd1QeqCULJpbbSxMqi+WVXoiMlgPI9aWb
   8CAWWXpfErb924+SyXZO6e7/MCiPgQGVx9GbxP8Q7nBi2/Kzm31Sd9oyk
   /9h5sGdWgO6y4ydH5FqhguBRE61CggtrdEepTGmOHylwmZa03P9CFehZO
   jfo81QM1b3Q6ToyTzepsTJDbjgq5gVyYeafo8jhzM1QEgCX3GGw+xHNsW
   A==;
X-CSE-ConnectionGUID: dy2h/bq9Q/a2iFNlp+38fg==
X-CSE-MsgGUID: GXToY1BpRHyWbkvvIG0X1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74066624"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="74066624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:35:48 -0800
X-CSE-ConnectionGUID: mMA5jUPfQ2ecSzD6N7837g==
X-CSE-MsgGUID: LcZ2Sy7nSkiegZllA/87RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206414790"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2026 22:35:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B2BC795; Wed, 21 Jan 2026 07:35:44 +0100 (CET)
Date: Wed, 21 Jan 2026 07:35:44 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260121063544.GL2275908@black.igk.intel.com>
References: <20260121060857.237777-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>

On Wed, Jan 21, 2026 at 02:08:57PM +0800, Chia-Lin Kao (AceLan) wrote:
> PCIe devices behind Thunderbolt tunnels may fail to enumerate when
> spurious hotplug events prevent pciehp from detecting link-up.

See my reply for the v1. Let's discuss there.
