Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9CC175A89
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 06:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308159; cv=none; b=rgggKfyU6H4bWpjA9wsaX86A/al//0UbGlql07jyw500nzZgqCFAbc3rNSWwtaJkNpMdoQv4LatYz7jyMViMr8hjZMeWhUO3Z8I+WxaCkLTFexwmqdd+/8l9j7KMZ0LK9jBXWk5X4mBvnxgfeXIySpuYQRUxCqTbWiBLYLxnm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308159; c=relaxed/simple;
	bh=/4gVqCmHOabh1mIiulWrmvlXJGHHtHxrbRZl+GXo7Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daLHz6+FEctmPJxl1MRsQe1tmU/8gzxiqczPaZ71dbCk39iMI6ovpxJ0dSkCHsO+MWnUUTF1HnaIiY11tZP736IXo4B9RfnNL8vcB+dVAJHF9kYJSTTxWNqlNkLTtrghIw0OPOK21m66/szY8fQopmpXZJA+5wUpo2bFvzF3wlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwM6bDjS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwM6bDjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785308158; x=1816844158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/4gVqCmHOabh1mIiulWrmvlXJGHHtHxrbRZl+GXo7Ek=;
  b=KwM6bDjSdvd+50B5yUkfYVYObXXfygpPWCzHdhDz3a9V07H3sW2yLXGS
   UqqNdkj2yOumhha5JttLhT8vlgf9elxBTOX3TGTMrmND1rere7wm7uy/y
   jBq3pb6+lt9mfHkGnRLFlOSiaDzXZYp0vVbGvZyoPA5KNstjhHh9otm7b
   euLZHnERKVhm+2CNP39HMCsVsWD7D9HnIAN6f8sI/msUMhFdchpEXsHVY
   ABtEbV8U3aw/u/bsKxpy4N03zJJTYVWdWzYgutbFe0E2cPujbQXCzqIAY
   UH9XA9c01bjqHyrMj3iNiDgqOvIDbt7wmcZ42nj8DMsa1o/CHVP10yFe0
   w==;
X-CSE-ConnectionGUID: EtFc2bH/R3eWYxon+BLqww==
X-CSE-MsgGUID: NhEDdvCIQUmOOBYbhnYPDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108702644"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="108702644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 23:55:57 -0700
X-CSE-ConnectionGUID: W1yGNjfSRauifHMzC+5I1w==
X-CSE-MsgGUID: 445PMZOrQwOrqknaCCy9vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="260551951"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 23:55:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 57DF999; Wed, 29 Jul 2026 08:55:54 +0200 (CEST)
Date: Wed, 29 Jul 2026 08:55:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Woody Suwalski <terraluna977@gmail.com>
Subject: Re: [PATCH] thunderbolt: Initialize ->domain_released completion
 before it is being used
Message-ID: <20260729065554.GA20844@black.igk.intel.com>
References: <20260728065222.2550284-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728065222.2550284-1-mika.westerberg@linux.intel.com>

On Tue, Jul 28, 2026 at 08:52:22AM +0200, Mika Westerberg wrote:
> Both Woody and Marek reported following crash:
> 
>  BUG: unable to handle page fault for address: fffffffffffffff8
>  Call Trace:
>   <TASK>
>   device_release+0x43/0x90
>   kobject_cleanup+0x3c/0x180
>   icm_probe+0x19c/0x550 [thunderbolt]
>   nhi_probe+0x1a4/0x370 [thunderbolt]
>   local_pci_probe+0x41/0x90
>   pci_call_probe+0x5b/0x1a0
>   ...
> 
> This only triggers on the error path when icm_probe() fails and the
> domain structure is released, it tries to complete() uninitialized
> completion.
> 
> Fix this by initializing the completion earlier.
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Closes: https://lore.kernel.org/linux-usb/amdezCBiW4fd_DuB@mail-itl/
> Reported-by: Woody Suwalski <terraluna977@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/
> Fixes: f5cc545f5969 ("thunderbolt: Wait for tb_domain_release() to complete when driver is removed")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
