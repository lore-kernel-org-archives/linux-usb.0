Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62E11DDE5;
	Fri, 27 Feb 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177635; cv=none; b=r5zSXr2gsjXnKWOnm0/INtuhDXPpzo804BBLQmIjPQKXRw0pt5YEp4sCTOl9YEquvLxiznJZ/0uQitZCP25chfEN68voYx9EkobU3S6qTO3oDg+6FYHbZG9FdCj7jQGlT1V2iseLLsRuBKGeytJhalFj2CEZJLf8WqhIvq2Gn0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177635; c=relaxed/simple;
	bh=gw1rElWVcPixOfnSXWh1FF+zBg9GDlnTMbHLIjggaoo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpwYUNp4egat9c7iwqkdQ257lwpWRH6nprJpICygZHO6UsSIbysIVxChzd3gbrNuUl+9g7URgT0Pj5sTgOfSh0Dnq7esCytlb+zG5kSjXHF5genUj89it1uNdRBryitJO7mr0YUVWVAOP65WpULZ/RSMBqCKj9MUIYAs1sHs7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: FrYcqjpLSWa8wzunfue10A==
X-CSE-MsgGUID: GMdP4WgzTjqU41DFAnpTPA==
X-IronPort-AV: E=Sophos;i="6.21,313,1763395200"; 
   d="scan'208";a="168101668"
Date: Fri, 27 Feb 2026 15:33:47 +0800
From: Dayu Jiang <jiangdayu@xiaomi.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
	<mathias.nyman@intel.com>, Longfang Liu <liulongfang@huawei.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, yudongbin
	<yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>, chenyu45
	<chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>, Dayu Jiang
	<jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Message-ID: <aaFI20iOTCI+GGqd@oa-jiangdayu.localdomain>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
X-ClientProxiedBy: bj-mbx09.mioffice.cn (10.237.8.129) To BJ-MBX03.mioffice.cn
 (10.237.8.123)

On Thu, Feb 26, 2026 at 06:44:02PM +0200, Mathias Nyman wrote:
> On 2/26/26 11:27, Dayu Jiang wrote:
> > Hi Greg,
> > 
> > I have updated the changelog text as requested and resubmitted the patch.
> > https://lore.kernel.org/linux-usb/20260128100746.561626-1-jiangdayu@xiaomi.com/
> > Please kindly review it and let me know if it is acceptable now.
> 
> I'll send it forward, but changed the commit message.
> Does this modified version still describe the case accurately:
> 
> usb: xhci: Prevent interrupt storm on host controller error (HCE)
> 
> The xHCI controller reports a Host Controller Error (HCE) in UAS Storage
> Device plug/unplug scenarios on Android devices, which is checked in
> xhci_irq() function and causes an interrupt storm (since the interrupt
> isn¡¯t cleared), leading to severe system-level faults.
> 
> When the xHC controller reports HCE in the interrupt handler, the driver
> only logs a warning and assumes xHC activity will stop. The interrupt storm
> does however continue until driver manually disables xHC interrupt and
> stops the controller by calling xhci_halt().
> 
> The change is made in xhci_irq() function where STS_HCE status is
> checked, mirroring the existing error handling pattern used for
> STS_FATAL errors.
> 
> This only fixes the interrupt storm. Proper HCE recovery requires resetting
> and re-initializing the xHC.
The modified version looks good and accurate to me. Please feel free to merge it.

Thanks
Dayu Jiang
> 
> Thanks
> Mathias
