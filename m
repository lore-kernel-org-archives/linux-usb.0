Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AF3D564B;
	Tue, 23 Jun 2026 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216774; cv=none; b=VKPcmJS8POyHEDARwJ0KCVrbtiR0wLDzBfiOPBJyx6+0vIMY66UpNy+UXKqSInPebTqRK3j0nHkRGUpS4OMRGzpBRhn31Il9qcRQqMf3ipexrHCuGhuGqHMzkpytAjyU7IIShRiY5NA+N6fbH9H7R2tmzq3G4qJPRXyxwoBPrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216774; c=relaxed/simple;
	bh=1zVehaIPtNNj7/QGqi/JCOJgCD7gju3UXdkntTQ8cSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgxaJQ3sVyIgZ6Mb3HT5r5I3tv5lo+0A1/3eHhze789k21a0OyR3F5StjiKYU4q6Di+vk+42KyL0fUQa7TajzjA0MFfTnYlTqMuSYtJGR7S9KfhuNZrl+jxFN1vh8C8VHuWqvM2RpWiuCoPEl0JvVpZ7Vcy1zO6KOnD7KhBKZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2ikakXe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2ikakXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782216773; x=1813752773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1zVehaIPtNNj7/QGqi/JCOJgCD7gju3UXdkntTQ8cSk=;
  b=S2ikakXeiy5EHF9DDFs1KYOtpf4ejr9uCN+okmgTS2qWsrdpTomqFgMt
   QTW2GvCb76WHSTGU0uN1/4S6bp50thcvzs4sQcmXbtbgEi2bABn3fX34O
   EHsuRnxj/IS4fXaiNTI0kmGS2MjK66qcLkw3tAHoEFQgviZRNEzyv0nd0
   ERQqGAuEHdz1rSzpIgAoNkimG9S5NcAfTEwME9ZW5vJqaHUJEWx05UwU1
   XRuwqbvx5ppkS8oUcDfI/h2bG/+dVByb2fE7KI38p1ga+HatQ/rjUOou7
   N+xpndFgwi2pxSd/xyDt8j4HhCULpJV36NOdEy2Babm70oTW+yfzEoJTD
   Q==;
X-CSE-ConnectionGUID: bOfJOZFoTw2ibuD9kKhK8Q==
X-CSE-MsgGUID: Ytl6CNW0Ro+pNcytLt2kGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82960854"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82960854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:12:53 -0700
X-CSE-ConnectionGUID: htrFZsPeTvOGi59oe56ZJw==
X-CSE-MsgGUID: WZAykranT2+rZYpFtdB3fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="254601897"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2026 05:12:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 717FB95; Tue, 23 Jun 2026 14:12:50 +0200 (CEST)
Date: Tue, 23 Jun 2026 14:12:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: fix bandwidth group reservation indexing
Message-ID: <20260623121250.GC3066@black.igk.intel.com>
References: <1ACD3C00B2C83FD0+20260615090348.3058017-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ACD3C00B2C83FD0+20260615090348.3058017-1-raoxu@uniontech.com>

Hi,

On Mon, Jun 15, 2026 at 05:03:48PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> tb_init_bandwidth_groups() initializes each bandwidth group with
> "group->index = i + 1", so the valid group index range is
> 1..MAX_GROUPS.

That's because group 0 is "reserved".

> tb_consumed_dp_bandwidth() uses group->index directly as an index into
> group_reserved[], which has MAX_GROUPS elements and is zero-based. This
> leaves group_reserved[0] unused and makes group 7 access one element past
> the end of the array.
> 
> When Group_ID 7 has reserved bandwidth, the condition reads beyond the
> end of the array and may also write beyond it. The reserved bandwidth
> for Group_ID 7 is not included in the consumed bandwidth sum either.
> 
> Convert the Group_ID to a zero-based array index before accessing
> group_reserved[].

Let's keep it like that but can you make a patch that makes MAX_GROUPS =
7+1 instead? Thanks!
