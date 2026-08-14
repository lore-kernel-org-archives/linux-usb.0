Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32B3AD528;
	Fri, 14 Aug 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701214; cv=none; b=nnJMMosGPq9paEfZ+zjg68mFVHL6qbNscu/OJLSpSN/XCigXjB8lYYwrFQxepo9OxjwJTw4E20ADAf1asMPsgoKuxV6ZtLkX/HfqfVrYM0CKfoV6mMagxTOX1ukHuIYtjiSr89nxqr6PrTKDKrCeEQuHaELpEqdRQTdwF6HN+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701214; c=relaxed/simple;
	bh=P50msqmGToj6m1U1nM26bFNOxv+piPx+jmPvAkrk/tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8Drf2FfTb5n19U10k8dp8b7NXRKAVHMMCzz+xwKOxbYgfdgJdj/VCUVKu0FC3bCwkOpB6pvt5bN/KCdCFmT7EbgJY3sPRnfRNYqMGOWptN3mwBjF7WjVjhM6KjQRXmqoHhF26eG7cDfyBYBKAfU2eoQJy/VHlBZBSaMq6Gwd80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmWo38Zx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmWo38Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786701208; x=1818237208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P50msqmGToj6m1U1nM26bFNOxv+piPx+jmPvAkrk/tI=;
  b=CmWo38ZxnZufj7F2dPT7jnl8LOMIuhRvZ94aroJvz41f9kR7IAb5bFZw
   ia4WfVTWPDZOD/uWcijznxFzMG9ywnjM5nBo8aMbDThCar8vwwiYNWk+s
   VJen97Lwhnk3ulFb5AHgrMdrsFmpZcoww+S973wZjSTevucKD870Du0/z
   6/3YOl9ciBqCTD55LAR9rbajcdRrDWTapDmJHWHCBhqiSJClxpUpmLsYW
   VUjoez659gbN8KRNCWfhEZBkQwzCTF9ba3IsyDKJ1RnsPzV1mG2fkTHN8
   LRCEEZs/sql0DNEF5ChsmjmU+Ve3gsjg0CBkBttvFNhsaWcPVBCODq9lw
   w==;
X-CSE-ConnectionGUID: nB5qRXY8SjWY5XBTinzeQA==
X-CSE-MsgGUID: xM0Rzd4pSGeICeko0WeSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815266"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="74815266"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 02:53:23 -0700
X-CSE-ConnectionGUID: IjoJ53CGQ8yQ6Fbsa+l3Xw==
X-CSE-MsgGUID: V9pMgBuvTrCq8+lA32BrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268037172"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 02:53:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 10EEA99; Fri, 14 Aug 2026 11:53:19 +0200 (CEST)
Date: Fri, 14 Aug 2026 11:53:19 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <an7lj2g1bAkOZw-o@black.igk.intel.com>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>

Hi,

On Thu, Aug 06, 2026 at 11:37:21AM +0200, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/usb/typec/tipd/Kconfig    |   8 ++++--
>  drivers/usb/typec/tipd/Makefile   |  11 ++++---
>  drivers/usb/typec/tipd/core.c     | 225 +++++++++++++++++++++++------------------------------------------------------------------------------------------------------------------------
>  drivers/usb/typec/tipd/i2c.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/tipd/tps6598x.h | 121 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 276 insertions(+), 195 deletions(-)

I kept you wating so long that this does not apply on top of Greg's
usb-next any more. I'm sorry about that. But since you need to resend
in any case, one more nitpick/question. With that, for both patches:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> +int tipd_init(struct tps6598x *tps);

How about:

        int tipd_init(struct tps6598x *tps, enum tipd_hw_variant variant);

Thanks,

-- 
heikki
