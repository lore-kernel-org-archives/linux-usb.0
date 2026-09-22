Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B43E5A17
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 04:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051174; cv=none; b=lV/pAKee6aXglHjhfkaaGGGXFGG9j+jGP06p3WFvL64Ich6II7wR/HjXtddFFnTLYx7MFuKbsjRV2jVsiiVjaSuUQWjyyG17IeULBMwH/W1ORhJ0GGpgq9qWscCeLGmuhm3EBkyYPlQqexQdcYH8n8aZGGVCV0zBwWy5Ng9B16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051174; c=relaxed/simple;
	bh=r6nVCLRc+/CKHPGnmtQggs4j3Jmkhk+QymNccxDudV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHhdKjX4ABOznwt9wXfKW5Mop8Sm7+mPNdKfFWsZkHjYk/Qjpbv1Xlyp9519WDuruTNU9o/NJVTNNJOOYFwFlWAnKnmMoI1xtg2I+70Po3vGOSzfuvHM3rBhnMQOIes8VOX0hqjhwVF66QhO18rdxYqm19Xd9SW92oNbNFy2tIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ew1iW+QK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ew1iW+QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790051172; x=1821587172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r6nVCLRc+/CKHPGnmtQggs4j3Jmkhk+QymNccxDudV4=;
  b=ew1iW+QKgb8usiEY+YJ3f2U+x+WMg+PE+YSXOGJo7O+O/jZZhb5mgaag
   XYN+SCEtMxMgNDgTKcX+OidzOGbVYQ/91aysUUMpH7GebYDdzovz3d5/d
   EYEd5Z+pHsl/mchnFJNWRT0yk/vYl1aM4og8JC1Hqbs8TyK3rx8KOYYEK
   yspQsZKsfO8grN5nvz2Sqdjrqm4B47okxq/aWDOXmjcqnFy8Pc4spjIJk
   rWxVOYluCAKaIxTStTFgRupG3v+iRF9vdvzeYESE2gA9OGGwfPvXhErs8
   RryUwPYKFTuc/PrWqX/Ng4g0z6qi8Hb0omY10bBoEXBGRZcdL754wFeqa
   A==;
X-CSE-ConnectionGUID: eUb3/LEnSPa7/s8PUJZZbg==
X-CSE-MsgGUID: 23UsoqkCRCGmb57KBMj9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90638799"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90638799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 21:26:11 -0700
X-CSE-ConnectionGUID: +BoNQ2GgQJKX8DNUhd292g==
X-CSE-MsgGUID: lJSNT0MbRJOjPC+z7d+irQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="300882411"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2026 21:26:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9610899; Tue, 22 Sep 2026 06:26:08 +0200 (CEST)
Date: Tue, 22 Sep 2026 06:26:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260922042608.GZ106095@black.igk.intel.com>
References: <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com>
 <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com>
 <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
 <20260917043847.GV106095@black.igk.intel.com>
 <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
 <20260921044453.GJ106095@black.igk.intel.com>
 <CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>

Hi,

On Mon, Sep 21, 2026 at 07:25:53PM -0400, Ben wrote:
> Mika,
> 
> I've attached the dmesg output from cold boot, the output of tbdump,
> and a copy of my boot record for a sanity check. I plugged my
> mouse/keyboard driectly into the motherboard as I tried once before
> this and did not have access to USB devices through the dock.

Thanks! Yeah I can see that the xHCI is enumerated just fine:

[    0.444810] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    0.444815] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 1
[    0.446007] xhci_hcd 0000:0c:00.0: hcc params 0x20007fc1 hci version 0x110 quirks 0x0000000000009810
[    0.446448] xhci_hcd 0000:0c:00.0: xHCI Host Controller
[    0.446450] xhci_hcd 0000:0c:00.0: new USB bus registered, assigned bus number 2
[    0.446452] xhci_hcd 0000:0c:00.0: Host supports USB 3.1 Enhanced SuperSpeed

but then later on it is not accessible anymore:

[   24.964042] xhci_hcd 0000:0c:00.0: Abort failed to stop command ring: -110
[   24.964050] xhci_hcd 0000:0c:00.0: xHCI host controller not responding, assume dead
[   24.964053] xhci_hcd 0000:0c:00.0: HC died; cleaning up
[   24.964071] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
[   24.964075] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.

It could be that it went into runtime suspend before that. One thing you
could try is to connect USB3 device to the dock, like memory stick or so.
That would prevent xHCI from entering runtime suspend.

> > Are you able to see if the link is USB4 or TB3? Can you do the same now
> > with Linux, boot with the dock connected and share full dmesg?
> 
> In Windows, I check with the Intel Thunderbolt Control Center, which
> indicated the link was TB4. I then checked the Device manager and the
> PCIE device indicated that it was taking up enough of the bus to
> support that, though I was not able to take a screenshot. I could
> check again if it would be helpful

Can you see the 0c:00.0 xHCI in the device manager? I would expect yes and
then this ends up just being Linux specific issue with the xHCI on GR. I'm
adding Mathias in case he has any ideas.
