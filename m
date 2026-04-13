Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C63294A10;
	Mon, 13 Apr 2026 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081190; cv=none; b=MfG659xZraFJmtywHo9Sudv9A68+6U1BlfXYSXvFQHB0cpfKXVK1At6gwxqYEY7F9OzJtQr3pkrXck/xibde78A/R1C1JRhvxibYNJmKAoa/4mE07sNeI18bmxpibLtzeqXz6sIfRm6xg1vIZP/P2uHTRqnLUbZLED5sVgliWds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081190; c=relaxed/simple;
	bh=azn9P6oyXd1ug9es7KZUGTRGZGBbAQLFNvfDVy5hN/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2cF4KzFdqku7gsTgBOpKtQ4DZ0zQrP0jLaOfDkOARN21Guxf2tPZ9s/X2turfEX5H66W6q+TvMgT5ogBzjAeg1agbV0VtZSyHMq0Aa64d+7GeZn0dp7vasPopkxF59losWI7osaKWqfRTYHaj2RXfcVN1ND8GzlRoJn8Jq5Mjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezmiYBX9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezmiYBX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776081189; x=1807617189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=azn9P6oyXd1ug9es7KZUGTRGZGBbAQLFNvfDVy5hN/4=;
  b=ezmiYBX96cJR+VU3AIfxXpX3Nifw/+oT+HdptBKQxeIEzlNv2YuyhOrX
   29rvhkqHoYNyRGuxzhSGpj6Vf1UWQD78IVO4saqSaG4vQbkIyZssY/s2a
   BVXv1QrsvWkuy/thNMVn0mfolCbVWQ+cGU9UhnZvmcp6e1amgOZjxFFT/
   V1ficj7TiWfNIxpoh89AkSTg9d1Su5thd7xLcAgqKYaIN0y9T67XKscL+
   76yqAnfbU65dVgyjVoxjiZcTota390cFuc9zWkrVKsNUgoToA5Pz53k8W
   pIjy/t+y/YEVr5BRIowZJMsw6QfeB6uMqrkamDyqS+mlTm2aJhD1jodHC
   Q==;
X-CSE-ConnectionGUID: Bw6QMlttRuq5t5c4H0L8Dg==
X-CSE-MsgGUID: l0kAWTgrSteSbW8iS63iNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87639449"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="87639449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:53:08 -0700
X-CSE-ConnectionGUID: 4PONQydYSsGS5JV5GFcfdg==
X-CSE-MsgGUID: 62EUCgz1Qxi1hC8p4Vi87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="223280435"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 13 Apr 2026 04:53:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3BD0298; Mon, 13 Apr 2026 13:53:05 +0200 (CEST)
Date: Mon, 13 Apr 2026 13:53:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gil Fine <gil.fine@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
Message-ID: <20260413115305.GP3552@black.igk.intel.com>
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
 <20260413114015.GO3552@black.igk.intel.com>
 <f59c4193-7e07-4375-b418-ab019514fdf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f59c4193-7e07-4375-b418-ab019514fdf8@oss.qualcomm.com>

On Mon, Apr 13, 2026 at 01:43:49PM +0200, Konrad Dybcio wrote:
> On 4/13/26 1:40 PM, Mika Westerberg wrote:
> > On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Linux TBT subsystem supports hardware aligned with the latest
> >> USB4 v2.0 specification. In some places though, it assumes registers
> >> only defined in that specification version (previously marked as
> >> Reserved) are always accessible.
> >>
> >> Every version of the spec states:
> >>
> >> """
> >> Unless specified otherwise, the Connection Manager shall not write a
> >> register with a value that is marked as “Rsvd”. Writing a register with
> >> a value that is marked as “Rsvd” results in undefined behavior.
> >> """
> >>
> >> The effective list of SB registers that need this guarding currently
> >> exclusively contains ones that aren't used outside the debugfs dump
> >> logic, so just add the required checks there.
> >>
> >> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
> >>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
> >>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
> >>  drivers/thunderbolt/tb.h      |  2 ++
> >>  4 files changed, 30 insertions(+), 14 deletions(-)
> > 
> > This is alternative for the v2 patch you sent earlier, right? I prefer that
> > one over this.
> 
> I think they're complementary. This patch ensures compliance with the
> quoted part of the spec, while the other one improves the UX and aids
> debugging.

This adds a lot of code for just debugfs access so I think we are better
without.
