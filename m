Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836999;
	b=sb6R7PrSMP/SVfP0zf851ig0SJJT3ScdSiS50I6De138XbbfQnvHmrx6tGqLkwApX/zp
	 3i7EW9h/rKGgnJ3rFIJCjzcSxISVBtM0j8IPj8vHK8bOOfIB7LjMe08YV3C+Q3/0nRwLS
	 YqY458FIvpaLNqWZkl2JTMboPALBnUBxhjb0LSIVh3RYv92M2JYJW/cYeSDkUYaRPw6dp
	 F5cHGh1z91wdkge58OkTiDjl1AbCd25fzy3BV1necs3epM5lH1FLNIOpQBwQGl2UN+rm4
	 4yqR4JGM4wTTsfkRBz4NLD2toAlAuiKPRLvi7GNQ3AJ6VfAXYj2pzOtEBKk9r+74kCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836999;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5UwdWb2Q4/sRM/Hk00jJ7GY/s4MbqtlWMMcqBmAvxo0=;
	b=EdPNpX2uimqHlYDZjrpVHkjyczmkCuC2Nk63gYw31ksGqMCMfjB11FjONjKO25PwHghe
	 b2vlfA8nKOsq+4RI5EBrfOHuzaD3LfSDvVhaVm5SUQ1winxBAqbW9fz7nGEtkNxdRWPQ9
	 ljOtqGLr+T6jmewGV2RBDIW7WTLNPrur3mg3ld3BSoI2hChmUFOanQ7S9Qva9NCbQwH02
	 aokWRRHgmX1fLsadInCQsCLb7gWRl586orUEkRSFpIlFig7eXtzSJqQxqF/z6BDO8Hgsy
	 9MNHAHwuNAsO5dRd325aE66cVd3ihn4MuhTyflqKwlFN2lxUWb+o/niIgzqXNxQUyRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hSgZqO/X";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358D606A8A0
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D358D606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hSgZqO/X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794836999; x=1826372999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t9LoyUe87lk31w4+F5yK1A70gun02zkcX2zOqTcMMyE=;
  b=hSgZqO/XHEt7f5avqqCL6Z7MHdExFmQzaYBVNBhKe9BW+nVpT48jMsa6
   Prbrv+DxeQYvHYN5QMdsA0iBLXfb+1JBDQ7RYNKpVz+riqF4M2TdL2lEh
   ALAq5jvtwMjmeQPD5A3bov9sYFeBnlqHmcT+ZPX5X9JkG0S2+a8F344yE
   07qxQ7aG7fnalVUD2GlcJWpiv1L/HzB0P9IWxdRZopOOOzOZATR+L2sBr
   XdBbcKKG85HVrVA8/g+NeRziaFwtpEMyGkkYWHJwbDmUbIbs13RCUVVHe
   XCLEFJHkTiBLmuO31iqJONJbB8bCtlPsny4l9KZ7PPzoDVvqNM4boD7WQ
   Q==;
X-CSE-ConnectionGUID: +zjNQdijQYGf8mQd07FU1A==
X-CSE-MsgGUID: LFM/u+TYTnuuLy/t9auTRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3563928"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3563928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 05:49:11 -0800
X-CSE-ConnectionGUID: qtheriMmSam6kI7v5QAzKA==
X-CSE-MsgGUID: I+0ZHPiARY68T/MrJX/yFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9957836"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2026 05:49:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 514C199; Mon, 16 Nov 2026 14:49:08 +0100 (CET)
Date: Mon, 16 Nov 2026 14:49:08 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: debugfs: Use DEBUGFS_MODE with path
 config space access
Message-ID: <20261116134908.GV259790@black.igk.intel.com>
References: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
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
In-Reply-To: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>

On Wed, Nov 11, 2026 at 01:32:47PM +0100, Mika Westerberg wrote:
> Commit 398da8e64321 ("thunderbolt: debugfs: Add write capability to path
> config space") added write support to path config spaces but forgot to
> update the mode accordingly. This fixes it to use correct mode via
> DEBUGFS_MODE.
> 
> Fixes: 398da8e64321 ("thunderbolt: debugfs: Add write capability to path config space")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.
