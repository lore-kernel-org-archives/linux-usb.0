Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70053F4854
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096753; cv=none; b=Cxmpd/HPpjRY9+V2NjaDaHvIocYwXxdadwS7lrBjaSVvzL/zlYzVVwFu+TsAQAwMIDYL7trWf0bDfy5kSPuh4hKS/IqAC12uV/IgEztiCNlDCsW6UCpROX+buyC6mz3mKb7VO/hzQKxOrZwbs4MaxTqfWfFm4JMzTPdCiioUmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096753; c=relaxed/simple;
	bh=dETVLT6IqalYFKa1vTHk4jQ/v29uTgsTtWbz2stxQEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0Y92UAdJ80pOv+hF+Le8e0js+MAgqiVQcucGfjOk0lUlxiODKkKMG8vX1NBlAwPC/nhpHW0hv696se0kYKXdzjuM6nUThigDoNvMdXA+2Q/euWCwLCTtMKxxt6mCUzW9FlReh95FUmv1ZCgXsHk5MbiJUsYKLaHjfwOrK62pIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQIym5QF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQIym5QF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786096751; x=1817632751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dETVLT6IqalYFKa1vTHk4jQ/v29uTgsTtWbz2stxQEc=;
  b=iQIym5QF8rEAwy1g2k5971WgJUqLw3wgmKzZ7KxaL/QKosNNOn7dGiXg
   0SJPBDqGeXI/im7kgRqtYbjbEHp+Tz3Ve5TSh/6hn33yG+N3gCwexmADO
   h1KbgFMGSUmVJJg74S9fcBM6W3IhKh2dYYcHnmdWOggaaZNIQKk+fY1va
   j37esNHT6UXcWgiAdEK6t0CZtTLgTox3Kb3WezI3cSF64iOKK23Bh/Pd2
   trj9h9JyFcPlHtACU2zUSZ0Uu0yxxthEGHoKYVBF9HsT2CPsfQd/JbwFS
   bTGbo/NVNFogUaa5ZHlM4WXMON+YbhWrNFoBq31cBffSt7862XFRMxTgR
   g==;
X-CSE-ConnectionGUID: ZxdNyOvyRdKS1NCJNxSYQw==
X-CSE-MsgGUID: ruf6yZqJTzeeyqAi2DgY8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90519388"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90519388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 02:59:04 -0700
X-CSE-ConnectionGUID: AAwbZ1rAQemrj3l6KF0b2Q==
X-CSE-MsgGUID: VfZ7CiuRS6+uNad8XPGwUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258053383"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2026 02:58:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0043E99; Fri, 07 Aug 2026 11:58:31 +0200 (CEST)
Date: Fri, 7 Aug 2026 11:58:31 +0200
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
Message-ID: <20260807095831.GL235112@black.igk.intel.com>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807083757.318371-1-dmantipov@yandex.ru>

Hi,

On Fri, Aug 07, 2026 at 11:37:57AM +0300, Dmitry Antipov wrote:
> Syzbot reproducer at [1] enforces the kernel to probe PCI device 00:02.0
> as Thunderbolt NHI. On QEMU/aarch64 'virt' machine, the device (at least
> with qemu >= 11.0.0) is:
> 
> 00:02.0 Class 0100: Device 1af4:1001
> 	Subsystem: Device 1af4:0002
> 	Flags: bus master, fast devsel, latency 0, IRQ 47
> 	I/O ports at 1000 [size=128]                           <-- Hmmm...
> 	Memory at 10041000 (32-bit, non-prefetchable) [size=4K]
> 	Memory at 8000004000 (64-bit, prefetchable) [size=16K]

Yeah, I'm not entirely sure we want to start "fixing" issues like these
where it's clearly not a USB4/TB NHI. IMHO If user forces the driver
somehow to bind to this unrelated device then she/he got what asked for.

> So call to 'pcim_iomap_region(pdev, 0, ...)' in 'nhi_pci_probe()' maps this
> 128-bytes I/O ports area, and call to 'ioread32(nhi->iobase + REG_CAPS)' in
> 'nhi_probe()' issues an invalid access at REG_CAPS (0x39640) offset. Since
> NHI's typical register window size is 256K, simple sanity check whether 1)
> the region is a memory rather than I/O ports and 2) the region is 256K at
> least should be enough to prevent from such a scenario.
> 
> [1] https://syzkaller.appspot.com/text?tag=ReproC&x=1564acc6580000
> 
> Reported-by: syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=901ca72278dfd89daf58
> Fixes: 16603153666d ("thunderbolt: Add initial cactus ridge NHI support")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/thunderbolt/nhi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 0f795ea58756..724263c17b3e 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1186,6 +1186,7 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
>  int nhi_probe(struct tb_nhi *nhi)
>  {
>  	struct device *dev = nhi->dev;
> +	struct pci_dev *pdev;
>  	struct tb *tb;
>  	int res;
>  
> @@ -1195,6 +1196,12 @@ int nhi_probe(struct tb_nhi *nhi)
>  	if (!nhi->ops->init_interrupts)
>  		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
>  
> +	pdev = to_pci_dev(dev);
> +	if (!pci_resource_is_mem(pdev, 0))
> +		return dev_err_probe(dev, -ENODEV, "invalid resource type\n");
> +	if (pci_resource_len(pdev, 0) < 0x40000)
> +		return dev_err_probe(dev, -ENODEV, "invalid resource size\n");
> +
>  	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
>  	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
>  
> -- 
> 2.55.0
