Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E0367B8B
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128327; cv=none; b=D1JrDAFnvMrwEFVopTs9Qk9NC6cbsxSMWCXWSDE1g9/FCRSjqpZqJn+taZDCBffuaGlTB5wxd4oByaOYXW2MPpn2dAWk4QtgmH8E5cKwefHYwELp7OiGu91NBV0UwyWd18Mypb9GdDEMQyx5Lfu9OhuB0hbYs2V8lFLGwROPI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128327; c=relaxed/simple;
	bh=2vYwhutOVrpvEQJrEiNT9GRRAxeJT2AYgR4d3LeO/UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdMX+mMa3jgrzxCGuO4IN1H4VUL55Ta8T1TOxfEhs3kMFpzU2APvgeskCQPDIMH5i/qZvqm5VPftrC58XOGwvbh2nJLuW+cFMU4lvz4/utM3D2uS3FRqoBDQl2yauuBGdgAL16lEXc9SErLvrCOIzskHRytI/EyWu+GNf5TOy2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GgRfgWdF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GgRfgWdF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B89E1F000E9;
	Wed, 19 Aug 2026 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787128326;
	bh=k/mllmbJ/SCFHBisvRq5+7b902aAqY11ouvMxt4Uz60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgRfgWdFE1JC7BDoFR3bmYgy9thMO1Awo9DuDTk0AwxBU/cjfGOZM+e8XWmfA/Lf/
	 MgZlVj6yHGCMsyrKoReAdsNS39Td/3cqxlt6qRfFY2KtLubSB5HbNFD32GRgok0I/f
	 TKndm9wb17zXtCtF9MAR2B7fk18+jjXdGCa4/03k=
Date: Wed, 19 Aug 2026 10:02:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v7.3 merge window
Message-ID: <2026081912-bullish-t-shirt-badc@gregkh>
References: <20260813090547.GO893316@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813090547.GO893316@black.igk.intel.com>

On Thu, Aug 13, 2026 at 11:05:47AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc1

Now pulled and pushed out, thanks.,

greg k-h
