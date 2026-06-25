Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363403BD246;
	Thu, 25 Jun 2026 06:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370147; cv=none; b=J04fS+/ibrNmBfc0cgLk0BPFOxLjwNRUcefQNCkIlg3Kw9mD1uDNWLAIUQzDvbYBrkVpkRTSCD17AsDX0LkXvjcX4yu/1g27EOqjz2PM0negJIbnvffj+dGaM2srqbm6j1xgP0qC+bN4Ip2NUkZBO7OWbArW3ClHJbkmIV0f0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370147; c=relaxed/simple;
	bh=USH6QzlxFSWwIXcqigw+l5bJcBEjPq0rlJjrjDYEubM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnWGF4z4l8vKUuVCuEgyJeneCjqat5yaIukpXKUwTHsAP4X0WX0ZRxN1oYcetgtUcm+ChR45P1Nr/tXWLGgPHNWS5c8df0KV90RwhW1NgtBEZfG1JgtSuC0dwSeF/7exCUM9LXspH0zCIt5sx44RX1GCxKlKUlXkZYNeyak3Hq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARoCYijY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARoCYijY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782370145; x=1813906145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USH6QzlxFSWwIXcqigw+l5bJcBEjPq0rlJjrjDYEubM=;
  b=ARoCYijYl3Wm9ohFCJDY9armnx/nKglvwPZP0ZLZL/lvmDds8ZHBzCAc
   2nuzZ2d+aSJe9UCxOh2kBvkGGER11yP7zSzwiGdjjJjRX+1yYOdtyGNPY
   ABXGGSBfxVrRCn88VD5ClclI0t/VO45wa17MO3scGTWzGzM/r/s+AjaIT
   5Mcxgh3REbDunKgv2xiCZtVYhsf929kShyLcQfzWe9OqQ/vkr7Co+HKUS
   xTDXY9Zgff4irUJcgrggxJnnqlpxlvhwN+JUEGoNrjvARCnPbR4AuGEI2
   c0kX+8GpZvqAw4kYg7Jcswnu6PD6j3/mZWIdlvw0HL2q8QMDpDUzGs7sZ
   A==;
X-CSE-ConnectionGUID: Vb+CNITHSTyeP/r7c8V5yg==
X-CSE-MsgGUID: BHDpxwifRWKlQhqRhgeCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82259846"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82259846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:49:04 -0700
X-CSE-ConnectionGUID: xDlxjvaLQ/K288sb4VACRA==
X-CSE-MsgGUID: MsOkcJafSxOXPdQA7+Q66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="246414792"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2026 23:49:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0DF4395; Thu, 25 Jun 2026 08:49:02 +0200 (CEST)
Date: Thu, 25 Jun 2026 08:49:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Milo Chen <cmh79479@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: xdomain: notify peers after enumeration
Message-ID: <20260625064902.GI3066@black.igk.intel.com>
References: <20260624060909.2610434-1-cmh79479@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624060909.2610434-1-cmh79479@gmail.com>

On Wed, Jun 24, 2026 at 02:09:09PM +0800, Milo Chen wrote:
> Service drivers may register local XDomain properties while discovery is
> still in progress. This can cause the properties changed notification to be
> sent before the peer is ready to act on it.
> 
> If the peer has already read the local property block before the service
> was registered, it may keep using the old property generation and miss the
> newly registered service. With ThunderboltIP this can leave the network
> service half-discovered after a warm reboot and the login request
> eventually times out.
> 
> Queue another properties changed notification after the XDomain reaches
> ENUMERATED so the peer can re-read the final local properties.
> 
> Signed-off-by: Milo Chen <cmh79479@gmail.com>

Applied to thunderbolt.git/next, thanks!
