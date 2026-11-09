Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222007;
	b=Bri6WKUtDiGV8XPSlpE3wQi/d/XuypWkLMub9B8wPWqwxoV+is/j8r77eiU/CmUkL4iK
	 D/YOLb9HCKiD3aUPJJsfJEUbYxbhBVJAAx6bBcPpb25w30+YCTr+ubKPYRtzA48GJEI3V
	 yW/Kxqq2Mw4gRx2U8lkk3QtJzJOiLdTheZzSwI7bf/tIr13TC/5Cn4F2SoT5b4qMddaVL
	 vu1XWYLKNtsqkhYPIz6itk5rXJUlC8iBOHeIwgypTdqbbWw4jk80hyQ7GQyf8sIPsQ24I
	 A99PogmEKoizcXgiMOerO4+YqPsSOL4ReMaU3wwmf/1fK/XBGT7oiGHxXQNwsqLMaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222007;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=j//nYA9C62il8MqUOEqMsij10uAhFNO6d/HkILZdN80=;
	b=zRySb5RMq+m5scFX+vlWlu+dBuhCwVJiZD8E7LtEGDVpdGERKrAqv4V5UsU8fMUYk9ie
	 7J8iPoD8dRe358+2dH66ds1kTTj5+Up5QvVdJINw/iLSTj1KuXZ0nXQDma3tyVI1Xk0FM
	 L3TTfQ7bhmQQTZPmlGHhWOkknpIj3clStFv8I0JWczaIVYsV6q9Njvf3Z1YUeMJsijexf
	 0//kPYJA6IMXCAev0ZxEc8W0/lcmdlmqIIBWP+Vwnz+rcZsa8w2XMgt2AYdqt4zKZUHzm
	 sg207y91uhdAFBKc5YfdhAxK/wueehB5HGGxF5AnVzRjWOsg4DGOL/brjBs+Y+DBV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EFIf04q6;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F6606A325
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 11:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EFIf04q6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794222007; x=1825758007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gcMoinWMvDRg38g23uXXHUKYcgL0ztWODRcxnT5ExAU=;
  b=EFIf04q6Q+8VQ5BPf1uDPlUSmfbdnmAZlatnWTJhZ2IALj0cc5CvMmaC
   7LP8Nf6CB5h756iGZ4LCkHvrMd24WtFOuptMP69h7gGH98nK3ua07TYtX
   yZssC9biBKXITHwQCEg1TUCMs+8BO8g1cMz6D5aO26ZSavqQpeZeb7nzn
   NxD/DKcEiHoeA6EiVQCFMMAcjvbM4Tz0ep/JMf3nzNNkrS/WaiRCSDAU8
   BNnvt1ob3f/evOOohzwuiq5DkxhVCwyQUqAufvutwD+YBRvABRpihRkrB
   5uIZQSBlg2NykHToxeunNkcHU4RC/9QyjVoxXpjCEpJEb6v68AY/aVxrr
   A==;
X-CSE-ConnectionGUID: gvtdaRiJSNChqH5iFvufeg==
X-CSE-MsgGUID: jHlufPx9QAypYjCjmXmfKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3041590"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3041590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:00:07 -0800
X-CSE-ConnectionGUID: EEGuTreMQSqJEkwYIRFq0Q==
X-CSE-MsgGUID: PAhiZbPZRtKXHFIBBmrxgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7868357"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 09 Nov 2026 03:00:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C2F8299; Mon, 09 Nov 2026 12:00:04 +0100 (CET)
Date: Mon, 9 Nov 2026 12:00:04 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mykola Dimura <mykola.dimura@gmail.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: second DP tunnel starved at boot while first
 tunnel's DPRX read is pending
Message-ID: <20261109110004.GO176724@black.igk.intel.com>
References: <CAGYMYpgLU20vVmwnWyQkYgvjL=fo+Rb8TxYJUu31FSPnhJ9DpQ@mail.gmail.com>
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
In-Reply-To: <CAGYMYpgLU20vVmwnWyQkYgvjL=fo+Rb8TxYJUu31FSPnhJ9DpQ@mail.gmail.com>

Hi,

On Sat, Nov 07, 2026 at 04:11:22PM +0100, Mykola Dimura wrote:
> Hi,
> 
> With two monitors on a Thunderbolt 4 dock, one of them comes up limited
> to 4K@30 after every boot (or dock re-plug). Which one gets 60 Hz is
> effectively random. Plugging the monitors in one at a time, in the right
> order, gives 4K@60 on both until the next boot. The cause is
> the order-dependent DP tunnel bandwidth reservation in tb_tunnel_one_dp().

Yes, this is by design. It's now called the "legacy" mode because it works
exactly like the firmware CM: first monitor gets all, second gets what is
left. So plugging them one by one is the correct workaround. The solution
to this is the bandwidth allocation mode but unfortunately it's not
supported until Meteor Lake.

We don't really want to add any new command line parameters. I have an
internal patch series that makes it possible from userspace to affect the
monitor selection via eBPF but that's not yet ready to be upstreamed. It
would help in your case though.
