Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A819538DC54
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902154; cv=none; b=GWC4dcpQUGj8RaCfFHskDxIIPx2tGISUsJJzPSZzOk9G5FfXMi5i+A99QgbHV7diTpY5mDi9xnA5Q37dFXXWM88rcVzL1htZTR35BoDWQ2CGVWuVdu3jKWL16nO4sg0v+Hox9XhjegqgFmwRu52rhI5q2+YD+stccEH2rtmQucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902154; c=relaxed/simple;
	bh=mrlmh2dc9IuSndKksJKyqEbjpMesCoJsxoaVwLehY0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxywIAXHfxVlTf2KfX3gCDayoar9l6BvJH6LOLWGeRhxGwLZs08wcxIl+QSJHwP+SK74IqR5h4d/EqkQMuusBtAhzmD9UO5IR23Czy38umjEXb0iCh0Bd0S6aUrT1tS0CNLzTAoGH9evr4117t56RpBMokr7airmMpJBP3AdHaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIiQ7Mu2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIiQ7Mu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785902153; x=1817438153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mrlmh2dc9IuSndKksJKyqEbjpMesCoJsxoaVwLehY0Y=;
  b=MIiQ7Mu2GwTJRdoxJzyDcoLITWTtkQbcNnqgtwxxVUV9gd4EEBR0G9s5
   60fg6gIo2bD3h0lq8LmIfRpL+jtEwx1TV8w/vUl5inp+MXiH97jxa8jEi
   9WsYcQ1XNOg0OdUO/OQmk9YnUzK7ue8SPFwTBJustfLOK4fSZ/XQfF/7n
   IJRNSEDfKlk9jqirQcQevYtbhnhgBbedWxlGVEvh2bA2sHIrqo16J+PWO
   /y87eQ2StFB8mcxalZuJfOekRTstxmUJOznS8zVSLqKoV8rfrYddCPoH+
   DKW1zOEdM8mZN541ha1cL26stEJO/XLPFiqGBnoU7qXqa6Q1kkfCW5qnI
   A==;
X-CSE-ConnectionGUID: XeVX7VwqSdSSGu8LpbUOtg==
X-CSE-MsgGUID: +ekTVAmZRSCXr5TN8/3nuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90353301"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90353301"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:55:52 -0700
X-CSE-ConnectionGUID: L+7Y7BT+SwKPw3Xf3b5e0A==
X-CSE-MsgGUID: T+is7GX8SfmDtTROwcLEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="259924407"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2026 20:55:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C9F8A99; Wed, 05 Aug 2026 05:55:49 +0200 (CEST)
Date: Wed, 5 Aug 2026 05:55:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 0/5] thunderbolt: USB4STREAM improvements
Message-ID: <20260805035549.GD235112@black.igk.intel.com>
References: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>

On Tue, Jul 28, 2026 at 01:51:36PM +0200, Mika Westerberg wrote:
>   thunderbolt: stream: Restore consumer if copying from iter fails
>   thunderbolt: stream: Fix possible short reads/writes
>   thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well
>   thunderbolt: Make interrupt optional for rings
>   thunderbolt: stream: Add support for busy polling

All applied to thunderbolt.git/next.
