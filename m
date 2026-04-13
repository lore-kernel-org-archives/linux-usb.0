Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9663C2770;
	Mon, 13 Apr 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080421; cv=none; b=DPl9qvuH5Rds+R4ZMxbFVnjfz3ykdimFmqjhidIENuq+PQFArZVxUVf6rbRR2Qx1tv71PL8vnpXBl+fFyO9lgBSRS4kevdjga2b5a6pqTKn6lsYf70Uemfs21HwPHQRzG0NO8+xAH+MWVN68aFvpU5M6VTC59o7c+jvPtBaMxO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080421; c=relaxed/simple;
	bh=r9TNnNnsoRt6m6UoOw05fdrKBCsY/0C3qAXxYtK15xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwZKdVLCk5Zjm8bLohEhj+c2g6bkoeOX6b2rYkYdz6gHA26/vQ9mcr7HcV2SswW2wxA1+BgjFrcdl4Aol8/xoo1N+QSDVh9QUfYqKcy5TjCxrqYrSz8nHFCaGRB4XL5+wyUQsrSDSaZN5tveshAuuYX33u6dt9LqKtiVYEndaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO9A0Myv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO9A0Myv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776080420; x=1807616420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r9TNnNnsoRt6m6UoOw05fdrKBCsY/0C3qAXxYtK15xU=;
  b=hO9A0MyvoMglIgP2ZiHv19P7TgbbVKoQaUsp5rTuZ9/aHjgNdcRTFRE8
   pmqynL5noHOHMbz/HXaIVqdq11Nu+/Bgj0SQykD8SUbDchLBK3CJUQwHM
   BfySHB20wqcK4U5EseNM50kk9pl1xKA7Aj7KBWss/0c0nAA1fC1n6ECqa
   he9SD6oBGJmrUHFAsafSywgv3AyM4f0wDvfiRnqTTMLxiuma1/GWvl5ls
   3HvOrXh8ZaQzPu0BQeNKzxNEsKPYcYbbkmn5H23Rby6wPBjUKHgWXpfom
   t//dadpu7Zioq0fyYD1kMBdpuwcexN2leZ+3B4ddxclFboLQGapkxGfCZ
   Q==;
X-CSE-ConnectionGUID: +T+RI5oCQIS/P4fZOyLAnw==
X-CSE-MsgGUID: NHsJxmJYRq6nP17tm8Pjow==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87714544"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="87714544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 04:40:19 -0700
X-CSE-ConnectionGUID: ToM4Rj6CSF+2r2YhW9bguw==
X-CSE-MsgGUID: du0MFIdISZetE7neBUG8yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="229635600"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2026 04:40:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E11E098; Mon, 13 Apr 2026 13:40:15 +0200 (CEST)
Date: Mon, 13 Apr 2026 13:40:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gil Fine <gil.fine@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
Message-ID: <20260413114015.GO3552@black.igk.intel.com>
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>

On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Linux TBT subsystem supports hardware aligned with the latest
> USB4 v2.0 specification. In some places though, it assumes registers
> only defined in that specification version (previously marked as
> Reserved) are always accessible.
> 
> Every version of the spec states:
> 
> """
> Unless specified otherwise, the Connection Manager shall not write a
> register with a value that is marked as “Rsvd”. Writing a register with
> a value that is marked as “Rsvd” results in undefined behavior.
> """
> 
> The effective list of SB registers that need this guarding currently
> exclusively contains ones that aren't used outside the debugfs dump
> logic, so just add the required checks there.
> 
> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
>  drivers/thunderbolt/tb.h      |  2 ++
>  4 files changed, 30 insertions(+), 14 deletions(-)

This is alternative for the v2 patch you sent earlier, right? I prefer that
one over this.
