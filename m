Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C146D0A3
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054157; cv=none; b=JYFANCZwykfPlaikGKnQb30H0NIpL05+nYsyRRSu7z7N1kH5fW4E+PhRrgwiQ0FfB0F4fgq7VRdHdyO5P++5ME2FR+BD5r3mEi/umS3VCKkxXzcxxVrH8Gt2jxwXqbAcC7UffGFKVet0oafIaIaWWnz8CwTFA23OILGBJ3uoI4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054157; c=relaxed/simple;
	bh=8UoCslDRSe4PuXt/Dj5KV2hFiRbV0vYiOYJZ3sB1oTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk3KVYOl1ov6sKGso6vke/ODCKK1ZtF7YHLTrP0Agi7ml2Yg7GtPfAirKGrJhoYNHUtH7Qyf/IAHpq7jtre/Gei6HDVYC/BM98JUEq98GaEM5r+E5y/MSoUmUp0gEv58m9m5REJFCfX5g+RZQ0k3TMW1j3BwHai4vFQrBClkF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpTIWIut; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpTIWIut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787054156; x=1818590156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8UoCslDRSe4PuXt/Dj5KV2hFiRbV0vYiOYJZ3sB1oTo=;
  b=GpTIWIutwY95NvItf9ZmQvcLNphSUQkboX7brYCQgkmZ1CBS0dHxk2kH
   8MJ797P50HMdcY8KxZqoePV48D2SW9EMreniq+Xdpa4s6EbUbdATJQ3cG
   0NN+gn+NFYSGlWQQ0N9iwTJ99N8bSnwWRRhYlC2WlY3R8yAoKrWJ0U9+7
   95TUM/FXiX3/KVhQoY8Qzf896hAmyw7LZ/PvUZrpp296oECnpvtzlp437
   eRoyWGaFeIfsoorIX4kiL/TfDbyREfeJV348YaOwQJVrlAh+FgJJHe3TP
   /3Jbi0b6orj+3A43Ow6bT/GUrB7OtqOLHXtwMIdSjyKyFPU24dQ3HQzgh
   A==;
X-CSE-ConnectionGUID: mC550tx+QKiQpjmxoJhkdg==
X-CSE-MsgGUID: RPVoW0qISAKnuf9gVwMcrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87666480"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87666480"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:55:47 -0700
X-CSE-ConnectionGUID: JVJiF8eeTIe9gjZHb46/6w==
X-CSE-MsgGUID: lgsqXzDkS7aUgqDYj9oHTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="260994977"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 04:55:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A255699; Tue, 18 Aug 2026 13:55:44 +0200 (CEST)
Date: Tue, 18 Aug 2026 13:55:44 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David GUENAULT <david.guenault@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
Message-ID: <20260818115544.GY893316@black.igk.intel.com>
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
 <20260807043719.GI235112@black.igk.intel.com>
 <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>
 <20260807101805.GM235112@black.igk.intel.com>
 <CAOFj14-tWAAkwGOuoyS_w-kV87PvLaXMViXmNKW9wjxS9Hr3yw@mail.gmail.com>
 <20260807112925.GN235112@black.igk.intel.com>
 <20260807113501.GP235112@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807113501.GP235112@black.igk.intel.com>

Hi David,

On Fri, Aug 07, 2026 at 01:35:01PM +0200, Mika Westerberg wrote:
> Okay I took my laptop (TB3) and connected TB5 dock and I can see exactly
> the same issue as yours. It definitely should work in TB3 compatible mode
> but apparently not. Let me ask around.

Sorry about the delay - inside big corporation finding correct people
sometimes takes long time. Unfortunately the reason is that none of the
Thunderbolt 3 firmware connection managers support Thunderbolt 5 devices.
It needs to be Thunderbolt 4/5 host (FW CM and SW CM).
