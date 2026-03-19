Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057AC3F787A;
	Thu, 19 Mar 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952435; cv=none; b=LdeQIgD06WAjNvgJ7ymUXsuO9wu7R52qkKu6rbE52/ficBZc/tbg4Zd6YxsbPo4cXJbW51E0bjpGKRVilOJaDy6Hx0H98s6DfSADLCmlB99f6mTy/LyJ+3excQQoDs6y5p0B7SiUlJUuGMVT33HY8j1LU59cGfgjeqD/iUWHo3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952435; c=relaxed/simple;
	bh=3EbJx8Ae5tl5wdZJFSejOs5tf2ulPnNo7cGU+t2db88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBHkB0iFB/eCpNrKhsSa+PH+4+wOTI9bZQZ9auJG1HZBrSOBSfwWrhFVARzZ4CTnjsomtcyXT4j01ircnZzv3uBne56emnsVBJ0z5KyjtasNuyS8rhYsCF3LJ8d34+88HxISkxngCc4wVd2vSWi2KfeaHss4pw2OxyTJzChgWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaLsAbfs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaLsAbfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773952435; x=1805488435;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3EbJx8Ae5tl5wdZJFSejOs5tf2ulPnNo7cGU+t2db88=;
  b=IaLsAbfs/5CsIhweLogmPK7sfaouRjw3BdWPiY5Zcopfs4IbpX7wZI3o
   uz0g9PhsjiDQtc4XAA2L+1TRciHFkf3nJjppMyQ2pcOgHjs9hG6zIl405
   NkSQy7oLHPou/hcHAQhE+NZLB0pu+ZWA8oIyptZew7fL21mVCY5K6kBBk
   VEVe/cGvHBMs7IiNRn7DHaPCnb+usFyoS+BEFtFKK5zSZtwfW1lREbw7t
   cH9jbZj3BBmudebjgSwBGUGPTwKaMgBKFHenCgFpTVLBf3//CUzq0uWQe
   NEllGewTBL8ZPlR6RHF9cV6C8BDZ0GROnW9BLEYsuJZh/pUktpoASzAH0
   g==;
X-CSE-ConnectionGUID: /J2k+Uw7SiWOoa5fwHndCw==
X-CSE-MsgGUID: gktqsD+ISFazNdQ8nTdUoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74924955"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74924955"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 13:33:54 -0700
X-CSE-ConnectionGUID: 7uKHaUOgTMWs3Xlx8+8tGQ==
X-CSE-MsgGUID: CJOlNaNtS6G+ArXYAi4MuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223056519"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.144]) ([10.245.244.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 13:33:51 -0700
Message-ID: <408ff4ce-1020-472c-9526-312ba8ea2ae1@linux.intel.com>
Date: Thu, 19 Mar 2026 22:33:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Simplify clearing the Event Interrupt bit
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304114224.62814449.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260304114224.62814449.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/26 12:42, Michal Pecio wrote:
> USBSTS is mostly RW1C, so to clear EINT we should write just this
> one bit. Remove pointless code which ORs the bit with current value
> of the register, even though the bit is already known to be set,
> and writes the result back, which clears all active RW1C flags.
> 
> We used to inadvertently clear PCD and SRE in this way. PCD isn't
> used by the driver and SRE is only used at resume, so clearing them
> should make no difference. Don't clear them anymore.
> 
> Tested by connecting and mounting a storage device on a few HCs.
> 
> Before: xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000000
>          xhci_irq USBSTS 0x00000008 EINT -> 0x00000000
> After:  xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD
>          xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD
> 
> Some flags are RsvdZ - should be written as zero regardless of the
> value read, so technically it was a bug. But no problems are known.
> 

Thanks for cleaning this up.

Leaving the Port Change Detectd (PCD) bit uncleared worries me a bit.
Did suspend and resume still work properly after this?
especially something like wakeup from suspend (D3) on usb port connect

Thanks
Mathias

