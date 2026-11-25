Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608287;
	b=qNJJqH51+rVDx7KCoMnDO6ExmZL7uVWnVd0/yA4l9iiA3lNvpj4uPALWRXlwEMuPm8eL
	 uePzOojeZbraHWVu61lBu8RauxYIQITvGskCIzD2h77Wpz/BR5B2gD8QY/x/1pXGqZSae
	 QJISGmslCo48NIc2scOUWbAXIUBGeuZbqfz8ZCt81ZaAZjvOWtnb7f/e79Ziu+UCPnik+
	 A+Ibf+doIqsbsA6Y7I9C9R6Wcpn8EY5OFtTB1d11gAw+xH50ey882Sn8RVo7WZcaq7zpf
	 iE+PI6NFceTySZDANIJBg3tGSTz1G/AR5QNfEhheEc7BQfra8UI4afTl91J0hccPFtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608287;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=lBki+4xAXmSxHooQdTNTB74XM3rdpl5Jlw/sGPjJ2bQ=;
	b=3K5vlafeSRpPEfVfpnG326uJ1lnh3h9EWVdcSR5Pp6Ru2f/daswP1mXtRklCVS58eLWH
	 VzERBgI7EuxjzdcjAokKx3JPYHctQTsVRyegE0qhNQ5OPUauusF/4ANp1o/LcyWSoEc21
	 z/BOb4XZS+eGcULoSrgOQ7Rp1Pv9rcfYtGpJIr5YQI6TdH8uAn55o226DXQ8EVrd8OMZN
	 ogU6i0cylR0g/2VltqiQ3Y0gBZHTVSTHTgToOQOhDl5YBwLLVxqXjx6z4oHh2HHckwX8Q
	 26C8Dyicdxo/Z9dCW6FHfnlpzRQ32SAxKzg4pgXFARUuE/fs8XUQw/cl0zQJ3qkVQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHv2ssyS;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B9A606A323;
	Wed, 25 Nov 2026 12:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B9A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VHv2ssyS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795608286; x=1827144286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4cKCKbZSIGARMvx3NwbCNxA9KCH81gFlhOHiyitYp5A=;
  b=VHv2ssySsEh4bLGg5deffnA422oVNWFf37p3rNQ6xBQtMG1ndehXL1PG
   5IszMZB6VxOq9XSC5vzXcmpCLOwo8qA/Dh0o6geOFSw2H2ZD1ScG6O1Ve
   5bjSDB7JISqea3ExgXb8PGNCqHvNYf+Lzt9BuNaGLdyipPuhptCpQfYOC
   fafesuYflZEd+Bs7aee/sOgPaVxmMmUYoUynHrCfJ/AOohtr7Zc9st3Z8
   bR7OQT5nZB/NvBcTx4kGhHYHiTl8Cy+BxIcCcOT8kgVp+Tl3q/arcd/dY
   QxlzlBiKVGQF2HFsQOIyWjGRHsG6sLAJQdsocP4kQC/HUMLrPwbvJvG6M
   w==;
X-CSE-ConnectionGUID: /QfEf5UwSdaOdz0rbf4bIw==
X-CSE-MsgGUID: sUmAS1zMTMuQte//An9T/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4487613"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4487613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:03:31 -0800
X-CSE-ConnectionGUID: 2HWffgX6RFq12SN9EC9gjw==
X-CSE-MsgGUID: ooBJMlv+RsmSgY38fCWINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11719607"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 04:03:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2A23B98; Wed, 25 Nov 2026 13:03:27 +0100 (CET)
Date: Wed, 25 Nov 2026 13:03:27 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Message-ID: <20261125120327.GD191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
 <20261124161159.GT229695@black.igk.intel.com>
 <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
 <20261125071300.GA191152@black.igk.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261125071300.GA191152@black.igk.intel.com>

On Wed, Nov 25, 2026 at 08:13:00AM +0100, mika.westerberg@linux.intel.com wrote:
> On Wed, Nov 25, 2026 at 06:43:38AM +0000, Chunfeng Yun (云春峰) wrote:
> > On 二, 2026-11-24 at 17:11 +0100, Mika Westerberg wrote:
> > > On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> > > > In preparation for modularizing PCIe NHI support and allowing PCIe
> > > > and platform NHI drivers to be built as separate modules atop the
> > > > Thunderbolt core framework, several NHI functions and structures
> > > > will
> > > > need to be exported.
> > > > 
> > > > Currently, several of these functions lack standard subsystem
> > > > prefixes,
> > > > risking namespace pollution or collisions across the flat kernel
> > > > symbol
> > > > namespace:
> > > > 
> > > > - ring_msix() lacks any subsystem prefix and diverges from all
> > > > other
> > > >   exported ring functions in the driver, which use the "tb_ring_"
> > > > prefix.
> > > > - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard
> > > > "tb_"
> > > >   prefix used across the Thunderbolt public interface (such as
> > > > struct
> > > >   tb_nhi and struct tb_nhi_ops).
> > > > - nhi_msi() is named after PCI MSI, even though the ISR simply
> > > > schedules
> > > >   the interrupt work and can serve as a generic ISR for non-PCIe
> > > > platform
> > > >   controllers as well.
> > > > 
> > > > Rename these functions and symbols to conform to Thunderbolt
> > > > subsystem
> > > > naming conventions before exporting them:
> > > > 
> > > > - ring_msix       -> tb_ring_msix
> > > 
> > > I think we can move MSI-X completely to pci.c. As far as I can tell
> > > ARM
> > > stuff is not going to need that. While there we can drop MSI, that
> > > has been
> > > never used (MSI-X was supported from day 0 by the HW).
> > If move MSI-X completely to pci.c, then will rename and export another
> > two functions:
> > __ring_interrupt()
> > ring_interrupt_index()
> > 
> > is it fine for you?
> 
> No that's even worse :( But I was thinking that we can do the same for MSIX
> as for regular interrupt in nhi.c:
> 
>   nhi->irq set -> request_irq() for that
>   ring->irq set -> request_irq() for that
> 
> This would hopefully limit the number of functions we need to export. Maybe
> it allows us to get rid of the .request_ring_irq and the like in the
> tb_nhi_ops?

I realized we cannot do this for MSIX because we allocate them on-demand so
the callbacks need to stay. However, we can avoid exporting ring_msix if we
make ->ring_request_msix() return the interrupt number.
