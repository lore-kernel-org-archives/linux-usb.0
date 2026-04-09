Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41160317177;
	Thu,  9 Apr 2026 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745132; cv=none; b=jJKfV8EGn03bQMkQTxJSU4dc4DPG4CZCe4m51LNh6bW/AJ6ZEkeeNGNv98+ZgayuMNHYhftQOOAGklztgJ3CYhqwSgOWeYSmqWugJyGlxE9RnPmTv/7UCMUL6UnuvCSt0knhtopgo4AggStKiKvvsq+c5ngfakg620KVvPLI6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745132; c=relaxed/simple;
	bh=gFQlXcQ1h17IZjuvtZ0CZRwhJWkalaKYtuEVeDgyNSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZtgzA6NYls21kypl80t4Mt/eVzWYdvK1XWQKWFWyn2FVyrcYXw+aeNP2np1mEqDV3SOmgkxaP7RPD2mR2xTp53IOa7lMPkVAPOVJpbb91hX0xiMbJ9FbVXXxDCAYpdLa5QG3pNQPHXearmn9g7BU8ZgbEfuBvxrVeaXRorUqeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3JjmLBM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3JjmLBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775745127; x=1807281127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gFQlXcQ1h17IZjuvtZ0CZRwhJWkalaKYtuEVeDgyNSs=;
  b=Q3JjmLBM0nJi5OrEGpuVo60viqeebnNvPKsyVI6IX+pM8GUO08OXwB7e
   YOXuxLRSChJ8dGMDIo2r/M0GlZnScTbWxO6YQ7GrXLcZvRnZPqSw/lbcv
   MpVm1oGeH6guAhPD61YORI5r+0lYIE0sorkFML8F3Qq/Y2bd7ZDR2ZZ/4
   Vx+zOfuidjd98cLGSOj3pmvppf+sKpcONq/elctCBGbC4c5CeichRBiMS
   OQ5P3bOYF9fE660CsSW0vSPgc1jdDtbzOW71V0RF5kxk0XF2Xma+mUvpi
   gWoM+OSiSXUE45pZsNjkXOG5JFnh5PHWAn4droiLCf2XiefEVpbhVIKvV
   w==;
X-CSE-ConnectionGUID: rxx8mD6rRSC4nLud9B+63g==
X-CSE-MsgGUID: hsb/h1caS8qpf2iBlf0Bmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76715196"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76715196"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 07:32:06 -0700
X-CSE-ConnectionGUID: u6xET61zTYijepL6yS++6A==
X-CSE-MsgGUID: nzgaFrPrQ7+GfOSDBLrG+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="227942162"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2026 07:32:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 13B5E98; Thu, 09 Apr 2026 16:32:03 +0200 (CEST)
Date: Thu, 9 Apr 2026 16:32:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
Message-ID: <20260409143203.GI3552@black.igk.intel.com>
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
 <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
> On 4/9/26 2:04 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Thu, Apr 09, 2026 at 01:22:01PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
> >> understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
> >> seem to implement it.
> >>
> >> The immediate idea to counter this would be to introduce a version
> >> check for that specific register, but on a second thought, the current
> >> flow only returns a quiet -EIO if there's _any_ failures, without
> >> hinting at what the actual problem is.
> > 
> > Please don't use _any_ emphasis in the commit messages here or in the
> > future.
> 
> If I must, I shall.. other maintainers don't mind.

I do. We are professionals, let's keep the commit logs as such, not rants.

> >> To take care of both of these issues, simply print an error line for
> >> each SB register read that fails and go on with attempting to read the
> >> others.
> >>
> >> Note that this is not quite in-spec behavior ("The SB Register Space
> >> registers shall have the structure and fields described in Table 4-17.
> >> Registers not listed in Table 4-20 are undefined and shall not be
> >> used."), but it's the easiest fix that shouldn't (TM) have real-world
> >> bad side effects.
> > 
> > Also drop the "(TM)" thing.
> >
> > I assume you have tested this on a hardware that supports this too, right?
> 
> Hardware that exposes that register this does not exercise the altered
> code path.

Well it may happen now that previously we got -EIO from some other register
and we stopped there, now this changes and we actually continue reading so
this definitely should be tested.

> >> Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/thunderbolt/debugfs.c | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> >> index 042f6a0d0f7f..8237e1ea6d09 100644
> >> --- a/drivers/thunderbolt/debugfs.c
> >> +++ b/drivers/thunderbolt/debugfs.c
> >> @@ -2361,8 +2361,10 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
> >>  		memset(data, 0, sizeof(data));
> >>  		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
> >>  					regs->size);
> >> -		if (ret)
> >> -			return ret;
> >> +		if (ret) {
> >> +			seq_printf(s, "0x%02x Error reading register: %d\n", regs->reg, ret);
> > 
> > Why not tb_port_dgb/warn()() here instead so it goes into dmesg, not to the
> > output.
> 
> Because when one reads out sys/debugfs, it's generally expected that the
> related output is provided there.
> 
> If we don't want to print the retval, I can copy the message that's printed
> when switch/port capabilities readout fails, i.e.
> 
> -- drivers/thunderbolt/debugfs.c : cap_show_by_dw()
> if (port)
> 	ret = tb_port_read(port, &data, TB_CFG_PORT, cap + offset + i, 1);
> else
> 	ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
> if (ret) {
> 	seq_printf(s, "0x%04x <not accessible>\n", cap + offset + i);
> 	continue;

Yes this is better.
