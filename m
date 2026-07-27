Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFC63C1412;
	Mon, 27 Jul 2026 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150796; cv=none; b=CELkYATZfMwzIzkefJG9lAwahCVR0zeOzOwDYiuNaKd8bvgkMsaiLbKmJbn5/hEaTq+LHmd0C5LqYQ+thhbT8lojzpRPh+0TZbJBRxmXeyZfM7mNzIWJZFHQx9CnsqBqJV/beNBkEH9qxydfgTppJrLwd7XJPOtKZclf0QhKRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150796; c=relaxed/simple;
	bh=P1c52qFoEkU1xj56RCOZ4/J17JqCZlOLZIZbCAEwt28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLNfYtYq0MmTqtKjZDqbNRFPaU7GjDW+2U35CCf545s5N78sZ7Iz3Ph8+tlASqzUYXDTOG5O6fNXcxLEw1ZyXne5i1xo6MsMgMLNsmwKO7asqhd/eMBIaVoQsh5H2htrSner7UDg3BRBKGBzlpnZCPGgCa2A3sB/FbUOFJpuVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnIDRVYv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnIDRVYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785150794; x=1816686794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P1c52qFoEkU1xj56RCOZ4/J17JqCZlOLZIZbCAEwt28=;
  b=VnIDRVYvilf2R00FmCGNk690JO8UKZWcE5P2f94V82l9sxaxZwTUFwcB
   TXYhvxgzRVj85Mx/A4DQoieHMxsBM2RYYeTP3DaEp2Z2HkzjaOSe0c14l
   9GtEkDyy8zr7b8A9GJYsOFAapK8o9WAuAOOpXtXkXCQ8jFEwNQddpvYl+
   ho+3jICeJJZaxUd9Slj1cc7fNNlmxedoJmp87A3rejOR8Ibca9aLMVJMK
   nYWG6n7CfGRyOudznCZBzkfooacrnv46rMIfDABmr1JeKFpkg5YZfIYjE
   7nf8X7WUTW1n0DEbdOCcOjYKz6MbQSzh0iEkezqIYfj4j4LjzN5jFk+y6
   g==;
X-CSE-ConnectionGUID: hOpGCjuEQKq/99ZdsI113Q==
X-CSE-MsgGUID: 7p68ikdpTU+twmVBFAWYvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="103127207"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="103127207"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:13:14 -0700
X-CSE-ConnectionGUID: vMDoQdhoTHiF6ek3dDNXbg==
X-CSE-MsgGUID: /J1iJsjYSwOSSO7rS5iyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="263161448"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 04:13:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9DB4D99; Mon, 27 Jul 2026 13:13:11 +0200 (CEST)
Date: Mon, 27 Jul 2026 13:13:11 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Tormento <mtormento80@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: deattach child device from typec connector on
 port unbind
Message-ID: <amc9R83pQ8-XyYYm@black.igk.intel.com>
References: <20260721202201.27442-1-mtormento80@gmail.com>
 <amDplMXaf1JpxE0v@kuha>
 <CACF_UwoqtaGMB=O2em92JcTnW1RP_ozD415ieAbMBgmmq+gG6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACF_UwoqtaGMB=O2em92JcTnW1RP_ozD415ieAbMBgmmq+gG6w@mail.gmail.com>

Hi Marco,

On Wed, Jul 22, 2026 at 06:25:30PM +0200, Marco Tormento wrote:
> On Wed, 22 Jul 2026 at 18:02, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> > There is already a fix for this:
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=e0b291fe117964037e0ba382eff4bb365d531c3a
> 
> Sorry, I did not notice it.
> Shouldn't the typec deattach come before the sysfs removals though,
> reversing what happens in connector_bind?

We should not need to reverse anything. We can't avoid calling
typec_attach() separately from connector_bind() because we can't
prevent USB devices from being enumerated before the typec drivers are
loaded for example during bootup. But that does not mean we need to
call typec_deattach() in connector_unbind().

After the USB device is "attached" to the typec connector, the
connector device should be pinned down for as long as the USB device
exists, but that is not happening. So what both you guys are doing, is
working around a problem with the reference count.

I can see that most of your commit message is written by some LLM, and
the parts that you've added don't usually belong to the commit
message. That makes me a bit concerned about how much you actually
understand what the code that you are modifying does.

Use of LLMs is fine, but you still have understand the code that you
modify.

Br,

-- 
heikki
