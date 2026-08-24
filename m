Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C87373BF3;
	Mon, 24 Aug 2026 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554112; cv=none; b=u5e128F5JRPjAw7oM8F9lSP6/vmNEsMGctE5ZC+tohN5LysGhSVe3RrZv/wdBOQcL0LYE71fUDVmW2e21mcxyjG06ijthCueknbXiHKlMKSli0dGb5vgmTi9CoIUn4iHTHSAVusEhMghhqAjlNmdJCGh5LGyUsd1a/6bMsj7Pn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554112; c=relaxed/simple;
	bh=cB3TlxgCpNSc4bIC7fneztkvru2OiEvjJl/2h+xK9AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjMNfiAG6TT4dOdEcxwaNdJkmwsZtSQvu/vxMY4vpl9gXRskTCwTmn6RCedBA4U6zEb8EkxW0NNw+jlIO2rj5Vhbxb+mbrEvp3j/Fd6ZVcihs/AJs3H7oN88QYxK/0BLrGY0GprAwAlSAenyxUn3JP8E/f6w+5IfD5DF0YdwsUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLtF30AL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLtF30AL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787554111; x=1819090111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cB3TlxgCpNSc4bIC7fneztkvru2OiEvjJl/2h+xK9AM=;
  b=YLtF30ALqU257HOGY1lIbXdH38ZBqUp6J8S62VBN8TWLdQjq05LcyZ9V
   ToUewHPWvvdyFNkIrzbfJ/c4yanNU/hd9mdOlzRPoO3pmm/EZSlYBuI1/
   ENlOFS+sBJWRD01aLh86xZeJbeUNMkHUG0Z9YrqtUc4cWkM8Nm/mO8RI8
   SGlylTXBkj5xUjmVK9sJvb3HjcZ+8/1tcRw8gCr3isXCjHKkCpRtzjF3q
   K6xHu/8t52NTqU90t3rLRC1mblf21vrMP72QMrd2ZR1fwfuLlHv4oF3Qr
   W39q1gPZkTNZ98XkuwUCZTgLrTlb4+oVd+AA8EK0DGnrkoCiqE4xqIF3j
   Q==;
X-CSE-ConnectionGUID: 7BMtsdRpRIaLGbTNj6Du7w==
X-CSE-MsgGUID: PIbjzMmDSjKNSlBpfpk77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91672647"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91672647"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 23:48:30 -0700
X-CSE-ConnectionGUID: 2zla59SnTzOdJBaxqXHNTA==
X-CSE-MsgGUID: CmjPMWYIQ6SJj6Gt1OJEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267485355"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 23:48:28 -0700
Date: Mon, 24 Aug 2026 09:48:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: typec: stusb160x: add missing NULL check for
 i2c_get_match_data()
Message-ID: <aovpOp4QunPBx-XT@ashevche-desk.local>
References: <20260806084301.1340-1-joshua.crofts1@gmail.com>
 <20260824084041.0000295f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824084041.0000295f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 24, 2026 at 08:40:41AM +0200, Joshua Crofts wrote:
> On Thu,  6 Aug 2026 08:43:01 +0000
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:

...

> >  	regmap_config = i2c_get_match_data(client);
> > +	if (!regmap_config)
> > +		return -ENODEV;

Return -ENODATA here, it will distinguish better in case of debugging.

> A (very) gentle ping on this patch. Do you need a v2 to include the
> Cc to stable?

-- 
With Best Regards,
Andy Shevchenko


