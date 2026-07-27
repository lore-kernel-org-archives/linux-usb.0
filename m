Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED3378814;
	Mon, 27 Jul 2026 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148746; cv=none; b=ImHNOHYyR5SO+MA/d+xNZWOYXVfQ4bOb50h+i2ZEHXC9BWEt4rKRQ8X5kkYVqFLMdD93a7uzcvMCOE5BCQ9HIkD+Udq66NI70p1ZYvv6NwJQZs6SSsebQC9U+wIoks2Mt7hnGB+ZII0T3nl9XkEvyj67VvmkTq3OR7PG65gx1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148746; c=relaxed/simple;
	bh=w6wUKYAyQ4AO01G0KPCkbFGYujaSnyFiCoNIJ5SMw08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrVVwFwk8kjoNNVII//B/vRI2swRlNWz1u9+alPeo2JJg3ivAzCPt8zzCmZG2QQE0pcHv8SBAgcIbI/Se1/wiwffdS7ty9Owstw+OD3RPvVBlsf1vaOxiWwlbIjZcg8gu++ceeyHbLHHPgeq17NaZwRRt9T7hmogEi2XaI8N6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DacCFS8H; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DacCFS8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785148742; x=1816684742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w6wUKYAyQ4AO01G0KPCkbFGYujaSnyFiCoNIJ5SMw08=;
  b=DacCFS8HF9QWejAtvQQN1zHY4Pdaabpv7pPaU5zar28fLonNOIUw63x5
   MR1cbHP+dz5Jn8aus0r/84J2ep4LWpDaZqecQIuvKAklUOFdJoYFmW1Ja
   FVnKyAfN0uocoCVx09qH18bs6N0pdWmm/xWVUlItMVyq0tFchWQYiykr3
   nCCYhFG+sqMMuNs8s9oKUp2vE1zS/yWDIDH1MRED+PE+/6LV0PWToInb0
   p4/fSz8UbIK06V4lArPxL403IylkOP22qIkSGHdpHVMo2Q5MkuOHjH1Bm
   D2ChTR4zLzieeUw/H7Av1ZJdNZzQ0UlkeQVOyP5y8DR4TgIBS4C3sJCKo
   A==;
X-CSE-ConnectionGUID: GVZkXfVKThSwo3T79vwoIg==
X-CSE-MsgGUID: B1enb7xkTl6IFuFK7ETe2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85757170"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85757170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 03:39:01 -0700
X-CSE-ConnectionGUID: kqyT9SqUTkaKzHdfbVoaEw==
X-CSE-MsgGUID: B/r1zXEkTrGQdu5rI1YUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="283896895"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 03:39:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5CB0D99; Mon, 27 Jul 2026 12:38:59 +0200 (CEST)
Date: Mon, 27 Jul 2026 12:38:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Woody Suwalski <terraluna977@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Kernel 7.2: fix for crash during init of thunderbolt
 driver
Message-ID: <20260727103859.GE2365036@black.igk.intel.com>
References: <62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com>

Hi,

On Sat, Jul 11, 2026 at 06:51:36PM -0400, Woody Suwalski wrote:
> Kernel 7.2 now includes the following patch from Mika:
> =====
> commit f5cc545f59699549adbaa4084149f8247865a51d
> Author: Mika Westerberg <mika.westerberg@linux.intel.com>
> Date:   Wed Nov 19 12:53:58 2025 +0200
> 
>     thunderbolt: Wait for tb_domain_release() to complete when driver is
> removed
> =====
> However as testing on older MacBookPro and MacBook Air, this patch is
> causing a crash on driver insmod.
> /...
> [   10.570223] [   T2604] ACPI: bus type thunderbolt registered
> [   10.580666] [   T2604] BUG: unable to handle page fault for address:
> fffffffffffffff8
> [   10.580745] [   T2604] #PF: supervisor read access in kernel mode
> [   10.580796] [   T2604] #PF: error_code(0x0000) - not-present page
> [   10.580844] [   T2604] PGD 2ec19067 P4D 2ec19067 PUD 2ec1b067 PMD 0
> [   10.580915] [   T2604] Oops: Oops: 0000 [#1] SMP NOPTI
> [   10.580929] [   T2603] acpi ACPI0001:00: SBS HC: offset = 0x20, query_bit
> = 0x10
> [   10.580968] [   T2604] CPU: 3 UID: 0 PID: 2604 Comm: (udev-worker)
> Tainted: G S                  7.2-pingu #0~rc1 PREEMPT(full) 
> 9f8aaa247129d19aebb6b0d19f7b648b1f9f7f36
> [   10.581126] [   T2604] Tainted: [S]=CPU_OUT_OF_SPEC
> [   10.581165] [   T2604] Hardware name: Apple Inc.
> MacBookPro8,1/Mac-94245B3640C91C81, BIOS MBP81.88Z.0050.B00.1804101331
> 04/10/18
> [   10.581248] [   T2604] RIP: 0010:complete+0x3a/0x70
> [   10.581301] [   T2604] Code: 61 c8 00 48 89 c5 8b 03 83 f8 ff 74 05 83 c0
> 01 89 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 29 48 8b 5b 10 31 d2 be 03 00
> 00 00 <48> 8b 7b f8 e8 4d e9 fd ff 48 8b 13 48 8b 43 08 48 89 42 08 48 89
> [   10.581441] [   T2604] RSP: 0018:ffff92720020ba98 EFLAGS: 00010046
> [   10.581496] [   T2604] RAX: ffff8c82c6a2b3b0 RBX: 0000000000000000 RCX:
> 000000000000000c
> [   10.581559] [   T2604] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
> ffff8c82c6a2b3a8
> [   10.581621] [   T2604] RBP: 0000000000000282 R08: 0000000000000000 R09:
> 0000000000000000
> [   10.581681] [   T2604] R10: 0000000000000001 R11: ffff8c832ba20d80 R12:
> ffff8c82c6a2b3a8
> [   10.581744] [   T2604] R13: ffff8c82c81f02b0 R14: 0000000000000000 R15:
> ffff8c82c6e53148
> [   10.581808] [   T2604] FS:  00007ffaf52c99c0(0000)
> GS:ffff8c839ad88000(0000) knlGS:0000000000000000
> [   10.581881] [   T2604] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.581935] [   T2604] CR2: fffffffffffffff8 CR3: 0000000105596002 CR4:
> 00000000000606f0
> [   10.581999] [   T2604] Call Trace:
> [   10.582032] [   T2604]  <TASK>
> [   10.582061] [   T2604]  device_release+0x3a/0x90
> [   10.582112] [   T2604]  kobject_put+0x8a/0x230
> [   10.582166] [   T2604]  icm_probe+0xf2/0x550 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.582415] [   T2604]  nhi_probe+0x196/0x390 [thunderbolt
> 2f2c536023810e0da91d9b6d6a63a9f9bf553e73]
> [   10.582620] [   T2604]  local_pci_probe+0x3c/0x90
> [   10.582668] [   T2604]  pci_device_probe+0xb0/0x1d0
> /...
> 
> The fix is to check if tb->cm_ops->complete has been initialized before
> using it.
> I have also added couple of NULL pointer checks before calling a function.
> I think that another issue could have been caused by a use-after-free of the
> tb structure after kfree() call.

