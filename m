Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D63D9DB6
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664012; cv=none; b=qbvZBAiEWTDgZBUQjHP83oa9hwSUDZNxUQ3Kqk3JLzhhAwVtr1vLM45jypJ2LxelKl2EHTC7otgpFBLMwNOuTW09W4WuVmumPYLGyU0fqyaX9S1rX6M9Bf92mMu2Bssm9W9Aj/THKusoJTveNLnVv9IsfZTSZtKVlj66X+zew7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664012; c=relaxed/simple;
	bh=x+EpRcRJVemKLVmrCBfSQUo61TqZ640MnFWVtZm6mao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaDvBwQWi936R21jSbVEkbADnEX4yfEdLrbaBZtTy7wKWBBVJVAhd+Vxr1jGkqdtXxLdXMM7ysBiHeFivUofxBynGbgUis1AiGfnv5zwtp74ia3pFHFdGzXhpBS6q645789QlgQouWMNpEF2cGSnJd4m5Oulv9f2o2fKHyJ4w+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWVlrDu6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWVlrDu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790664011; x=1822200011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x+EpRcRJVemKLVmrCBfSQUo61TqZ640MnFWVtZm6mao=;
  b=QWVlrDu6H1DHPv9OSO3pFu9mdIKmCbtfg+XtuWqXVp8lFr2hjCrU9Uvq
   dSmZ3xN1GKXZANxIDXTeIpukhRyOo0+g8cKfsgJ0WMe2EFJEvfcF20zZ1
   f8VoqMggcjrTdoweCIjkOfGN+VvvzFi7PQurkaoD/+yQAX+dMpEvyXkdD
   JLNmz7eH1ejqSWmdEi87gkJsAWqDxjpxZyhrWV5T0UqlQ3JYITCEse6e9
   CBWrlDRNwA8/zX0CEHAQpYcgdSFXnfxwaCwsz1cvFmmZ+FCAC5DhowLPu
   ZhjSX7iOTxZOkLFPpD1uR5h1k12JQOIN004UFzALRcJEOdLZpJdLsXMQl
   w==;
X-CSE-ConnectionGUID: S3xFrj2MROqnBqm/4amICg==
X-CSE-MsgGUID: 3AKPAIhER86h5NIDNRGe7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90238996"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90238996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 23:40:10 -0700
X-CSE-ConnectionGUID: uZ2Us8/JQDegRlx0nT1Kqw==
X-CSE-MsgGUID: a+EOZXWBTSuz57rvAMy+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="313219392"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2026 23:40:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 29B4699; Tue, 29 Sep 2026 08:40:08 +0200 (CEST)
Date: Tue, 29 Sep 2026 08:40:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: brandon.proulx@42fifty.dev
Cc: "westeri@kernel.org" <westeri@kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Thunderbolt: reboot hangs in nhi_pci_remove() with CalDigit TS5
 Plus on AMD Strix Halo
Message-ID: <20260929064008.GK106095@black.igk.intel.com>
References: <3jbg0iV8op7Un2K3xLx2Y9Y_m8MbrxhUGm6y7eIO-UhE20lCXE321cO3Vd3IzDkBMy55DMA4A84SBZfOxoje_UHglYaYP9PxfvrstgSZd9E=@42fifty.dev>
 <20260926101309.GC106095@black.igk.intel.com>
 <nxr6GV-FbflB2r0-2kRJbGFFyhMIfL7FKPuvjeV2X_vzpxf5SRcLoS-DTT2022-tzGIegm3GxbSXLMAF9ri8frabpjm4KwTw9MYRekLmRuA=@42fifty.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nxr6GV-FbflB2r0-2kRJbGFFyhMIfL7FKPuvjeV2X_vzpxf5SRcLoS-DTT2022-tzGIegm3GxbSXLMAF9ri8frabpjm4KwTw9MYRekLmRuA=@42fifty.dev>

On Mon, Sep 28, 2026 at 08:29:55PM +0000, brandon.proulx@42fifty.dev wrote:
> 
> Hi Mika,
> 
> Yes. Those fixes clear the hang on my system.
> 
> I could not boot the fixes branch as-is. It is based on 7.3-rc1, and this system runs 7.2.5-3-omarchy. I applied these four commits onto the 7.2.5 thunderbolt driver and loaded that module:
> 
> • thunderbolt: Fix domain reference leak when DPRX read is canceled
> • thunderbolt: Don't access a DP tunnel after its DPRX read was canceled
> • thunderbolt: Mark discovered tunnels as active
> • thunderbolt: Tear down inactive DP tunnels when the domain is stopped
> 
> Before that, unbinding 0000:c5:00.6 with the TS5 Plus attached blocked in nhi_pci_remove() at wait_for_completion(&nhi->domain_released), and reboot(2) stuck in the same place until I held the power button. dprx_timeout is 12000, but the wait lasted many minutes.
> 
> With the patched module, that unbind returned in about a second and the dock came back on rebind. A normal systemctl reboot then finished: systemd unmounted the filesystems and the machine reset, instead of sitting on the splash.
> 

Great to hear that it helped :)
