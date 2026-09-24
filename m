Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4630F45039
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225147; cv=none; b=CGvCDySSatF5U/zAKqSPahCx6D5Qon1FDgjwEFMpRapajv28LQAZaFgVouP69WDWvBROsfCkEhJxA2bB4VWI0SCayhtO6Kkue2KhrbyjxfcqEnQXEDphqszNmKzLk1VNgB9q45sSHlScnXnM8wyKb+sdXKB2kVrlRAYrVImvTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225147; c=relaxed/simple;
	bh=45FXXh0ufUXxrfD5xoujw4onT0oldYwnjoca7+xZ1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu5t35z2VuPpDTTXQnkY0OBqEEutOKT+lDeNOJSRfq0j1ls0VeToG8VKm610paPPjLY0DVeMuB93/E3sX7b26N5d7AOzyXatJmQbVEuUfkDRQQUyXF7zXF0g4VvP9+8KHZdnbaEkAukEXUidivgOBjqw13KKWYeNdu8HHvK+a+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoMP+jix; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoMP+jix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790225146; x=1821761146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=45FXXh0ufUXxrfD5xoujw4onT0oldYwnjoca7+xZ1fY=;
  b=VoMP+jix0GhHTKum6L2f8wMChLeBQi2BBLCmOg7ZJqELEfg6RWMVwKbE
   TfsDq2FRYMSycrDhFLcW2ojbKf4p9K1f/clplw2oLMUkY1A6C0XMoTcQ+
   xPl/qzDtdxeKK2InpYcqkzpUqPuNBkovgXsvXW3MZJRtvRTtUEABH3L4E
   oX3K0K3F6FTgTSwqnMtK62dwdONfOlTth7qMAwbVuMCZ8upOvs4Bns4qy
   H0CI1UYsEMvgOPMk5m/BUgJMR3j7OTfOz/T59buKdz9BT98CsoLXebHHx
   3bXMT+K6FxSFNihpAl7q2p2AJnrWtQUX6/FbcObAP7tcaH3RT3IEQLpso
   A==;
X-CSE-ConnectionGUID: ZUhHEnC9SfGP+OGKuJSJcQ==
X-CSE-MsgGUID: kjviAh3UQcW11R0zBwC92Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94804258"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94804258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:45:46 -0700
X-CSE-ConnectionGUID: xKGqmPhBTvSbkd0CxA2ZDg==
X-CSE-MsgGUID: NpHt8ta+Sv6VCSykTAM+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="270407969"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 21:45:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5332099; Thu, 24 Sep 2026 06:45:43 +0200 (CEST)
Date: Thu, 24 Sep 2026 06:45:43 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>
Subject: Re: [PATCH 0/5] thunderbolt: Add support for extended error counters
Message-ID: <20260924044543.GK106095@black.igk.intel.com>
References: <20260917085107.1022445-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917085107.1022445-1-mika.westerberg@linux.intel.com>

On Thu, Sep 17, 2026 at 10:51:02AM +0200, Mika Westerberg wrote:
> Hi all,
> 
> USB4 v2 introduced extended error counters for lane margining. Compared to
> the USB4 v1 these are 16-bit (vs. 4-bit in v1). This series makes them
> available for debugfs software lane margining.
> 
> Anurag (3):
>   thunderbolt: Make software margining error counter configurable
>   thunderbolt: Fix sideband register access in usb4_port_sw_margin_errors()
>   thunderbolt: Extract per-lane extended error counters in software margining
> 
> Rene Sapiens (2):
>   thunderbolt: Define number of dwords for hardware margining results
>   thunderbolt: Add extended error counter support for software lane margining

Applied to thunderbolt.git/next.
