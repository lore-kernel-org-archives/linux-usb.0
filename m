Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23D480951
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107931; cv=none; b=t0bBBnn8NqJzeRrKiPYGxHIPfjeq5fP8tKavw3eKyOXTdmS8WUIhFtXRpBl03XdWNzlySaezQVwdLWeqb+ZbZ+JIDe+NDUkA94GsW8Xmtvk9mvCk1ijVajcGXz9dHj9vD2ZfQLnNzcePwLIjBPL3seSEXKB8y0NEOpbUOulvKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107931; c=relaxed/simple;
	bh=nZfq80Nt1pofCpHtmdD367av/NFMOgb7N62PhwrwfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms9W9fK3ZuCarLLGJDSXC4BPGH92RRvoPjJzL+4TTbfqIKhiiVvKVbaVznaGAGT+nKY8qXZPRuRUHajDcStqDEAWz/LPDGo4yyaqhl1mVmARcQB54Fn5rE3rWXa75KmrQTaz7KIU8vQg/uXoUkCNxcj4piJCNdOExpXgS2fRKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8ne10ST; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8ne10ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786107925; x=1817643925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZfq80Nt1pofCpHtmdD367av/NFMOgb7N62PhwrwfaQ=;
  b=Z8ne10STBVVTX0GvQcOd+bvs0Hq+U2jTmfOtMl2C574/6vq71YgNDios
   zmBandaSg0HfWqQBbnA0GYYNDeUD6kZ5HtAwRm9jpeb5SwOeG73Ka7qj4
   RXxCMd/fipMWKbTm3iNKI9NZTtOSlI2XpALCD10rmZw+YLZKpLOkZ54gf
   Jw+qtiENpM5vmpiI4I/0OJ/ONmBKymgy0lPZQONqTGZ47TlJgVwS28qNa
   YvvkVH5zT4Fk3kLtuutm3CXs0GTp5P7pZ0ohEaG/fkZ5Ry/uUUaUdcE66
   yvUtB4KerQCWyxPKPRBlMsOFssWzG8DLmNpsZr1xBnek0jK0L2N7zE5tD
   g==;
X-CSE-ConnectionGUID: 52rKSHHiTTi4Kw3buequcQ==
X-CSE-MsgGUID: +NwugF6+Q5+W0OvDR9R96A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97065019"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97065019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 06:05:18 -0700
X-CSE-ConnectionGUID: Wjm0eVZQQU6wqnzhKCriGQ==
X-CSE-MsgGUID: Qe23ouEmSoeyT1p8TrngYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259789365"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 06:05:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 208BE99; Fri, 07 Aug 2026 15:05:15 +0200 (CEST)
Date: Fri, 7 Aug 2026 15:05:15 +0200
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
Message-ID: <20260807130515.GR235112@black.igk.intel.com>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
 <20260807120149.GQ235112@black.igk.intel.com>
 <6f6a7bc6-a686-484f-b654-17e0ceb874d8@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f6a7bc6-a686-484f-b654-17e0ceb874d8@yandex.ru>

On Fri, Aug 07, 2026 at 03:36:09PM +0300, Dmitry Antipov wrote:
> On 8/7/26 3:01 PM, Mika Westerberg wrote:
> 
> > Okay through driver_override, thanks. It also says:
> > 
> >    Buses opt into this mechanism by setting the driver_override flag in their
> >    struct bus_type.
> > 
> > But that's not done in struct tb_bus_type.
> > 
> > So there should be no such attribute available even.
> 
> Hm. Syzbot's reproducer definitely uses /sys/bus/pci/devices/0000:00:02.0/driver_override
> and /sys/bus/pci/drivers/thunderbolt/bind to make a trick. IIUC the kernel starts to probe
> NHI just like any regular PCI device (so driver_override is expected to work), and
> tb_bus_type enters the game during the probe itself during nhi_probe() -> nhi_select_cm()
> -> tb_probe() -> tb_domain_alloc().

Well say if it finds a random device that has BAR that is of correct type
and size then we are in the same situation again (and I think this applies
to many drivers -- that's why we have the ID/class or similar matching
there to make sure these bind to expected hardware).
