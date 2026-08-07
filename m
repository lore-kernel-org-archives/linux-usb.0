Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B18411FB7
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104120; cv=none; b=OheaWAqvF0iC9cH5R16UX8Q/lMeUiXrFYLwfum+3c3EV39+2XvS4eGfxW7Er5w+5oUoNjAmvEsJTfx77bq/cHfkoJ0XMnvJdQ4o9dfK3wVU3J3m6TeronumnjpXQFPIbMmyJUn+VbygagsadY+RWcr1pHP0PW/syjrokj4b6+DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104120; c=relaxed/simple;
	bh=rPFRAY5NiI+iqvTX0NMwlodQySns3nh6OVUp3vVo5eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuES7bufZTxXvRbuZk1Hjs45rni274j1Oz31k784xpR/LPmZXP7Y01BxDuNw2TVCyclZ/r95+McC/uWqcL4Qe3HSHBo6RWBZpVOIEQAyebTI6o39/olLt18wsjERrCvrXyC6i7WrOevVTaiVfKroZIut8nSo1Tj9cq2FaeN8fUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mgzbtbRk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgzbtbRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786104114; x=1817640114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rPFRAY5NiI+iqvTX0NMwlodQySns3nh6OVUp3vVo5eI=;
  b=mgzbtbRkq9EsyY1tZolFppSxdNMU18GSQjad4EsfE8rdnkyLCj7p203h
   B/qCT0wsu+mGvpjwkw2T7Vhi6r7OCxDNfMTc88kziidMEHe3Qdk/QbxFC
   0oN/pDKNQmdqfMT/MgT51C720ca8TKc9EXkKyxpor6q1iF4IcW35PNmZ3
   Q0ldUb508OcTg8T1lBa6xGvXk/lnanfsUY3q5CuvR3dsCR/UMqqcEtzoq
   0q+k7thRVT94DBMVV2PVW1I8tIeAul6Tp67Ljy6X2Epjy3ASgzpDObd1X
   4HGchzmmeJk2AvLa0pT8dlmug+/gMOd83Xynrob14v6qcyoWhPhpol1DL
   g==;
X-CSE-ConnectionGUID: Bvh5uyEHRCi+mWqV4cnumQ==
X-CSE-MsgGUID: Oi9xqXDvRfuEZshTsZTdrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98222949"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="98222949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:01:52 -0700
X-CSE-ConnectionGUID: z6FSXdZUQcKpJ5EiK3cYIw==
X-CSE-MsgGUID: 7hYlRAboTjmd/FZBUdv4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258074076"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 05:01:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 87CA399; Fri, 07 Aug 2026 14:01:49 +0200 (CEST)
Date: Fri, 7 Aug 2026 14:01:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
Message-ID: <20260807120149.GQ235112@black.igk.intel.com>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>

On Fri, Aug 07, 2026 at 02:47:54PM +0300, Dmitry Antipov wrote:
> On 8/7/26 2:31 PM, Mika Westerberg wrote:
> 
> > I'm actually not sure how this was even triggered
> 
> :-) just as documented in https://docs.kernel.org/driver-api/driver-model/binding.html:
> 
> Userspace may override the standard matching by writing a driver name to a device’s
> driver_override sysfs attribute. When set, only a driver whose name matches the
> override will be considered during binding. This bypasses all bus-specific matching
> (OF, ACPI, ID tables, etc.).

Okay through driver_override, thanks. It also says:

  Buses opt into this mechanism by setting the driver_override flag in their
  struct bus_type.

But that's not done in struct tb_bust_type.

So there should be no such attribute available even.
