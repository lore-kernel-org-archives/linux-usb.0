Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D73BBFC7
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158377; cv=none; b=tI2EJLQsYtG3ADA6gV+XtxhmnibaiEXWEg/LxTI+Uj/xLE+uItwKNJcaNCfniI2qpRynk+dzk2rdcC8xE8wX/ml5DJvVZ+K+tV7+DEprtTlCgHvKMnrF5v6GhUj/TaGQ3zMaBp1pHTNzmC6sqU+8BMRBHUkCbkl9ZmIA29efE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158377; c=relaxed/simple;
	bh=yVjnDlcYs2HIGE8tTUyxTsvELM35eH+F7TXR4SzHZBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSsqgKZP9NJghEnPmB2ZOvXzvpzpv4irujqDMKs4eMizcmaz2Ny4LHAE0R7yVCxpVCX58Msw1V2S6UEZd8Lx+fWwvyjtJf091J5eoRdBAQK5zf32u1wsBskQmVtl3FvoFspyQdKqst8aZQkFDE2kxdyn7bcrwyz22qMADtBwU6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRgXlcDR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRgXlcDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788158376; x=1819694376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVjnDlcYs2HIGE8tTUyxTsvELM35eH+F7TXR4SzHZBU=;
  b=iRgXlcDRw/8WeoPl1LgP3ZgoajG8OpygyB5XnhKKEKkOraw3u4FBD1H9
   6/chmGU5ZDrcHu2Re/avI7u/kMXmonPWh/5ZtVHv5XHGWGTevaUBFUFOS
   IPAuQpG7WB9Kn+gYHdXgwggcWWldJRr0s/QYrvCiCFuldlOCa4oN2xCtK
   S3kNSmq7tQ5FvxKglXubRCkfPW5mpJCAYtXOR5mKJcy1Z4DKpq3T0jWHx
   sApRiiAcnbbMn3b9bZ5ROyxZ2AQjoMOpQ1nRiKObXglW+JockvJ8N9znd
   5lkuREsYu60fc93wRUl+1KKTzzReqfr072DYdytu+wF6Xx/FtdnECFSQ3
   A==;
X-CSE-ConnectionGUID: GsvJDoWzTWS1IHpRMj8FDA==
X-CSE-MsgGUID: PHWG4OImTMm5kPMMTG+GCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105930428"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="105930428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 23:39:35 -0700
X-CSE-ConnectionGUID: b0YXPFboRjiLyp+2DClZrg==
X-CSE-MsgGUID: ery/tHecRT+o6ffFyomIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="267378101"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 30 Aug 2026 23:39:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 91F4F99; Mon, 31 Aug 2026 08:39:32 +0200 (CEST)
Date: Mon, 31 Aug 2026 08:39:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: fy15309206903@gmail.com
Cc: Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Stop waiting on a path pending bit that
 never clears
Message-ID: <20260831063932.GB124825@black.igk.intel.com>
References: <20260812-b4-tb-pending-v3-1-3a292e7194c9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-b4-tb-pending-v3-1-3a292e7194c9@gmail.com>

Hi,

On Wed, Aug 12, 2026 at 11:42:09AM +0000, Fan Ye via B4 Relay wrote:
> From: Fan Ye <fy15309206903@gmail.com>
> 
> __tb_path_deactivate_hop() waits up to 500 ms for a hop's pending bit to
> read back clear. On an ASMedia ASM4242 host router the host interface
> adapter latches it once enough frames have gone through the DMA ring and
> never clears it again: the teardown finds it already set, seconds after
> the last frame and with the path still up. USB4 v2 table 8-23 has the
> field read only and zero unless packets belonging to the path are waiting
> to be dequeued, so the wait is right and this adapter is not.
> 
> Make the wait a per-adapter length and quirk those routers to zero, which
> leaves the loop reading the bit exactly once. A hop that does drain still
> says so on that read, and one that does not answers -ETIMEDOUT without
> burning the timeout: bringing the interface down takes 6 ms where it took
> 506.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Fan Ye <fy15309206903@gmail.com>

I moved the constant to switch.c as I don't think it needs to be exposed
outside. Please check that it still works.

Applied to thunderbolt.git/next, thanks!
