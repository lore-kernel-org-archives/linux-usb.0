Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBFC2472A2;
	Tue, 25 Aug 2026 03:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629898; cv=none; b=LOB+N0saLnDSrMHXwDbY7fHKzRpLBgYdnpcOENfa05Oy7zwN5fJo6gOVGCYw02+4vZNWsyYL9Ze67HENDegszmzMNPNEN8loOWY32+yPqhMTyQIEjY5WhzJn5UfuZKsuJ8fl+nlCIj0gyrJH3HeQJYHwbA89YAfXgT8fqe1vNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629898; c=relaxed/simple;
	bh=EWl9tU7uAxMxpmhrblRcqWKpYmo6e+/ZDUowduUAxPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlA2Ey6ySVzjDjr1w+mw0xoewyph2Km2n1a6CFjk5AdUVlltOQt2dDG9wY/k6zjeVwxl1qauC3iSVRXBCgt0tMmU8DWuDHv/8mrGEuiAJVcM7a3sspS3cEQZriNyBNE0wnajQeSg8P9nQuwaS//w5TAoezoqoUOuXFYx3UuWWjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kroLM6T3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kroLM6T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787629897; x=1819165897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWl9tU7uAxMxpmhrblRcqWKpYmo6e+/ZDUowduUAxPo=;
  b=kroLM6T3iAv5FdSQNbWp4et2fxsy63SWjQUCGx1bGht/7g2neyb8rNzO
   vSrkjaRqqOb4eVzXYAc9eSyxydtId1xHWJO+BO/x5TAC+XF/WVbWSelJc
   OKgaESjXlNFQVUFgQBkDNxBZ6VKh9BZoclIq2XfkTVIbiWCdQbaOjoWDM
   gmYG+LJMvvLaAonabmNg05S5yy/CjqnwZYD40RQOddik6uGG+8cPPjK8l
   ghub5xQRG7nsC//bQNPuNiGJ6FrKCs5aKp1OWt6XqRqh3h3jo8BgBajtm
   Nhjka4Z1NBCbMm9GHpM5dFpnWNdTFroewxOyw3Y9/qDkIg+OowJoNrd9N
   Q==;
X-CSE-ConnectionGUID: iNgGfuk9TGmejPxYcW6DXw==
X-CSE-MsgGUID: Gdz3Fut1Sd+I59YFiuOdxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98426554"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="98426554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 20:51:37 -0700
X-CSE-ConnectionGUID: ERZPrgQsSaeg8RRnlwuHmg==
X-CSE-MsgGUID: MFHycAsVS4CiO0YjoE2S/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="269124170"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 20:51:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E306399; Tue, 25 Aug 2026 05:51:33 +0200 (CEST)
Date: Tue, 25 Aug 2026 05:51:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 0/3] Add Apple T2 NHI Device links
Message-ID: <20260825035133.GK893316@black.igk.intel.com>
References: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>

On Mon, Aug 24, 2026 at 02:42:53PM -0400, Atharva Tiwari wrote:
> This series adds support for Device linking on Titan ridge, and
> Icelake, which are used exclusively on Apple T2 machines.

We are in the middle of merge window, nobody is taking any patches at this
time. Only after v7.3-rc1 is released. Please be patient.
