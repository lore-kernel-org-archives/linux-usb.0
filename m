Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595828;
	b=H3bAU7oEMjUS3mr+cZX+Rms5i+36pw+q6+GhhyeJBbldvG23sFD13R05Apk+RM40sWMD
	 Tz8q8xPAt5lwPn9cjAACBsr5V9EcKaBE65o6gDN80n+Wzf7XoKeibwF0TPOwugx/Bdqvu
	 wPE2gi5bZWYzmdUC48W+LmOHjIF2pZbEYjzGwlMYHvkq9/NjzYqSTNL9Ggj/OP3g58/TD
	 scoZm5i0g0vbGY8B4mRDNH3ezHDJKEP2FfUR6lYecL3/rzyZjX9O9hQ5qLzi79cBXOKRC
	 kjRw0qLP7VtGMDdmVGtV4ttNAS/wUIbcGCXjNKioFV62/dkIjz4eHfuzKi4YfasN35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595828;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KS2joaEkVsfKRoM+0NkdOSRMDlnBr31Zerp8kvKVOms=;
	b=0OQ3POtG06mZ7E0bUt5pWnuPogPs4BvigR+/mqIBqZI6hRzqMHQm7vVnRTrE50hggV+K
	 aEx/fX7cquL5CVUA/EsZ9TDBy7WF4Zm5twJNRzITN7UyT87rrmaABkMuRcWYg/vqC96jb
	 vjAQ+yIcQ/yW4JjoyVmJvkuMIFdYFtXQ+J2VrYVsm/6gJmgkLAqIyCPPwCxFQLbDfVUAz
	 7sMN35mPe0WD/ePVQ+1ATRK/o/EgSaG92gwinz3WHzg5qUxXF6malbUGDKMNJoUfZbdBm
	 9b8JgB38QBPOzXGJYx40MmCVILiiFyFx6/vTNbyqMObxG0GUR+6JVk7ZqcidweZt8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOL5bkl7;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1BF606A31E;
	Wed, 25 Nov 2026 08:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1BF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OOL5bkl7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795595828; x=1827131828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f3hZnUUrhl208HautcHK//XxebpDPyvbB+xyqw9UUzM=;
  b=OOL5bkl7YXzhDUOns1YS4gPbghmGeQ3uDucTtBYIysK/zzW82oAbe07S
   OOZd2aEMaHBu+cSpb1hZjO4ky+DMUe0CkvLiEa4TupLXCpTsONmYvF4p7
   EF8bXZFWjRAuRhVGJmqTljYJvXq6yI9OtG6WGmSCRKpf+jj0ZMwYlRKGS
   qPdVHN4mHCoN4GzMyBoBfZmNd+e9JL2PKnjOal1+lp1xXTzUadoPuhbE4
   I3nx+GFoFxKrFxHKxX9l8r1yrtDwkFSrV6G1rAWmbebq1Jc7IedI7EgLy
   0704I5ueaMNauFmO0KB8v7dnqSXsn2NKKMlLwZeBtyRgCrJ2Gz4jk9y4/
   A==;
X-CSE-ConnectionGUID: DsWpLXr0TOGDRUoBJAEFZQ==
X-CSE-MsgGUID: lEt5hoiCQ8SlzFS+lb1kuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4341522"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4341522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 00:37:07 -0800
X-CSE-ConnectionGUID: QmvacyxsTxGN4/mlnzx3Jg==
X-CSE-MsgGUID: 5Q4vS1MHQL+X/OKz8m1b+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="12007094"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 00:37:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9286698; Wed, 25 Nov 2026 09:37:04 +0100 (CET)
Date: Wed, 25 Nov 2026 09:37:04 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Jacob Procee <sn125164@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <awaeMHaZ-PV-E0Ts@black.igk.intel.com>
References: <20261112113005.16418-1-sn125164@gmail.com>
 <avw1kOqmrUii-msr@black.igk.intel.com>
 <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>

> > Sven, would you be interested, or would you have time, to maintain
> > this driver?
> 
> Sure, I can help.

Thanks Sven!

-- 
heikki
