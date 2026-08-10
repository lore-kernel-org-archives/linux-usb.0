Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789AE3644B3;
	Mon, 10 Aug 2026 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359125; cv=none; b=CJZXZ4YAmsYCEBonHj+JuaTm+K9yAmrvCIXHiqC4acVgt4P5Q0xAWaJlvjA3f+7DG1ZDqLauaSKvru9IGKOMPHJTLRl7U3kU6flHFp8Xt/GCNhFlWDEkdo5UXAoNCvi22XfTdjIi38mQBKEUI2arsnCRK1FhggQCzLzaF7z2YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359125; c=relaxed/simple;
	bh=I/A3NC+n3zA7uKMKMTm7wbXZ6/sM+Q110qW0kehCU00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtCPZqRDO3InymI6XIBZWMqlkji8MNkyigUXEeScrlC3f2HNyzObyakRJM/uhH2F0Ef5XA/9rptFlA/NS9h9s8lI5Q4DP+dhf9EK/yWrCZSrHATPhD7l5Xf5+9b6vhkCIqssiX7Uo3XVFxPT/xkSrOtHQR/WYPBL+fkNMmVTtBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFAj69tO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFAj69tO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786359122; x=1817895122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/A3NC+n3zA7uKMKMTm7wbXZ6/sM+Q110qW0kehCU00=;
  b=HFAj69tOakeUGhDAIRnNqtrjVFRiqOXGDmRDXEHfez355ylUQTsAfGe0
   gqn8FYKdWKxua6QE6TB85RH3pPnk5bphU4Px+/Ny/8c0JBk6vHPmbHHPj
   0pLgzdew+a5r019pem8MsS2PdsNR90DQ8qD9eF0tbCUSecfQgMEOrtbo/
   gKlovPWEy7WnR/ON38o6rWpBwzxkBpmzBORB2BfHIFfGuNz+yQUDIpDz6
   egCPlcuvdiDjpVE1a2VECN1jfQsSGOmbTYv4p37QMQ+Pss4cihx2081mt
   SGHaS6E2g+eEPwLpDuCJzs5tklN/bFt1YX/SevpDe9ea2Ecs+hkhgXZBr
   Q==;
X-CSE-ConnectionGUID: H24V4HniQQqqywWqlzEZ4g==
X-CSE-MsgGUID: Nvbx/0vvQ8qBneb1CGdZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85837900"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="85837900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 03:52:02 -0700
X-CSE-ConnectionGUID: 59j41mbPQIG2jjcmonNOQA==
X-CSE-MsgGUID: FqL/2QvhQOuRY72HLy6sJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="261725385"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2026 03:52:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E665D99; Mon, 10 Aug 2026 12:51:58 +0200 (CEST)
Date: Mon, 10 Aug 2026 12:51:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Replace get_zeroed_page() with
 kzalloc()
Message-ID: <20260810105158.GG893316@black.igk.intel.com>
References: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>

Hi,

On Sat, Aug 08, 2026 at 10:38:29PM +0000, Mahad Ibrahim wrote:
> validate_and_copy_from_user() allocates a page to store data from
> userspace via get_zeroed_page(), and then returns it as a buffer.
> Neither the function itself nor its callers require struct page access.
> 
> This buffer can easily be allocated with kzalloc() as there is nothing
> special about it that requires going through the page allocator.
> kzalloc(), which internally reduces to kmalloc() with __GFP_ZERO,
> provides a better API and kfree() does not need to know the size of the
> freed object. Additionally it removes the casts of (void *) and
> (unsigned long) which only obfuscate the code.
> 
> Replace get_zeroed_page() with kzalloc() and free_page() with kfree().
> 
> Compile-tested only; no USB4 hardware available.

I tested this on Intel HW and works fine.

> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com/
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

Applied to thunderbolt.git/next with Mike's ack. Thanks!
