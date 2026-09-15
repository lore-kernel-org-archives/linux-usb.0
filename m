Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256593C13F9
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476549; cv=none; b=E1H5GjjnWJ2R7vFEilx0qYCV5Ijt6K9b6OBO640ELwwS63ByblDbiGUtAP+rCRpjFOEAoUDbWIaw8UErMNxjIFxYgVjFpSf187fLOJOQ9tLUob14yARpowLwW443iBlWIzB3KvWSLuD6jluwRVfqipJEaPFeqNbNdnp6QN59DNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476549; c=relaxed/simple;
	bh=YGkJo4sO/Vd1ZzRI8/6xHToMKJWrpjD7X94wQTFqZHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc5gGK9HjWi3J2ZqOdi1GIb43NczSRMXf8Z/82BrHAK3kBfeZUfy/dujsrxtGt9RSdIb2pIuP5PTIaQ3Xl8goxLLD7IJVkXfGwmqLySa7fV9Vb2umN3+OwL8RQtCgcGGrBFDrt77kiSytJtgL7Y7pvmkR2wlI/oytU6T2GNDQVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUPROLhO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUPROLhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789476548; x=1821012548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGkJo4sO/Vd1ZzRI8/6xHToMKJWrpjD7X94wQTFqZHY=;
  b=CUPROLhOlO19SndDc1fY2s4PMA1YNQjvL6R6lyWBgzlZwVuBL5IqSnKw
   tao8XzTQNTwVU1XoAF25ELthh2awbdP6HW9TOPLBxKZIaLb8r8uVupEH1
   30uWDAj8TqabWIxA6BN73GkAJA9zJysqtK5FdN0RNVRgmDQlYlHYojrED
   RTdGJOOuoswObMCKheAYAx+O8RanNdefi88bZTy780850inLxU76LfiHN
   02ujZ6ee+GYN6qpUHCflTxg/jvpL5mjJos0Hd8rDIwfz+aQtSAvsiMmwk
   Z7TkvBNt347X8tmbRb/QKbLDn6E2hrbxmoSb1Fcm7jWl6+xBRk6asW9JK
   A==;
X-CSE-ConnectionGUID: 4UjmhK9CTiWqBYpTq3ke9g==
X-CSE-MsgGUID: 2YDecC2wR4GJFobJ4VyskA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88971542"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88971542"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:49:07 -0700
X-CSE-ConnectionGUID: WpZZZIAZS/alPtxbSwewZw==
X-CSE-MsgGUID: ytlYPchfQUCyU0QG06Dthg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="274947866"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 05:49:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BB76E99; Tue, 15 Sep 2026 14:49:04 +0200 (CEST)
Date: Tue, 15 Sep 2026 14:49:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Nils Arnold <ns.arnold@web.de>
Cc: linux-usb@vger.kernel.org, Sanath.S@amd.com, Basavaraj.Natikar@amd.com,
	superm1@kernel.org, westeri@kernel.org
Subject: Re: AMD Strix Halo USB4: 20/40 Gbit/s negotiation with RJ45 and
 original host-reset patch regression
Message-ID: <20260915124904.GK106095@black.igk.intel.com>
References: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>

Hi,

On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
> Hello Sanath, Mario, Mika and Basavaraj,
> 
> I would like to add test evidence from two Strix Halo hosts to this
> USB4 reset discussion. My reset test used a backport of the ORIGINAL
> f1de1fc5f632 commit, not the newer deferred-reset implementation.
> I have not tested the revisions discussed on September 15.

Okay the last message on the thread I asked if we should revert the commit
for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
I understood it seems to solve the issue without the deadlock and killing
the whole host interface underneath everybody else.

Once we have that patch, you can test and see if that helps in your case
too. Now that we know AMD guys can CC you when they submit it.
