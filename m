Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF8453A59
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544480; cv=none; b=QGPBGf7BlYPU8dg+ZUWVNry2SRnzypZMNDnL3I2Vre/LBkpshNYkqLIP2/UCh0I65EhT1aeGaGayTohoroUbdYHeJCYBsrs+fup9EKT9+eOWjvQbCGvwVhs6uUt2RDdl0PfYkS9Bk+oxuUFdloCTYt4J6HRtuVFaRRotIL6K+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544480; c=relaxed/simple;
	bh=tNsjgnJ3C5Bm3uowYFQ2ir1HeHVWkZNj6GzFk2VgG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW68Qqfy2nWu4G8z/FC/VENSJ1AQ0TSHUO/mH9n3ZIPTZAd/XUbMKCSaT9CHvlcccVxFZ7B3IO1jIVFeWOkJ0hcpOXS1lXdZ7FV/EUL+8dbk7/kfz/25SdG17oRrdWSdBc53u5/qng52O/HNUqGO1q2NxbwJgSEkLJWoF8iD77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW3FF0Gs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW3FF0Gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789544467; x=1821080467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNsjgnJ3C5Bm3uowYFQ2ir1HeHVWkZNj6GzFk2VgG2o=;
  b=EW3FF0GsVX4K1wZxeTq3GwQ6u+MMS+wtX4AbRZA9WbSKHK2jsNC5+SjL
   8E3koMA7tK1S1eSsif9+drbIYsI7epoDA5u6MxSuE5G18o7/cWFqyZ2yx
   4IuD2Z15QvykzFfrDixVgJrrBvqEcletMbCRNsrd9Lj30n4bXZD6QgIUD
   E40sue6tJdg7zjs2zdR74N8kg1yQU4zUS6qlHyK+rxEgfCLXBxZSLKnTk
   +JyD+tY61bKzzwkpYLoUi0Es3smPDB1htfc0QNZhhzIJzrcYBh+PBsilm
   DiIFL8YDVCALd32DWhMYCbtnljmBFnhHPa3qPLbMP2QD8118QkL84GnGC
   Q==;
X-CSE-ConnectionGUID: B1ekvXlZRLWbkrU9l0ovwA==
X-CSE-MsgGUID: BKZfTdu5SnepcUX5hIEtew==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101433242"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101433242"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:41:04 -0700
X-CSE-ConnectionGUID: KKktMmI+S+GjP0hxt+hAxw==
X-CSE-MsgGUID: cJ242pIVSPq+msX7ReoxwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270632426"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 00:41:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 463D699; Wed, 16 Sep 2026 09:41:01 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:41:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	juan.martinez@amd.com, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] Revert "thunderbolt: Add quirk to reset host interface
 on DMA path teardown for AMD USB4 routers"
Message-ID: <20260916074101.GM106095@black.igk.intel.com>
References: <20260915204625.2239505-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915204625.2239505-1-mario.limonciello@amd.com>

Hi,

On Tue, Sep 15, 2026 at 03:46:23PM -0500, Mario Limonciello wrote:
> This commit has caused a deadlock at shutdown. A proper fix with
> another approach will be coming later.  Revert commit
> f1de1fc5f632cdeae1f5c2984572ab710d4dfcaa for now.
> 
> Reported-by: juan.martinez@amd.com
> Closes: https://lore.kernel.org/linux-usb/20260825214237.4179813-1-juan.martinez@amd.com/
> Cc: Sanath S <Sanath.S@amd.com>
> Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied to thunderbolt.git/fixes, thanks!
