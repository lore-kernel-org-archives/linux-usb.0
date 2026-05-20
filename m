Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0483CF698;
	Wed, 20 May 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271843; cv=none; b=o66h7zjzvPT9Rq0n3VHnzgQieQ/lB/lOp3YC27zRpOCJtRAeWI/KXcas3cL6+Y9dIHemY9Odjuxy9l1n+f1au/BU8dtgs/y2DZdFJdP8iiWLTHxb0RJh90KnLN4DuhrUXmRKlubMFvruqxD6/WfB6GnUMq/gqHxTFOiTSgLn/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271843; c=relaxed/simple;
	bh=9rf5xI/LSY3mpzTc4ymTgZJNBGfWV1XBPKgNpf2TFkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7l1kG0XxWQapuVJOjj4wzcAE+EBxQFChPqR37G/blhxM0pudY2kngIf3Pgmm2pQ4mkHKxJnDU0Xrnldb5yBTy9UIyWsRMPb6BSjlW1EM1Xaa8yrx708rzCQ89Shizm/T9F7tTG3BIDY0urmIc+uU4zUtw9UJtPtV2dvMY6oac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9P93Xdn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9P93Xdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779271842; x=1810807842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9rf5xI/LSY3mpzTc4ymTgZJNBGfWV1XBPKgNpf2TFkI=;
  b=K9P93XdneJH5SD57nEgM9JN2dkYYg6BnSRBxqEZvvwzpbEQY3IoZwOjk
   7DduDrRsj39ea1H5t6M8Pz8DZVyQ68bROzQZwtUfIQTC5dUOVTm6CnNxo
   7ULyUGsCpwcGOmwWFVxQGj6wOx/xKZNinz01lx22UYY8EGQIzw+5oh1c5
   diDU2RIvLubuGpbzh+Aldf5fWaQVIU+TvOq+2nB7VWX8RpOwwBUGDJHjK
   GhekJ2BP94LopAE6WNP3U95nwC+YW/nJwAG9rBtXGVDbHfKzog54LLtF6
   Tw3Bf30jPd6YT8gclq2/gzXytCe3rvcw4IlU1Amckyww8o9C5KBeg6dKw
   A==;
X-CSE-ConnectionGUID: qEla3xbbQNGVYhsFQOIprQ==
X-CSE-MsgGUID: 1hUzCnZwR/GEfunLbFj/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80129800"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80129800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:10:42 -0700
X-CSE-ConnectionGUID: cmyXyow/SjegDpx8iAQEKA==
X-CSE-MsgGUID: FvH+TCduQd+R4kJG4Ix0Gg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 03:10:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A0A0A95; Wed, 20 May 2026 12:10:38 +0200 (CEST)
Date: Wed, 20 May 2026 12:10:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] Prepwork for non-PCIe NHI/TBT hosts
Message-ID: <20260520101038.GE8580@black.igk.intel.com>
References: <20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com>

Hi Konrad,

On Fri, May 15, 2026 at 02:38:40PM +0200, Konrad Dybcio wrote:
> Konrad Dybcio (4):
>       thunderbolt: Move pci_device out of tb_nhi
>       thunderbolt: Separate out common NHI bits
>       thunderbolt: Require nhi->ops be valid
>       thunderbolt: Add some more descriptive probe error messages

I was about to apply this one it does not apply anymore on top of my
thunderbolt.git/next. Can you rebase this on top of the latest next branch?

Thanks!
