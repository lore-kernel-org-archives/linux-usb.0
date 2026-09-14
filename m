Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353041687C
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376204; cv=none; b=BzPUA2cR3bSY808LSfiFZnXTqjcalDlZLVq5XIuTj0t0IpNTEjajFbszGgwRw7UNeMJlWl4sckhkErZ2XGs+QqULdp62t2C1VrKKS9cExA59RB1Y0Z+WBWAQC+CrDHcUe0cm00MyCof/VQglTVBoDaMA0bbTnLLpyGAHq2sWIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376204; c=relaxed/simple;
	bh=imlZbf2oBgjBACwhCfLpOdS4zo0oNQ4YdpE2XU2jzWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biOpdX5sBxw87x8dkAK1SmeH/dsvdDPuSxqoKHov2yYyIKR0fY6NsaTOY1RlL7T5FVrMzp40wTDKW1ua80lOw7FHYO+hUz76izuCMZ4d16L9zw70Law14l2m6UWjekVjWEF+0soJMhyTs4EKXLlg51oNrets59VoPxxcNHR+ZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Alm6eVUv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Alm6eVUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789376198; x=1820912198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=imlZbf2oBgjBACwhCfLpOdS4zo0oNQ4YdpE2XU2jzWI=;
  b=Alm6eVUv6tQDaIP3LEjkwUfT6vsUTel9a6DFYtvI43doBQhH9/yp2iei
   cC6ZQOEyotR8u3zcUQMEJiO5+sWdWSbgy5NpxL0q5rt2+RMhV2rXtzW2q
   ve07GOCHQe8cbKHWPX9CP5oDuIIAtrAdfLlxaSVLH4hK6SPKwZ7BgqkyX
   yrO7bKStFcUy24FgfCAyTfaKX9PBmu6mJjzpVHk6kueA7QuZRfeiMSl3h
   Lj5ygDGz+US+tI9VCklf72l/UqJ8rVWwzsLVx8rrpB6S66JexIzLzextR
   aTmdNC2qZ/8aSy45mSs3A7NidzTGWhxx59vFEUfXLUDr/fMmESIKDVooL
   Q==;
X-CSE-ConnectionGUID: CP+GhIIhTLGz/4Egy5g5+w==
X-CSE-MsgGUID: LhLh06D8TtCQlnOpIjlkRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="77287614"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="77287614"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:56:35 -0700
X-CSE-ConnectionGUID: FAF+VpeaS2qitqYFwFIPcA==
X-CSE-MsgGUID: 47s2lBwQT8mmoJ8zTAHPwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="800638"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 14 Sep 2026 01:56:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5DA3699; Mon, 14 Sep 2026 10:56:32 +0200 (CEST)
Date: Mon, 14 Sep 2026 10:56:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 0/4] thunderbolt: More improvements to USB4STREAM
Message-ID: <20260914085632.GC106095@black.igk.intel.com>
References: <20260908081449.3424884-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908081449.3424884-1-mika.westerberg@linux.intel.com>

On Tue, Sep 08, 2026 at 10:14:45AM +0200, Mika Westerberg wrote:
> Hi all,
> 
> Alan noticed that in certain workloads with concurrent reader and writer
> the stream could stall for a while. These below improvements should make it
> behave better in these cases.
> 
> Mika Westerberg (4):
>   thunderbolt: Write descriptors in tb_ring_poll()
>   thunderbolt: Add tb_ring_poll_pending()
>   thunderbolt: stream: Do not hold the lock while busy polling
>   thunderbolt: stream: Check the Rx ring before task starts sleeping

Applied to thunderbolt.git/next.
