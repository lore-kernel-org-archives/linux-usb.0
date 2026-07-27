Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D73F6600;
	Mon, 27 Jul 2026 11:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150140; cv=none; b=Xzj3RJZgdEPxqUylSjRW0hx+7paD6wYgeteucBlpEtTs5hYLjHRIB6r3x3cScgeb3CSZybBtU5Pg4pJ0p++UyQ3ViqGzScBoxXH/nKOrx+f4HryXfMjZ1Cr4KPCYxoZVyCA//A3VokdrjAS3E62S/kPCbj8wWn37gXpOg+95q9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150140; c=relaxed/simple;
	bh=E+gIZdFcojB+P87SfO83Xl5FU5swYx8OG0z4A2a6YtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p22CtrZwb66HnVA3XWkGyRUAJsLpylfrO140picrtORiZooXP78yBiAOykip3cXXyxEKKh0ft51LD8Ab1lpEJtclQbwA7b6UFj7Xtw074ZqjhRXnFcwzPdiCE0zND+sJCEPyyikwHl3+L2cr3Suv5QO8gxT2wnxyOh+H9FwLnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmclyU2U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmclyU2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785150139; x=1816686139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+gIZdFcojB+P87SfO83Xl5FU5swYx8OG0z4A2a6YtQ=;
  b=JmclyU2UhqNClMSPwD+kMkxTDNZwkMs/h5xllDDKw7iyw9gTR+4FaiLE
   rCsQei1nIkXuAB6JHab4Z8X6twhAHKupHq6U8NE8WvKAXJ9QJn5u8nSHN
   vSZ1nKAzLQv0aeXXl283cAAXuJvzI1CnS6ym3oZh9haK9sA40lfYPRbh+
   q/iyhOt7AdxDpyqACiR/tsPztPtV2JdQzHRJ52qzQ6yfvdEv/ZBY55wTB
   TszSWIh36/tahuA8j6bLEgAHhsEptHPMgoumwf9QLP+d71YgIiw8rDGUs
   1+kS1jrIzs9HdZuUwT+9bhsIEL8hyuwb+7qY7ErZGn3MWJDiKi5NZmvpi
   w==;
X-CSE-ConnectionGUID: BO+tzRunSMmTsYplBsEBeA==
X-CSE-MsgGUID: zkPOdCO1QCyNKl9ziB4viQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="88252965"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="88252965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:02:18 -0700
X-CSE-ConnectionGUID: T5ccUy0FT3uor3ebc7Hdyg==
X-CSE-MsgGUID: gjlmakKRSMSlrJnMCngvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="282713631"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jul 2026 04:02:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 31C2899; Mon, 27 Jul 2026 13:02:16 +0200 (CEST)
Date: Mon, 27 Jul 2026 13:02:16 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: Remove redundant dev_err_probe()
Message-ID: <20260727110216.GG2365036@black.igk.intel.com>
References: <20260716134759.49371-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716134759.49371-1-panchuang@vivo.com>

On Thu, Jul 16, 2026 at 09:47:59PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied to thunderbolt.git/next, thanks!
