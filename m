Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C3FC0A
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789965902; cv=none; b=BWTV4fcB24I9I0g5q+IMQf67VFPDwP2UyVS7+H/SnUdEU0bda0gDXyPCJWXKY6PcbbiD+i8icxH6Hnv5SKGg0xRF9fj+yxt2dtRnu0KCgQ5Gd6fF42vY74Vv6GYAgu7LwqWMGWt2TVRm2SNH8NHExDZ5YScZ8ED/09laUtU5NPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789965902; c=relaxed/simple;
	bh=A87zA/xlh0nywnOOhP3FZ0Syqvb7up89jQHbKv7SUoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM0MQhKFgYh78gSBOuKxFaILmilRdaAZw6IGIcjvjeLo6TKjeGnYn3NCmff74HHu/+iIf+KYVOeq8Qs9yKTsBDw5x1CTCvuPEBv9EmrPzDqx/alhYaYYdQISo14QpMi+3R9QUMQ0/qhQ7dJHjmFGWHPd7q7UAJGqIpWol2Bchk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoCIoyw+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoCIoyw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789965901; x=1821501901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A87zA/xlh0nywnOOhP3FZ0Syqvb7up89jQHbKv7SUoc=;
  b=VoCIoyw+ivEk++TD3SncAAYZUOvoO+RXUJOEWsL3A+TYVIJD4Ua28v/d
   8PjkeUJqZfA2tKJVpBWY9qroO2k+dDMwtJS6cqQMm+NmgSrMkNtiwAVpO
   mQGgoMp+7p9RAWnRp2jnGbmzsOuKYeLXcSGz/USuzqoQId7Zsl6sdGqk4
   Ej4WE5S/EOLBKAZ0CmijykIkxlSIN4oCsR0YizUoexa2ShwnIdXwqTPCs
   5omeG9i3dxmdGNvrUOPpPP8RvWSI1qdkfHsK9oZyLNEz3qNDZY/vFguDn
   yTBWNY89G/LpnshTeaBMUBFxytuIXlKkS8wwpEHQv8Yg7YTAahWpBn61B
   w==;
X-CSE-ConnectionGUID: e+9x3KE7QqOdS+XIiNEcQg==
X-CSE-MsgGUID: z6PDXDrlT5CF4iKYOKdfnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="78023458"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="78023458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 21:45:00 -0700
X-CSE-ConnectionGUID: xsOTsZVLSs61d3jSNBe5nA==
X-CSE-MsgGUID: nlPJf2wHTXCSmIBbOSJF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="277269999"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 20 Sep 2026 21:44:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9DA8099; Mon, 21 Sep 2026 06:44:53 +0200 (CEST)
Date: Mon, 21 Sep 2026 06:44:53 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260921044453.GJ106095@black.igk.intel.com>
References: <20260915041958.GE106095@black.igk.intel.com>
 <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com>
 <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com>
 <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
 <20260917043847.GV106095@black.igk.intel.com>
 <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>

Hi,

On Fri, Sep 18, 2026 at 08:28:09PM -0400, Ben wrote:
> Mika,
> 
> After some headache, I was able to install Windows 11 on one of my disks.
> 
> After driver installation, I was able to cold boot and have display
> plus USB capabilities on the dock right away.

You should be able to get the same on Linux side too. If the link is USB4
then USB3 goes over tunnel and the dock should work as expected.

> I have confirmed that the link speed negotiated is full TB4 bandwidth
> with either cable.

Are you able to see if the link is USB4 or TB3? Can you do the same now
with Linux, boot with the dock connected and share full dmesg?
> 
> I'm not sure what this could indicate for where the problem lies, but
> I do feel that it's useful information.

It is yes.

> Please let me know if it might be a good idea to direct some
> additional inquiries at ASUS.

Let's look at the cold boot dmesg first.
