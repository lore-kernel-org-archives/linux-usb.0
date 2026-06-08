Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1A82D2397;
	Mon,  8 Jun 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915730; cv=none; b=Uu+50SCn3jm1zepmRIxxrxJAC/ficyLXy2Ys+E9m2lJGSqqajJ+Z6fQxr8TkPeG7q4T7E50Ll+mfombveBR5nkRN+EGBxeTpEtsSwE8q3RstafpEITLCXjtQWBRKsHJV7btGRuIt7ybYSpEYhFIhnqn7AbnhymK03Cz1w7sqSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915730; c=relaxed/simple;
	bh=ssYa1fJNxbCsoYq5Jt9NPp0P3jZocCaaDGcb3WopvYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sm82CWKjp8ET3UIHwUki+oMjx1Cd4XHX+ncGV/hsI3Kdj5Miysng547XNLyVXD7NRV7Avtq2eQfJFl70+MSqtppZ3A2GR/BOXxLzFlWH4vY6u+T0Rgw2n75ev6atg/kkenFQISfeU2Z7dcVGY7DV9W/1xgxNRfv4akdXUqewST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AasTede+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AasTede+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780915729; x=1812451729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ssYa1fJNxbCsoYq5Jt9NPp0P3jZocCaaDGcb3WopvYk=;
  b=AasTede+xY01YWdy/AUK5u9AbiPq7/4zrijzPyj/nDG5GW55W6GwJtTm
   sb6+IMbpn9hR0KxS0c+su3bdiOGkUPa7JHNFeyM1CK9x3SHpSgqK47gUP
   1hauVRrhjNHrXEfwuLtCDQoI+3seoW4gztDvbxpgtQa+dCx+HU4CHojXA
   3svit2Flp6XZR/BkB8wBHszSTc8V7bL1TgNV9H+qoSlFTK8aNJqbzXo9S
   Hu8KA0GUHTjaWyzTd3QXFgb+UkFPwk3jjzB8IhBx1xZsHoR/MZ59N0+Eq
   XzT4g1JHEb3ubypdL1Wes9iwXg/4DDXP2Ab47laX39pA8BhB4tKvSMM44
   w==;
X-CSE-ConnectionGUID: jfP7JYzsRZutbqAuhBmrYA==
X-CSE-MsgGUID: Nh/iRtB8Rg+5NgAXTKZVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85535083"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="85535083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:48:49 -0700
X-CSE-ConnectionGUID: aYFUp4aKQp+rCnDGhkys8w==
X-CSE-MsgGUID: 6DauqA/ETpKS4qkIP35IoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="269224162"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jun 2026 03:48:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 374A195; Mon, 08 Jun 2026 12:48:46 +0200 (CEST)
Date: Mon, 8 Jun 2026 12:48:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: fix sideband write size check
Message-ID: <20260608104846.GK2990@black.igk.intel.com>
References: <E4D8CB8444A9950B+20260608063147.794444-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E4D8CB8444A9950B+20260608063147.794444-1-raoxu@uniontech.com>

On Mon, Jun 08, 2026 at 02:31:47PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> sb_regs_write() looks up the matching sideband register entry before
> validating the number of bytes to write.
> 
> However, the size check uses sb_regs->size, which is the size of the
> first entry in the register table, instead of the matched entry. This
> rejects valid writes to larger sideband registers such as USB4_SB_DEBUG
> or USB4_SB_DATA.
> 
> Use the matched register entry for the size check.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied to thunderbolt.git/next, thanks!
