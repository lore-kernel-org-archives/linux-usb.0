Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC63F5BD0;
	Mon, 27 Jul 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148902; cv=none; b=rBViF7+sfNuU//7FGDCFpY2EXIk6jTQwN7gBxVBybNlQWVtGIioncWH4eM0m7rfF/3D7D1bOgtsfJwCoC/cqUjST49P4EqhOswVBfQW8UQ7SNSpcvvixw/RSiPQm2qwjKJkatK1OFtsvB4fsKJC5rZTuWhBo8Jd85HQe6CAIiCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148902; c=relaxed/simple;
	bh=dGvOW5cv5x0S4k5wtui/8UZhenbPTTjSD8LKmELkFDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhjlPCaeW2goWtvMEw6qhEAxs0Xvveb5LLsejHYeysHQOwiwvuG8/tHbxRRxr2kOk9lszmOK1/I01Ow9b20iXZSbBBQjK0a8YfAY3/VyQlUsm/EwnWCM+0iwvPWzuD9OaBrNxOaJYYtZPztoIOIYJWFOEd39jLBwHDzLWw2ccUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1I691Ho; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1I691Ho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785148900; x=1816684900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dGvOW5cv5x0S4k5wtui/8UZhenbPTTjSD8LKmELkFDQ=;
  b=B1I691Ho2NvS9853/Ww54SI81CdDVEeSMlvZs2xepI12a330ivh129o/
   PlGZkpIHmSN8o0M9A2HYKWxgmxnovg9qJU7xWSPb2BvXhQHWuv0Sk9qKu
   lpPZnKlPNLfFyMEvtCDE0uVUjtp/ZL/4vkZsgKz2iAOWBkV1PJCEsVePW
   ADoLClMe7jp2DnkQ7gNBvi8LTPnpOtaEVD2FizTbW+XAAUTAc9mKRsLmn
   WuUudWyHW/Jo2ZMqhXQfISkuXOoRYtZjv1RJv1FkyA5g4SB+f22keEhu1
   r+y5IKCN8V/TRlJYIY1FSes2ovfFGdKmZDFovp7qhNljhDhOLVac/kp3k
   g==;
X-CSE-ConnectionGUID: KQ32AdoVQL2w6/iFEcf44g==
X-CSE-MsgGUID: ldo/e7o+QemZwOoaEdk0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="73253162"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="73253162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 03:41:39 -0700
X-CSE-ConnectionGUID: 25401TPTRzuzDRg5CM+4yg==
X-CSE-MsgGUID: cKhANywmRBmDDB9pZhTLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="264376077"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jul 2026 03:41:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5700B99; Mon, 27 Jul 2026 12:41:35 +0200 (CEST)
Date: Mon, 27 Jul 2026 12:41:35 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: admin-guide: thunderbolt: fix sentence structure
Message-ID: <20260727104135.GF2365036@black.igk.intel.com>
References: <20260708054923.293003-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708054923.293003-3-manuelebner@mailbox.org>

On Wed, Jul 08, 2026 at 07:49:24AM +0200, Manuel Ebner wrote:
> Replace ')' with ',' and add 'in' to sentence.
> 
> Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied to thunderbolt.git/next, thanks!