Just one change per patch.

In your system TB is not working even with this patch, right? Because where
this crash happens above it is on failure path if I read this right (back
from vacation so brains still partially on vacation mode).

> 
> I have tested it OK on my older hardware...
> 
> Signed-off-by: Woody Suwalski <terraluna977@gmail.com>
> ---
> 
> --- a/drivers/thunderbolt/domain.c    2026-06-23 07:35:46.060061342 -0400
> +++ b/drivers/thunderbolt/domain.c    2026-07-11 15:09:12.748107785 -0400
> @@ -321,13 +321,19 @@ static void tb_domain_release(struct dev
>      struct tb *tb = container_of(dev, struct tb, dev);
>      struct tb_nhi *nhi = tb->nhi;
> 
> -    tb_ctl_free(tb->ctl);
> -    destroy_workqueue(tb->wq);
> +    if (tb->ctl)
> +        tb_ctl_free(tb->ctl);
> +
> +    if (tb->wq)
> +        destroy_workqueue(tb->wq);
> +
>      ida_free(&tb_domain_ida, tb->index);
> +
> +    if (tb->cm_ops && tb->cm_ops->complete)
> +        complete(&nhi->domain_released);
> +
>      mutex_destroy(&tb->lock);
>      kfree(tb);
> -
> -    complete(&nhi->domain_released);
>  }
> 
>  const struct device_type tb_domain_type = {
> @@ -405,6 +411,8 @@ struct tb *tb_domain_alloc(struct tb_nhi
>      if (!tb->ctl)
>          goto err_destroy_wq;
> 
> +    tb->cm_ops = NULL;
> +
>      tb->dev.parent = nhi->dev;
>      tb->dev.bus = &tb_bus_type;
>      tb->dev.type = &tb_domain_type;
> @@ -600,7 +608,7 @@ int tb_domain_thaw_noirq(struct tb *tb)
> 
>  void tb_domain_complete(struct tb *tb)
>  {
> -    if (tb->cm_ops->complete)
> +    if (tb && tb->cm_ops && tb->cm_ops->complete)
>          tb->cm_ops->complete(tb);
>  }
> 
> 

> --- a/drivers/thunderbolt/domain.c	2026-06-23 07:35:46.060061342 -0400
> +++ b/drivers/thunderbolt/domain.c	2026-07-11 15:09:12.748107785 -0400
> @@ -321,13 +321,19 @@ static void tb_domain_release(struct dev
>  	struct tb *tb = container_of(dev, struct tb, dev);
>  	struct tb_nhi *nhi = tb->nhi;
>  
> -	tb_ctl_free(tb->ctl);
> -	destroy_workqueue(tb->wq);
> +	if (tb->ctl)
> +		tb_ctl_free(tb->ctl);
> +
> +	if (tb->wq)
> +		destroy_workqueue(tb->wq);
> +
>  	ida_free(&tb_domain_ida, tb->index);
> +
> +	if (tb->cm_ops && tb->cm_ops->complete)
> +		complete(&nhi->domain_released);
> +
>  	mutex_destroy(&tb->lock);
>  	kfree(tb);
> -
> -	complete(&nhi->domain_released);
>  }
>  
>  const struct device_type tb_domain_type = {
> @@ -405,6 +411,8 @@ struct tb *tb_domain_alloc(struct tb_nhi
>  	if (!tb->ctl)
>  		goto err_destroy_wq;
>  
> +	tb->cm_ops = NULL;
> +
>  	tb->dev.parent = nhi->dev;
>  	tb->dev.bus = &tb_bus_type;
>  	tb->dev.type = &tb_domain_type;
> @@ -600,7 +608,7 @@ int tb_domain_thaw_noirq(struct tb *tb)
>  
>  void tb_domain_complete(struct tb *tb)
>  {
> -	if (tb->cm_ops->complete)
> +	if (tb && tb->cm_ops && tb->cm_ops->complete)
>  		tb->cm_ops->complete(tb);
>  }
>  

