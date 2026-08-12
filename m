Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1353EFFA7;
	Wed, 12 Aug 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526637; cv=none; b=IIpYq08YUr0zGAj0RKY01ENPNLaAnmmstJ3TohyG7QtudFxe8Vc2dsqeL7CnkTZAKMbXzSyz4c7pVMjOnYMOTEe3T7r5o4QKDJqFgdqO38eE8hiX1+VHBLZeCLR8SuU/1V7iWDPDf74vCT/Pj46p/JOrIcwfF+ZWFKJ/MqBOh/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526637; c=relaxed/simple;
	bh=DUoamCv1baouGafIhgrV35bwmwNBmSgK3RH8sKg/eZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5UXlE7b0JXcNFN7T09X6+Mx1O13gBItTrEHCt4UdZamigVVBYrCF0aP5Peo9BuTCAk4FX0zo6kPPrmdpxtma4aZ4652gDSGf8WRCXzic3bfgshsV/F6uL0L3GihyhpGgfAu4fzetlNydEziQ2S7+6yJTocETgC1GtA1V5rgQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2o+X2Jx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2o+X2Jx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786526635; x=1818062635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DUoamCv1baouGafIhgrV35bwmwNBmSgK3RH8sKg/eZE=;
  b=a2o+X2JxHzYLCnCorvp3t/nn6pd6V1hf9Ov0lYjx0U0g46xRgKBnpGqZ
   +40w5rNBMKb6E7U84Var3JLJAqZnQ1u64TxiCC37XJieT4qQdEyh6lg56
   XeULkRtFQD6fcEvRQGaDefdnTKaI4uYRPnd8DXHxKhP4nrgGYke0Uh1m6
   D9mSMhHQnlH9IExqB0dhL4nWBJk6jP+CrZJXCj+HzA67yyRVjrKAdfz+v
   TG7OEUAzcK2sDWVcrGhGUD+AocC0LhU9uE3r6lmP17qOvTK6sWEf/JQsL
   ewnv0M8iYr1YeSAZyiuWr+BJpuCD0TnWMIB2d0pQTo4wWTy655Y0M+uCu
   A==;
X-CSE-ConnectionGUID: jbzZ5NUpS0WoxvjeFLhqQg==
X-CSE-MsgGUID: 0bWlxT8RSsGJ4XyxhB8gxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86928728"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86928728"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:23:54 -0700
X-CSE-ConnectionGUID: ongqlpyOTOSOOcCX4ss1oQ==
X-CSE-MsgGUID: gQfYczF2QVKy49GHbGvPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="263114024"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2026 02:23:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 86DC799; Wed, 12 Aug 2026 11:23:49 +0200 (CEST)
Date: Wed, 12 Aug 2026 11:23:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v7 0/2] usb: typec: ucsi: Add ITE IT8851/IT8853 support
Message-ID: <anw7pY2vvJAsHiYT@black.igk.intel.com>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>

On Fri, Aug 07, 2026 at 06:17:44PM +0800, Amber Kao wrote:
> This series adds Device Tree bindings and minimal UCSI driver support 
> for the ITE IT8851/IT8853 USB Type-C Power Delivery controller over I2C.
> 
> Changes in v7:
> - dt-bindings: define 'reg' for the connector@[01] nodes, since a
>   unit-address requires a 'reg' property.
> - dt-bindings: dropped Krzysztof's Reviewed-by tag due to the above
>   change.
> - ucsi_itepd: use guard(mutex) in itepd_process_event(),
>   ucsi_itepd_read_cci() and ucsi_itepd_read_message_in().
> - ucsi_itepd: kept request_threaded_irq() instead of
>   devm_request_threaded_irq(). ucsi_destroy() is not devres-managed and
>   runs inside remove(), while a devm IRQ is only released after remove()
>   has returned; an interrupt in that window would call
>   ucsi_notify_common() on an already destroyed ucsi instance.

Why are you answering questions here in the changelog instead of the
thread where they were originally asked?

Changelog should really only list the things that were change.

Thanks,

-- 
heikki
