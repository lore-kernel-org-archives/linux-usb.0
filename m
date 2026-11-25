Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617337;
	b=IJ4+a6NK+C1BY3MD6XKUAb2C1hvo1je5F1VZ86NKLZjK02mOlVRMFTYYc2TsWZ6bhF6K
	 0cOykCU3P/vxHaBV/j7jPy+pb4JUlcb+EugrouptS8ZfD4ZE4gMjX5IaLHPh4yq8HT6Zn
	 nlchMX6zt9nGE2RxW5uaHxgFrv+quu6E5rdV4+rwl42OFsxJaTMpUhdIMgeF+6KS3L4d+
	 6yo13HNHUpnLFpxlP1RsNC3EWZrxefVoGjuK4Mcw1Z82zq6lxe7C5kjTuYi/eWxGHCtXv
	 z6YrQ5ncXnBMnyJD0gv4rEfBz9TDm93R6cTeRLm68CJpKep9UayA+W6dmLrQS0QtZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617337;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Gijn1uWjB8icT+yfjdQ6IQLTf7M9XlefB16ehNCmnwk=;
	b=uY7Zl6TuneKevLCW5rHwGSY33xi6k0w56S6SnqdcAUDOPP+vcTVbMJLcKUS+lcKXObOg
	 oBKtfhFDXsZJ3DjI+veDof6WgC4hqoQspN0JLLEZxRpO16E4N9d1RUjsiRNU8ELwtdYBX
	 r6/e7FaA3fP0zI0O1tsIyxM5Th5FKbBo5JyHqHZmWY1BE5UipVJ/D1ul5sTmqz2OlHnTS
	 E9JfrSjbQsYwa+MZZHOZnh0eBDRykiPhybFgBX3V8x3MXGLyPJZvwieOMmcH9RH+PiYZX
	 7MEmY7nswRBc7EIGfim4kGCEdYoV0ozz/3av8FSjsT+Y1TFYwpcDWCW9kl0O97Ji9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqaBRTvX;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB8606A321;
	Wed, 25 Nov 2026 14:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqaBRTvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795617336; x=1827153336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9aMYRY1zY6Cf2dTP1KsnLud9sM0AO7Maki6JqLURYSE=;
  b=dqaBRTvXKpfZJRlb19jbxMCM74WtkEKJp/X0H28tObHXTWuvBkz6Mgi6
   c9esvlOoCVPlHZ5MS4bXUOyk6iMQTlJApaAfS7EQcR2aAqKjSaWJms+uV
   7anLeUK55hOp0Ei6GUycKZFWBnpoImIhsLaClQKsSd6Ot06JzRsmU4mFI
   PfNSY/IHzG0gYXpXdI2eWeinABpS/MbQ3FZwyDfmt2aZ2M6u3MXeUt4gi
   6TMd+XJNt++MN3+f7aBfBAP8NTDQhMSrYTrXpvV5H86bUjedvZVl7MIkg
   n47TMElwGRi1odwLkWyJBoyHEV28uWL3/VATy8KVrnJvuhk6HJkLMndsV
   Q==;
X-CSE-ConnectionGUID: qeme2EaNTrixvFrcMHamXw==
X-CSE-MsgGUID: uwoRd0PrRsqCJmflSZ8w5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4556711"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4556711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:35:35 -0800
X-CSE-ConnectionGUID: i7ZMmm8yTXCQ7PIDdPwlAQ==
X-CSE-MsgGUID: jTpXoPN2Rc66ZPMOrlZ+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11769557"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 06:35:33 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8BBE098; Wed, 25 Nov 2026 15:35:31 +0100 (CET)
Date: Wed, 25 Nov 2026 15:35:31 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tobias Heath <heathtobias@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
Message-ID: <20261125143531.GG191152@black.igk.intel.com>
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 02:26:56PM +0000, Tobias Heath wrote:
> Hello,
> 
> Many thanks for your reply.
> 
> 
> On this hardware the dock-side host router is pinned in D0 by active USB4
> tunnels and has not runtime-suspended since boot (active_time=515s,
> suspended_time=0). The quiet host router does go to D3cold exactly as the
> spec describes. The s2idle_preserve=1 path keeps the state that runtime-PM
> would have kept anyway — it prevents the system-suspend path from forcing a
> D3cold transition that tears down tunnels users still have open. Would you
> be open to a v2 that scopes to 'suspend target is s2idle AND domain has
> active tunnels' rather than a global module parameter?

Okay so you blocked D3 entry intentionally. Why you are even entering
s2idle if you want to keep the tunnels up? Why not stay in S0 then.
