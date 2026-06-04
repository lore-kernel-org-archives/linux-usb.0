Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1623BD02;
	Thu,  4 Jun 2026 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549238; cv=none; b=T0oMTNnbAmYBRUYUEq4Yk44m1rPQ76s7IMofExqfhn5CIBp1tFGmYhjn2BYY47XZN9r0axzEpFC4TnFDfJ8k0ANfWrbtR87rVc5cwc+B/1zSMTA83IOIwsPgr+OVzDzDpPo5yZjbOHUIK5s4uJ1z9TSXWYYBN5K9VVAVhvVScoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549238; c=relaxed/simple;
	bh=I73ZznHo6TaUxfmQaJc8aowYjPZuSwLYzBM6+CQ3ojw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+nJiVOo9NKysjC1Qr60Tb3M+KYF7tRSGy6pk3ZRN24ouK0vGm+0+yqY0gOqhfnjileaOQ2go54OkYHWQjqHp9zH1LiStq6UjXQI0Z/s4x6P5CYeCi/Wpsyw/KZCfE/x5JOR8GgJmxrVz9Tp/cNkNQC5gAdE3dR/sxTTszoOkP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfSYTBer; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfSYTBer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780549236; x=1812085236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I73ZznHo6TaUxfmQaJc8aowYjPZuSwLYzBM6+CQ3ojw=;
  b=KfSYTBer+SqtRp8a8DNPa5G5vjP7dezkf3BV075LvQ3fBWURXj4CXcb7
   54zkXnxziniVYIsqFcuDUdEfltTGI3RwxCQC92hjCqSo+co1ABj04op9O
   oGvuVge+3m8F1LTe5sapT0WB/KQGEtOexFBCjKpLq71dg/0hnp69m2Nmi
   aN1ou2v8bGTfD6ICSDMXHpX26GPu/AqtDvvqCBJUBZLXMQXDrhn+mubhE
   EHLdk9J3XFMc0kQU3Mno91N8bJjpfb56xh2AaQx1sibbLxI/PtHuU+mIk
   f2QtQK4n5AcG85KuLBQibrowMgTOdgg5AdLysRq9DHAmuYJ/W9DpWi9kO
   g==;
X-CSE-ConnectionGUID: wLlDfUTsT6KOhswzBZJn9Q==
X-CSE-MsgGUID: ehfazAnTSSyskE8CCW7AOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92478148"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92478148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 22:00:35 -0700
X-CSE-ConnectionGUID: o44oNT5cQlyTzXKUbKquaA==
X-CSE-MsgGUID: W/41T6BoTUyRtY7ZFY0GMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="244518019"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 22:00:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 91D6898; Thu, 04 Jun 2026 07:00:32 +0200 (CEST)
Date: Thu, 4 Jun 2026 07:00:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: fix margining error counter buffer
 leak
Message-ID: <20260604050032.GG2990@black.igk.intel.com>
References: <5DD51F2D1DD8155C+20260603095957.1126008-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5DD51F2D1DD8155C+20260603095957.1126008-1-raoxu@uniontech.com>

On Wed, Jun 03, 2026 at 05:59:57PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> When USB4 lane margining debugfs write support is enabled,
> margining_error_counter_write() copies the user input with
> validate_and_copy_from_user(). This allocates a temporary page that is
> only needed while parsing the requested error counter mode.
> 
> The function currently returns without freeing that page. This leaks one
> page per write to the error_counter debugfs file, including successful
> writes and writes that later fail while taking the domain lock or because
> software margining is not enabled.
> 
> Free the temporary page once parsing has completed, and also before
> returning from the invalid-input path.
> 
> Fixes: 10904df3f20c ("thunderbolt: Improve software receiver lane margining")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied to thunderbolt.git/next, thanks!
