Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741E415F29
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503817; cv=none; b=gsKi/+GFAhG+beCgmvbulVUE9HFZqEdO9Ndg/1Xzma1YzpsvVNPdb2IVqwMEQDV7sV4cIgoG99ObPClwOK2EIETHyElRHd31JUfT8h+4Oegw9VQ0YhQcsdxFbo5n8TpRLBtyTR3OdF9OwS7Wea+e+emz/yB+kTC2JXF1NdRu+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503817; c=relaxed/simple;
	bh=S8eX+EWdhXtgAUpdZq4eG3a0Alh8elXVXoSywYwHJpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUyDJXRUMZeZdM/fGFLQ4BrB0aeDi7O96j8dCj62qMkzDVKDVqCguPLH2rWoJdLe+FwnMIvWSTWWjHH4uj7TQdAYRcQkYiRdbEIzN8WhZm7+GlWAKBmlqFBh2rog5jlr8Fd15EA+ANmMoBTJtwTOCDyghra1foePz2PccQRfRjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5EdQLPj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5EdQLPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788503815; x=1820039815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S8eX+EWdhXtgAUpdZq4eG3a0Alh8elXVXoSywYwHJpw=;
  b=H5EdQLPjM9R8CjZN+k0QyFlVR149ieTNDRM2WTeM/oz97nokoONjuLlw
   EIhl/JpMiLXAFPsj/6uOUC5NgPMbz38mYoBJbJQcAlbJdnbfN4Q9PduXX
   DO3e2kW4Y/UTo10oGuQBj1cqSExB9xPVvfki5PawAzaHZQXdpN9oAxH3F
   rWPgxl6Z2E/f35hVeWFf7RaEv57aLkNzth1tnzg5v6mkhEgovBVx/O3M4
   etRCPG27ong8+o/vUGB2SYQ4zMc5Um8zV3jvamw4HCRrCDY3bvlUVpY2E
   947KI2CGNUgkH+YtDSxMYSPnEcA4e8374fFymhwcYZCGhBDzccHd/42R9
   w==;
X-CSE-ConnectionGUID: l+24Qz5aQwSKt4QsFTaXvA==
X-CSE-MsgGUID: hP4sjKsMQBWT4XGgYCFjpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99657970"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99657970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:36:55 -0700
X-CSE-ConnectionGUID: 9ZWigp/fSTWn+48aqDZRYQ==
X-CSE-MsgGUID: 4ACzD8krRJS+WTe9GGLNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="308174613"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 03 Sep 2026 23:36:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 27BDB99; Fri, 04 Sep 2026 08:36:52 +0200 (CEST)
Date: Fri, 4 Sep 2026 08:36:52 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Milo Chen <cmh79479@gmail.com>
Subject: Re: [PATCH 0/3] thunderbolt: Couple of fixes for reported issues
Message-ID: <20260904063652.GR106095@black.igk.intel.com>
References: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831131840.1982842-1-mika.westerberg@linux.intel.com>

On Mon, Aug 31, 2026 at 03:18:37PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series contains fixes for issues we have noticed during internal
> validation.
> 
> Mika Westerberg (3):
>   thunderbolt: Fix KASAN reported use-after-free when request is canceled
>   thunderbolt: Use separate lock class for each ring
>   Revert "thunderbolt: xdomain: Notify peers after enumeration"

Applied to thunderbolt.git/fixes.
