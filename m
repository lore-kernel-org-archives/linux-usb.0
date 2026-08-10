Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F642586A;
	Mon, 10 Aug 2026 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379495; cv=none; b=YBj//P4ltYc7xR/b5fzdKjk3W5KxD2gKObBh3beqvMuVlajqBExp3nbS3qkfaVI5R9VvNrDYFIhdO4V2/9KZYQz1F1cHPqgqaDo3uTA85Alwgq471Bsz4A7ARzKABADkY40uWKVKp1YyERvi1UwtqObxbjJDE/po++SGz6FEgxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379495; c=relaxed/simple;
	bh=yVfTQQFhXDsBooZkgWel5RPboX7JEV9rEq4KfpbuO20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRBD40St/zLtwobjpL2gVI2+kKwgp17+rh2plvCt1vpUUR6Bwio7J1paO1xeCfyqb11lj8paCH5JYp0ld+gRef/pKMLZFweZvQoZPgUTBFTA+LFDtFsgb4j9Il8b8vOZAetStP+L2799pUsfQt9oKKVf2Ru/aHQscuuqil4cHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8dDS8aR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8dDS8aR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786379494; x=1817915494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVfTQQFhXDsBooZkgWel5RPboX7JEV9rEq4KfpbuO20=;
  b=f8dDS8aRIoXg5ufFA2Bb5mgW2+WUhxMgVHtvcDJmdb9BKK/pXsbk0jy5
   wri2OF9VxtA0UzICjaX9gc/pWSWNZ7SKvw5t9TXC3TZe3Xe1gSbuQ4o7i
   W5Sd9rZPMI1OCZ3zUXxbtm8QFXKj6McRot5vhmbg0UQzGWGk1kVODOu4V
   5o20U6Cuv/gMO/FMEXIdQD/FbjOdZtE07laVcbGgXX/Flq+zyBLy6s4UO
   Aq5GKsYyVt80SoGakRyZG/PeiNhlQcOix7u3uPTLbxE02hJ++7U0wt+Tl
   bPFKhMuoFzaKywB9e8fz/XQ1hyZ9TB5GYaXpV9V65Px4T3Sncf0NfpLGD
   g==;
X-CSE-ConnectionGUID: tn1kaujlRt+kzFkjgV14Tg==
X-CSE-MsgGUID: 4S8zvRxQQ/COptyDrVOR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86659285"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="86659285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 09:31:33 -0700
X-CSE-ConnectionGUID: Hsrr/c5zQy+o2Bk0QnHZoA==
X-CSE-MsgGUID: XAuMIhRgRoS+vPVYxol2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="263140715"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 09:31:30 -0700
Date: Mon, 10 Aug 2026 19:31:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <ann84DKCXCPLtgeX@ashevche-desk.local>
References: <20260728100005.413868-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728100005.413868-1-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 28, 2026 at 06:00:04PM +0800, Chen-Yu Tsai wrote:
> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves 'message'
> set to the default "out of memory", which is somewhat misleading.
> 
> Allocate some memory and put the currently separate error message in
> it, and use it as the error message. If the allocation fails, use a
> generic version of the error message. The allocation uses devres
> helpers, and will be freed after the message is printed and the device
> is cleaned up.

The 'message' is local to the function, why devm?
Shouldn't __free() be sufficient?

-- 
With Best Regards,
Andy Shevchenko


