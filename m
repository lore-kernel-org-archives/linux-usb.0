Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590786;
	b=OBUtKAiJY4W+8tF5kpqkxdrJyuZJYf+rIkz2J4g1KG/4iTyXn6mxw7hXpoaD84YhVZn9
	 xfTa85ThyhC9rdqZBeBWhxGT4AJif1SPRIGCeEv9gN/985HBnp5xwvAD4h7yrwei9xiC1
	 ERwsI68vtyas95X1UcnShL0I3TF3bpxlchWUFRGe73gVgj2YoHqvJ6zmM77MnzXBFVfQu
	 YBR2grYsQYj6ma5KQVbEsPJcMFpCdoDqzASabM4A3/SR1eK/KmZLtxEA5PSZiyn7u57OH
	 Vm2Yo4dwWZvQPs8EGZ0yw0zuOq5OrLQ6U6jXXriFQqNGbpUMxex6DpnQVnQSAMF3VhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590786;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=zYavSeCQUXeOqjBEOsWlCt1Ej1YB9Ghr9MX6vU9qkiQ=;
	b=bcfRspw3c7kcMkh+pc4P1R4NmL4VNcnoWjklcYfMrBBAZQA1ikwtPbTplcCUAO2E7lFn
	 tgrSNRaQfZRGUWF/r4u3U9mZfP5Fv0L1cvAquzwHCY7jJSHlAiQ642a10BTcAqTQRlnGJ
	 ph76uLUt5MG0u+VC8iB19Izk+22Lfxe7Q55RSQUUyLEJtgGYfUtHddFDoU98DmTJfRyIM
	 Ve2TCC44ndni+q75vvzbAU+Jo7e7vwHvDoVr2XVKxzpytQSl56LudwWCC4iQ1m2kZpU5L
	 dTxqxjbMh0jlB26QK31EM6ci7rUI83bw8LWCuEzzYMC7AtlLpJVuZqxveISN0YZh03Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgcHg4zM;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64763606A6A8;
	Wed, 25 Nov 2026 07:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64763606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RgcHg4zM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795590786; x=1827126786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pUhfN28L2ucTd2H9ex1vTDJcXUGENUHQlpfC4H2Jf44=;
  b=RgcHg4zMeTLy1RlM7GNylKq8QUAJ4NFiLyU+22bnas9Wp8l84VQ4OT0c
   Hz5fT1EmlINp8W8BcStBXSr1d7VRpoHGEgnIhLCn2Jya1EBKYryPTvc5N
   WA4aJf+73OZiBS5SylsZia3C/e4whlgmxAH35idixs2MOHR0jDEnba8za
   /gEATTgwDt9x1XrFIMflIvCWEVkZECD2Kat87fSaryHaPfjNy2WEAhM3T
   g5pR0w7bpeIRobIZMizuHhh4PazXeOu69grW46Y/+5PAMA/pOemq9UBqL
   IWGfz0tPjGJnDwjS3VwjUam5XTUw69jhHKeY7ckrJzPqG7hRzP20PwOtD
   g==;
X-CSE-ConnectionGUID: InNjI77wS7qzo2KkF2nomw==
X-CSE-MsgGUID: Q0rCXIJuTzq55rwaDa8++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4458214"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4458214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 23:13:05 -0800
X-CSE-ConnectionGUID: duVJl/mtSk2ytQA8dKATPg==
X-CSE-MsgGUID: wwLwyDTZSaugKnl7BNHW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11776715"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 24 Nov 2026 23:13:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6C07E98; Wed, 25 Nov 2026 08:13:00 +0100 (CET)
Date: Wed, 25 Nov 2026 08:13:00 +0100
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
Message-ID: <20261125071300.GA191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
 <20261124161159.GT229695@black.igk.intel.com>
 <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>
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
In-Reply-To: <1aa3fa77b7e96509db6779bbb0cc74ce7c9a4ffb.camel@mediatek.com>

On Wed, Nov 25, 2026 at 06:43:38AM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-24 at 17:11 +0100, Mika Westerberg wrote:
> > On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> > > In preparation for modularizing PCIe NHI support and allowing PCIe
> > > and platform NHI drivers to be built as separate modules atop the
> > > Thunderbolt core framework, several NHI functions and structures
> > > will
> > > need to be exported.
> > > 
> > > Currently, several of these functions lack standard subsystem
> > > prefixes,
> > > risking namespace pollution or collisions across the flat kernel
> > > symbol
> > > namespace:
> > > 
> > > - ring_msix() lacks any subsystem prefix and diverges from all
> > > other
> > >   exported ring functions in the driver, which use the "tb_ring_"
> > > prefix.
> > > - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard
> > > "tb_"
> > >   prefix used across the Thunderbolt public interface (such as
> > > struct
> > >   tb_nhi and struct tb_nhi_ops).
> > > - nhi_msi() is named after PCI MSI, even though the ISR simply
> > > schedules
> > >   the interrupt work and can serve as a generic ISR for non-PCIe
> > > platform
> > >   controllers as well.
> > > 
> > > Rename these functions and symbols to conform to Thunderbolt
> > > subsystem
> > > naming conventions before exporting them:
> > > 
> > > - ring_msix       -> tb_ring_msix
> > 
> > I think we can move MSI-X completely to pci.c. As far as I can tell
> > ARM
> > stuff is not going to need that. While there we can drop MSI, that
> > has been
> > never used (MSI-X was supported from day 0 by the HW).
> If move MSI-X completely to pci.c, then will rename and export another
> two functions:
> __ring_interrupt()
> ring_interrupt_index()
> 
> is it fine for you?

No that's even worse :( But I was thinking that we can do the same for MSIX
as for regular interrupt in nhi.c:

  nhi->irq set -> request_irq() for that
  ring->irq set -> request_irq() for that

This would hopefully limit the number of functions we need to export. Maybe
it allows us to get rid of the .request_ring_irq and the like in the
tb_nhi_ops?
