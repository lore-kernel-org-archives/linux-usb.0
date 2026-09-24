Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9222F45039
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225336; cv=none; b=dMoUsnrOcv34j+roUtqwEtp8Wlck3UnN+pMenTjeHOhwvxXgcTvImn05mGAh2d6Tq4KhaOUovEvhQOOhaP9262kz5gHMcP68Q4IuyhHs/60hzjF1XRiMlm3n8+pN1Hfu2LGtGJQqO0GDNhnQ1Mv4mNMj74t4QDl+r8gf+Th5VFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225336; c=relaxed/simple;
	bh=JLwXeUV/PPg/K/w+jJRi2SNs7dqmXRipABI3YR/8/wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOATZW5y3khlpl3qO4EoI/ThWro98yorHvBJXNTeOIl+dPJmUh+cKs+DHsUBNXZyl4ZSNYm9H169EUfOhCKkAK/V1CDNuQx4aFi4c5Rz7bKTqR0GvKEltjNLWby7p7ANvcdKDHZEBUbKLn43Lk4K5mkTXtvp7aBzNKd7tyJiXHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1h8hKxx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1h8hKxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790225334; x=1821761334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JLwXeUV/PPg/K/w+jJRi2SNs7dqmXRipABI3YR/8/wU=;
  b=Q1h8hKxxYTU7yjzRv2kLnkcUNcivQo2XYstCBp36nxVOf+MdXA5LxdeT
   qvvj0Lvua8CJYhAEZM9+JWaXKKKsmOCCFPqvdrRPby9YGTI/fuq38eIMG
   imXo3K33BIoS9+j0aVIzkR/+5It6gSlSIcUi6RqMAzFe6h3sBzB3xoKKU
   IkhIOdZHShoEj/PVXdXMITTVc98D+h/ppYo7F62RHNaz50w3+YjhMs1Kl
   lXlELvHTcAH99Zpw0ufW88VwrxUGTyTlofsIsPdY5f6VKOj7OeOdlsMHk
   O9sWT6CNlmDYl0n201bml4o3HtUiPNXnYdbzvUob3QmGA+v8Q/iGAIAgo
   w==;
X-CSE-ConnectionGUID: A7EvcFptQ5iXzOMN6zrM4w==
X-CSE-MsgGUID: j1guksZKROKa/w6tfaS/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78538841"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="78538841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:48:45 -0700
X-CSE-ConnectionGUID: ioYIW9k5S8GF3W4MYaAwyg==
X-CSE-MsgGUID: P/Jc/WOvQu+Phd47iG2uZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="300162303"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 21:48:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E939E99; Thu, 24 Sep 2026 06:48:36 +0200 (CEST)
Date: Thu, 24 Sep 2026 06:48:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: stream: Make read return framing error to
 the userspace
Message-ID: <20260924044836.GL106095@black.igk.intel.com>
References: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>

On Mon, Sep 21, 2026 at 01:19:21PM +0200, Mika Westerberg wrote:
> If any of the frames are corrupted during the receive we currently log a
> warning and pass them to the userspace without it knowing they were
> corrupted. Make the driver behave better and return an error (-EIO) to
> the userspace in that case.
> 
> For the CLOSE packet, payload does not matter so we handle it the usual
> way.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.
