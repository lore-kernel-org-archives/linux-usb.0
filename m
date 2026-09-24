Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153EC3A9D94
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245920; cv=none; b=Tqtmxa4ZzfA+hEceGHB73c67Nu6UuHdnDrC50dS/8xOprqhg3BzTGj8OoaJcLEbabYYE2QiL8gp8V0W/CNwZJ5zicG6t6Eb1FCq6pNK4A2J9vwIpTbZdLVq+PYYVVnZUa3XkGCcudDzv9N4OuwXVyCzLjJrYpDFDZ6afesVI7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245920; c=relaxed/simple;
	bh=uYFfpJkVt46fZ2txBiCNwR6dpa8azOiewf0euUP1yhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYGQe8XbBwK/rsP6gyzqKyQE0zHOXeRN32qKCJNX70PWPAfGp5fuNldFMgQBfkqCiF/fYdyPMLIDdS+CiplJXZv34WK5SmYecSH0IhE3LM348H88w0GAIZU1A227JZ5ZYqGIvEwHWGst9zWNPoEFDDqyDXHfoZjNG79gWNGGLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc1360UC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc1360UC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790245918; x=1821781918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uYFfpJkVt46fZ2txBiCNwR6dpa8azOiewf0euUP1yhI=;
  b=Bc1360UC0/sUV5Lva7Y8jf7lRtiPtWVgSQl3726Pf94+uYedwHiZTn9I
   epHhMhLfZWdGowE04Y8KbWohr1khhb2bEXLSOa35AQ6kEMojSCKcb7KjJ
   vYT5kPXh9iiDf+rVFjfZukdnnKdNZnUgEE0l2hsRrfcKdbEyk69zto/fr
   Rw6Eqxlg0kV2/pYUDD1vqTE/tayKgdIANX8J10foJrEVnSjm6aTbkWnOs
   CQa+m04C5gprRlDXX+r9iaA1ofsYhhQvf7y+t2fG8/CRn5zVAQtWs6qNY
   eGeUjl/o3ariKUPdswxK+F6WDLisNa1/FgfNnxXHlD6NwD+15NvZFu38z
   A==;
X-CSE-ConnectionGUID: 8dpMVzAVRYa+gzfgigyuVw==
X-CSE-MsgGUID: HrZM3VM2T12GIOEZ2AuL/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78564900"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="78564900"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:31:57 -0700
X-CSE-ConnectionGUID: mi6krPLhS9Wdiglqi3MaMQ==
X-CSE-MsgGUID: FomHQAE4SESl2Zax9vLH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="278707123"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2026 03:31:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0424099; Thu, 24 Sep 2026 12:31:55 +0200 (CEST)
Date: Thu, 24 Sep 2026 12:31:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: stream: Announce support for FMODE_NOWAIT
Message-ID: <20260924103154.GO106095@black.igk.intel.com>
References: <20260922115834.3807356-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922115834.3807356-1-mika.westerberg@linux.intel.com>

On Tue, Sep 22, 2026 at 01:58:34PM +0200, Mika Westerberg wrote:
> Commit 42bc6935339b ("thunderbolt: stream: Support IOCB_NOWAIT in
> non-blocking I/O as well") added support for IOCB_NOWAIT but forgot to
> actually announce it as part of the file->f_mode. Add this now so users
> such as io_uring can actually take advantage of IOCB_NOWAIT.
> 
> Fixes: 42bc6935339b ("thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
